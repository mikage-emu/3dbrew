+++
title = 'Gamecards'
+++

![](Gamecard.jpg "Gamecard.jpg") ![](GamecardPhy.jpg "GamecardPhy.jpg")

### Physical interface

The 3DS gamecards have the same physical interface as regular DS and DSi
gamecards. There is only a minor cosmetic difference in the plastic
case, which has a small extruding notch on the top-right side. As such,
it prevents insertion of the gamecard into old Nintendo DS or DSi
systems.

When modifying the case so that the 3DS gamecard fits in a DS or DSi
system, those systems will refuse to detect the gamecard and show no
banner icon.

| Pin | Name | Description                                                                                                                  |
|-----|------|------------------------------------------------------------------------------------------------------------------------------|
| 1   | GND  | Ground                                                                                                                       |
| 2   | CLK  | Clock. Frequencies 6.7MHz and 4.2MHz for DS/DSi gamecards, up to 16.6MHz for 3DS gamecards (for both SPI and ROM transfers). |
| 3   | NC   | Not connected. Possibly used to program cards.                                                                               |
| 4   | RCS  | ROM select, active low. Pulled low to start a ROM transfer.                                                                  |
| 5   | RST  | Reset, active low.                                                                                                           |
| 6   | ECS  | Savegame chip select, active low. Pulled low to start a savegame SPI transfer.                                               |
| 7   | IRQ  | Removal detection.                                                                                                           |
| 8   | VCC  | Powersupply 3.3V.                                                                                                            |
|     |      | ROM bus (selected by RCS)                                                                                                    |
| 9   | DAT0 | Bidirectional data bus.                                                                                                      |
| 10  | DAT1 |                                                                                                                              |
| 11  | DAT2 |                                                                                                                              |
| 12  | DAT3 |                                                                                                                              |
| 13  | DAT4 |                                                                                                                              |
| 14  | DAT5 |                                                                                                                              |
| 15  | DAT6 |                                                                                                                              |
| 16  | DAT7 |                                                                                                                              |
| 17  | GND  | Ground                                                                                                                       |

|                           | 3DS                                                                                                                        | DS and DSi                             |
|---------------------------|----------------------------------------------------------------------------------------------------------------------------|----------------------------------------|
| VCC                       | Only enabled when the power supply bits of [CFG9_CARDSTATUS](CONFIG9_Registers#CFG9_CARDSTATUS "wikilink") are set to `10` | Always available when card is detected |
| Card-detect               | Physical insertion switch, readable through [CFG9_CARDSTATUS](CONFIG9_Registers#CFG9_CARDSTATUS "wikilink") bit 0          | IRQ pin                                |
| Time to first clock pulse | ~280ms                                                                                                                     | ~166ms                                 |

### SPI flash

Savegame SPI flash transfers use CPOL=1 and CPHA=1. So far, only one
savegame FLASH chip has been identified. The chip identifies as
`0xC22211`. The JEDEC manufacturer ID is Macronix, and despite the chip
label saying 25L1001, the JEDEC ID matches the MX25L1021E. Datasheet
at:
[Macronix (Rev. 1.3, nov. 11,
2013)](https://www.macronix.com/Lists/Datasheet/Attachments/8796/MX25L1021E,%203V,%201Mb,%20v1.3.pdf)
[Old version mirror (Rev. 0.01, apr. 07,
2010)](https://web.archive.org/web/20160307235354/http://www.beilenet.com/download/MX25L1021E,%203V,%201Mb,%20v0.01.pdf)
However, the MX25L1021E doesn't support the 4 bit wide transmission that
the 3DS uses to talk to the SPI flash. It is thus likely that this is a
custom flash chip.

### Format

Cartridges can come in several sizes and include system updates in a
region reserved for this. In ROMs less than 1GB the update region can be
found with: CART_SIZE_MAX-( 0x280000\*(CART_SIZE_MAX/CART_SIZE_128MB)
)-0x2000000. The region is then 0x2000000 bytes.

### Protocol

The communication protocol between the 3DS system and the 3DS gamecard
has changed almost completely in comparison with the [DS and DSi
gamecard communication
protocol](http://problemkaputt.de/gbatek.htm#dscartridgeprotocol).

The protocol begins in a DS-compatible 8-byte command mode
(unencrypted). It switches to a 3DS-only 16-byte mode (encrypted) after
the 0x3e command. When 16-byte commands are used, the data bus maintains
the value 0x00 until the card signals it is ready by clocking a single
byte 0x01, followed by the actual data. After each 0x200-byte block of
actual data, a 4-byte standard CRC32 of the block data (before
encryption, polynomial 0x82608edb and the final output is xored with
0xffffffff) follows.

Here's a set of sample gamecard commands for the title LEGO Star Wars
III The Clone Wars (EUR), title ID 0004000000038c00, that a 3DS sends to
a 3DS gamecard:

| Size   | Command                            | Decrypted command                  | Description                                              |
|--------|------------------------------------|------------------------------------|----------------------------------------------------------|
| `2000` | `9F00000000000000`                 | `9F00000000000000`                 | Reset                                                    |
| `0000` | `71C93FE9BB0A3B18`                 | `71C93FE9BB0A3B18`                 | Signal that the gamecard should act as a 3DS gamecard    |
| `0004` | `9000000000000000`                 | `9000000000000000`                 | Get gamecard ID1, response=9000FEC2                      |
| `0004` | `9000000000000000`                 | `9000000000000000`                 | Get gamecard ID1, response=9000FEC2                      |
| `0004` | `A000000000000000`                 | `A000000000000000`                 | Get gamecard ID2, response=00000000                      |
| `0000` | `3E00000000000000`                 | `3E00000000000000`                 | Enter 16-byte command mode                               |
| `0200` | `82000000000000000000000000000000` | `82000000000000000000000000000000` | Get gamecard header and enable encryption                |
| `0000` | `F32C92D85C9D44DED3E0E41DBE7C90D9` | `8300000000000000708DF1A731717D0B` | Seed (rekey cryptography)                                |
| `0004` | `696B9D8582FB55D31B68CAFE70C74A95` | `A200000000000000708DF1A731717D0B` | Get gamecard ID1 (using cryptography), response=9000FEC2 |
| `0004` | `BAA4812CA0AC9C5D19399530E3ACCCAB` | `A300000000000000708DF1A731717D0B` | Get gamecard ID2 (using cryptography)                    |
| `0000` | `178E427C22D87ADB86387249A97D321A` | `C500000000000000708DF1A731717D0B` | Refresh cart NAND                                        |
| `0004` | `E06019B1BD5C9130ED6A4D9F4A9E7193` | `A200000000000000708DF1A731717D0B` | Get gamecard ID1 (using cryptography), response=9000FEC2 |
| `0004` | `4E0D224862523BBFE2E6255F80E15F37` | `A200000000000000708DF1A731717D0B` | Get gamecard ID1 (using cryptography), response=9000FEC2 |
| `0004` | `4CDF93D319FB62D0DB632A45E3E8D84C` | `A200000000000000708DF1A731717D0B` | Get gamecard ID1 (using cryptography), response=9000FEC2 |
| `0004` | `9AA5D80551002F955546D296A57F0FEF` | `A200000000000000708DF1A731717D0B` | Get gamecard ID1 (using cryptography), response=9000FEC2 |
| `0004` | `C12BA81AEF30DDDBD93FAD5D544C6334` | `A200000000000000708DF1A731717D0B` | Get gamecard ID1 (using cryptography), response=9000FEC2 |
| `0200` | `62EC5FB7F420AE1DC6253AE18AFA5BB3` | `BF000000000000000000000000000000` | Read gamecard at address 0                               |
| `0200` | `E3FA23AA016BE0C93430D1F42FF41324` | `BF000000000040000000000000000000` | Read gamecard at address 0x4000                          |

The header command has some initial dummy bytes, and eventually responds
with the 0x200 byte [InitialData](NCSD#InitialData "wikilink"). Here's
an example for Lego Starwars 3:

`0000000: 00 8c 03 00 00 00 04 00 00 00 00 00 00 00 00 00  ................`
`0000010: b3 cf fb c6 6a b1 cb 20 32 af ce 35 d4 1c 74 c9  ....j.. 2..5..t.`
`0000020: 8e 6b 27 2f 08 01 28 3b d4 30 de 44 37 f5 b0 46  .k'/..(;.0.D7..F`
`0000030: 91 59 d7 38 33 48 df 83 fd 71 84 2c 00 00 00 00  .Y.83H...q.,....`
`0000040: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000050: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000060: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000070: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000080: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000090: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000a0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000b0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000c0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000d0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000e0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`00000f0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000100: 4e 43 43 48 7a 7f 0e 00 00 8c 03 00 00 00 04 00  NCCHz...........`
`0000110: 36 34 02 00 00 00 00 00 00 8c 03 00 00 00 04 00  64..............`
`0000120: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000130: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000140: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0000150: 43 54 52 2d 50 2d 41 4c 47 50 00 00 00 00 00 00  CTR-P-ALGP......`
`0000160: 0c 27 e3 c1 de 7b 2a e2 d3 11 4f 32 a4 ee bf 46  .'...{*...O2...F`
`0000170: 9a fd 0c f3 52 c1 1d 49 84 c2 a9 f1 d2 14 4c 63  ....R..I......Lc`
`0000180: 00 04 00 00 00 00 00 00 00 00 00 00 01 03 00 00  ................`
`0000190: 05 00 00 00 01 00 00 00 00 00 00 00 00 00 00 00  ................`
`00001a0: 06 00 00 00 1c 0a 00 00 01 00 00 00 00 00 00 00  ................`
`00001b0: 22 0a 00 00 58 75 0e 00 01 00 00 00 00 00 00 00  "...Xu..........`
`00001c0: 13 0c 04 26 15 f6 47 c4 c6 32 25 ea 9e 67 f8 a2  ...&..G..2%..g..`
`00001d0: 7b 15 24 6b 88 fb c7 a9 27 25 7b 84 97 7b 78 7b  {.$k....'%{..{x{`
`` 00001e0: a6 5b ee 10 60 bb 6a 68 21 bb ce c6 00 03 5b 7e  .[..`.jh!.....[~ ``
`00001f0: 64 fb 6e ac a7 f0 96 0c fb 1f 5a 37 08 77 28 f7  d.n.......Z7.w(.`

After the 0x82 command, cryptography is initialized, which can be
reproduced following this algorithm; unless noted otherwise, all
operations are in big endian byte order:

1.  Set the [AES keyslot 0x3b keyY](AES_Registers "wikilink") to the
    values at 0x000:0x010. The corresponding keyX is set in
    [Boot9](Bootloader "wikilink").
2.  Decrypt the 16 bytes at 0x010:0x020 using AES-128-CCM in keyslot
    0x3b using the 12-byte nonce at 0x030:0x03c to obtain the primary
    seed; if the response to the 0xa0 command AND 0x00000003 equals 3,
    instead use slot 0x11 and set the normalkey to
    0x00000000000000000000000000000000. Verify that the 16-byte tag at
    0x020:0x030 is valid.
3.  Split the primary seed into two halves: left and right.
4.  Initialize a context for the SNOW 2.0 stream cipher. The 128-bit key
    is the primary seed. The 128-bit IV is a 128-bit static value
    depending on the gamecard ID2.
5.  Call the SNOW 2.0 stream cipher 32 times to obtain 1024 bits (32
    words) of output. Discard them.
6.  Initialize a context for the RC4 stream cipher. The 256-bit key
    consists of a 128-bit static value depending on the gamecard ID2
    followed by four outputs of the SNOW 2.0 stream.
7.  Call the RC4 stream cipher 256 times to obtain 2048 bits (256 bytes)
    of output. Discard them.

All commands and responses are now encrypted using RC4. The gamecard
controller and gamecard itself share the RC4 key and advance the state
accordingly.

If the 0x83 command is sent, the cryptography is re-keyed:

1.  Initialize a new context for the SNOW 2.0 stream cipher. The 128-bit
    key consists of the left half of the primary seed followed by the
    lower 64 bytes of the decrypted 0x83 command. The 128-bit IV is the
    same 128-bit static value depending on the gamecard ID2 as before.
2.  Call the SNOW 2.0 stream cipher 32 times to obtain 1024 bits (32
    words) of output. Discard them.
3.  Initialize a new context for the RC4 stream cipher. The 256-bit key
    consists of the same 128-bit static value depending on the gamecard
    ID2 as before followed by four outputs of the new SNOW 2.0 stream.
4.  Call the RC4 stream cipher 256 times to obtain 2048 bits (256 bytes)
    of output. Discard them.

The above example commands can be decrypted in this manner.

The static values are fixed in the gamecard controller and gamecards
themselves, they are not obtained from Process9 or anywhere in
NATIVE_FIRM.