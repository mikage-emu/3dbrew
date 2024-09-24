This page documents the format of NCSD.

## Overview

There are two known specialisations of the NCSD container format. The
CTR Cart Image (CCI) format and the 3DS' raw [NAND
format](Flash_Filesystem#NAND_structure "wikilink"). CCI is the format
of game ROM images.

**CTR System Update (CSU)** is a variant of CCI, where the only
difference is in the file extension. This is used with developer System
Updates and associated
[Tools](3DS_Development_Unit_Software "wikilink").

NCSD images start with a NCSD header, followed by up to a maximum of 8
[NCCH](NCCH "wikilink") partitions.

For CCI images, the partitions are reserved as follows:

| [NCCH](NCCH "wikilink") Index | Reserved Use                                                                           |
|-------------------------------|----------------------------------------------------------------------------------------|
| 0                             | Executable Content ([CXI](NCCH#CXI "wikilink"))                                        |
| 1                             | E-Manual ([CFA](NCCH#CFA "wikilink"))                                                  |
| 2                             | [Download Play](Download_Play "wikilink") Child container ([CFA](NCCH#CFA "wikilink")) |
| 6                             | New3DS [Update Data](System_Update_CFA "wikilink") ([CFA](NCCH#CFA "wikilink"))        |
| 7                             | [Update Data](System_Update_CFA "wikilink") ([CFA](NCCH#CFA "wikilink"))               |

The format of partitions can be determined from the partition FS flags
(normally these are zero for CCI/CSU NCSD Images).

## NCSD header

| Offset | Size          | Description                                                                         |
|--------|---------------|-------------------------------------------------------------------------------------|
| 0x000  | 0x100         | RSA-2048 SHA-256 signature of the NCSD header                                       |
| 0x100  | 4             | Magic Number 'NCSD'                                                                 |
| 0x104  | 4             | Size of the NCSD image, in media units (1 media unit = 0x200 bytes)                 |
| 0x108  | 8             | Media ID                                                                            |
| 0x110  | 8             | Partitions FS type (0=None, 1=Normal, 3=FIRM, 4=AGB_FIRM save)                      |
| 0x118  | 8             | Partitions crypt type (each byte corresponds to a partition in the partition table) |
| 0x120  | 0x40=(4+4)\*8 | Offset & Length partition table, in media units                                     |
| 0x160  | 0xA0          | ...                                                                                 |

For carts,

| Offset | Size      | Description                                                                                                                                                                                                                                                                                                                                             |
|--------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x160  | 0x20      | Exheader SHA-256 hash                                                                                                                                                                                                                                                                                                                                   |
| 0x180  | 0x4       | Additional header size                                                                                                                                                                                                                                                                                                                                  |
| 0x184  | 0x4       | Sector zero offset                                                                                                                                                                                                                                                                                                                                      |
| 0x188  | 8         | Partition Flags (See Below)                                                                                                                                                                                                                                                                                                                             |
| 0x190  | 0x40=8\*8 | Partition ID table                                                                                                                                                                                                                                                                                                                                      |
| 0x1D0  | 0x20      | Reserved                                                                                                                                                                                                                                                                                                                                                |
| 0x1F0  | 0xE       | Reserved?                                                                                                                                                                                                                                                                                                                                               |
| 0x1FE  | 0x1       | Support for this was implemented with [9.6.0-X](9.6.0-24 "wikilink") FIRM. Bit0=1 enables using bits 1-2, it's unknown what these two bits are actually used for(the value of these two bits get compared with some other value during NCSD verification/loading). This appears to enable a new, likely hardware-based, antipiracy check on cartridges. |
| 0x1FF  | 0x1       | Support for this was implemented with [9.6.0-X](9.6.0-24 "wikilink") FIRM, see below regarding save crypto.                                                                                                                                                                                                                                             |

For NAND,

| Offset | Size | Description                                                                                              |
|--------|------|----------------------------------------------------------------------------------------------------------|
| 0x160  | 0x5E | Unknown                                                                                                  |
| 0x1BE  | 0x42 | Encrypted MBR partition-table, for the TWL partitions(key-data used for this keyslot is console-unique). |

### NCSD Signature

The RSA public key used for gamecard NCSD is stored in
[ITCM](Memory_layout "wikilink"). The separate public key used for NAND
NCSD is stored in Process9 .(ro)data instead of ITCM, and in [boot
ROM](Bootloader "wikilink").

For the boot ROM check, sighax may be used to fake-sign NAND headers.
Process9's check will fail, however, unless patched.

### Partition Flags

| Byte Index | Description                                                                                                                                                                                                             |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Backup Write Wait Time (The time to wait to write save to backup after the card is recognized (0-255 seconds)).NATIVE_FIRM loads this flag from the gamecard NCSD header starting with [6.0.0-11](6.0.0-11 "wikilink"). |
| 3          | Media Card Device (1 = NOR Flash, 2 = None, 3 = BT) (SDK 3.X+)                                                                                                                                                          |
| 4          | Media Platform Index (1 = CTR)                                                                                                                                                                                          |
| 5          | Media Type Index (0 = Inner Device, 1 = Card1, 2 = Card2, 3 = Extended Device)                                                                                                                                          |
| 6          | Media Unit Size i.e. u32 MediaUnitSize = 0x200\*2^flags\[6\];                                                                                                                                                           |
| 7          | Media Card Device (1 = NOR Flash, 2 = None, 3 = BT) (Only SDK 2.X)                                                                                                                                                      |

### Partition Flags (In Terms of Save Crypto Determination)

| Byte Index | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 1          | Starting with [6.0.0-11](6.0.0-11 "wikilink") NATIVE_FIRM will use this flag to determine the gamecard [savegame](Savegames "wikilink") keyY method, when flag\[3\] is set. 0 = [2.0.0-2](2.0.0-2 "wikilink") hashed keyY, 1 = [new](Savegames "wikilink") keyY method implemented with [6.0.0-11](6.0.0-11 "wikilink"). 0x0A = implemented with [9.3.0-X](9.3.0-21 "wikilink"). On Old3DS this is identical to the [2.2.0-4](2.2.0-4 "wikilink") crypto. On New3DS this is identical to the [2.2.0-4](2.2.0-4 "wikilink") crypto, except with New3DS-only gamecard savedata [keyslots](AES "wikilink"). Starting with [9.6.0-X](9.6.0-24 "wikilink") FIRM, Process9 now sets <savecrypto_stateval> to partitionflag\[1\] + \<the u8 value from NCSD+0x1FF\>, instead of just setting it to partitionflag\[1\]. |
| 3          | Support for this flag was implemented in NATIVE_FIRM with [2.0.0-2](2.0.0-2 "wikilink"). When this flag is set the hashed gamecard [savegame](Savegames "wikilink") keyY method is used, this likely still uses the repeating-CTR however. With [6.0.0-11](6.0.0-11 "wikilink") the system will determine the gamecard savegame keyY method via flag\[1\], instead of just using the hashed keyY via this flag. \|-th                                                                                                                                                                                                                                                                                                                                                                                           |

Starting with [9.6.0-X](9.6.0-24 "wikilink") FIRM, Process9 will just
write val0 to a state field then return 0, instead of returning an error
when the save crypto type isn't recognized. This was the \*only\* actual
functionality change in the Old3DS Process9 function for gamecard
savedata crypto init.

## Card Info Header

| OFFSET | SIZE  | DESCRIPTION                                                                                |
|--------|-------|--------------------------------------------------------------------------------------------|
| 0x200  | 4     | CARD2: Writable Address In Media Units (For 'On-Chip' Savedata). CARD1: Always 0xFFFFFFFF. |
| 0x204  | 4     | Card Info Bitmask                                                                          |
| 0x208  | 0xF8  | Reserved                                                                                   |
| 0x300  | 4     | Filled size of cartridge                                                                   |
| 0x304  | 0xC   | Reserved                                                                                   |
| 0x310  | 2     | Title version                                                                              |
| 0x312  | 2     | Card revision                                                                              |
| 0x314  | 0xC   | Reserved                                                                                   |
| 0x320  | 8     | Title ID of [CVer](CVer "wikilink") in included update partition                           |
| 0x328  | 2     | Version number of [CVer](CVer "wikilink") in included update partition                     |
| 0x32A  | 0xCD6 | Reserved                                                                                   |
| 0x1000 | 0x200 | InitialData                                                                                |

### InitialData

This data is returned by [16-byte cartridge
command](Gamecards "wikilink") 0x82.

| OFFSET | SIZE  | DESCRIPTION                                                                                                                                                                                                                   |
|--------|-------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00   | 0x10  | Seed (keyY used to decrypt the title key - keyX is keyslot 0x3B for production cards, or a key of all zeroes for development cards), consisting of the title ID (little-endian) followed by reserved data (normally all-zero) |
| 0x10   | 0x10  | TitleKey (AES-CCM encrypted)                                                                                                                                                                                                  |
| 0x20   | 0x10  | AES-CCM MAC                                                                                                                                                                                                                   |
| 0x30   | 0xC   | AES-CCM nonce                                                                                                                                                                                                                 |
| 0x3C   | 0xC4  | Reserved (normally all-zero)                                                                                                                                                                                                  |
| 0x100  | 0x100 | NcchHeader (copy of the first NCCH header, excluding the RSA signature)                                                                                                                                                       |

## Development Card Info Header Extension

| OFFSET | SIZE   | DESCRIPTION         |
|--------|--------|---------------------|
| 0x1200 | 0x200  | CardDeviceReserved1 |
| 0x1400 | 0x10   | TitleKeyData        |
| 0x1410 | 0x1BF0 | CardDeviceReserved2 |
| 0x3000 | 0x1000 | TestData            |

TitleKeyData contains the decrypted version of the title key found in
the InitialData. This field appears to be what development--and maybe
production?--cards read to know what card encryption seed to use in the
CTR protocol.

The CardDeviceReserved areas have random-looking data whose purpose is
unknown, other than perhaps to hide the TitleKey.

Note that a particular flashcard vendor, namely Gateway, puts what many
refer to as "private headers" at CardDeviceReserved1 in place of actual
development card information. This header consists of:

| OFFSET | SIZE | DESCRIPTION                                                                                                                                                                                                                                                                         |
|--------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x40 | Unique cartridge ID; only the first 0x10 bytes are meaningful, the rest are 0xff; obtainable using encrypted [16-byte cartridge command](Gamecards "wikilink") 0xc6; the first 0x10 bytes can also be obtained in userland via [pxi:ps9::GetRomId](Process_Services_PXI "wikilink") |
| 0x40   | 0x4  | Cartridge ID1; obtainable using 8-byte cartridge command 0x90 or 16-byte cartridge command 0xa2                                                                                                                                                                                     |
| 0x44   | 0x4  | Cartridge ID2; obtainable using 8-byte cartridge command 0xa0 or 16-byte cartridge command 0xa4                                                                                                                                                                                     |
| 0x48   | 0x8  | Padding (all-0xff)                                                                                                                                                                                                                                                                  |

The legitimacy of the unique cartridge ID can be validated by online
services.

Some dumping tools, notably GodMode9 as of 2024-05-26, erroneously
always write 0x00000000 into the position of the Cartridge ID2. This is
presumably because the cartridge ID2 is always zero for retail carts.

### TestData

The test data is the same one encountered in development DS/DSi
cartridges. Its layout is as follows:

| OFFSET | SIZE  | DESCRIPTION                                                                                      |
|--------|-------|--------------------------------------------------------------------------------------------------|
| 0x0    | 0x8   | The bytes FF 00 FF 00 AA 55 AA 55.                                                               |
| 0x8    | 0x1F8 | An ascending byte sequence equal to the offset mod 256 (08 09 0A ... FE FF 00 01 ... FF).        |
| 0x200  | 0x200 | A descending byte sequence equal to 255 minus the offset mod 256 (FF FE FD ... 00 FF DE ... 00). |
| 0x400  | 0x200 | Filled with 00 (0b00000000) bytes.                                                               |
| 0x600  | 0x200 | Filled with FF (0b11111111) bytes.                                                               |
| 0x800  | 0x200 | Filled with 0F (0b00001111) bytes.                                                               |
| 0xA00  | 0x200 | Filled with F0 (0b11110000) bytes.                                                               |
| 0xC00  | 0x200 | Filled with 55 (0b01010101) bytes.                                                               |
| 0xE00  | 0x1FF | Filled with AA (0b10101010) bytes.                                                               |
| 0xFFF  | 0x1   | The final byte is 00 (0b00000000).                                                               |

Production cards always return FF when attempting to read 0x1200-0x3FFF.
They probably actually have the same data as development cards, but
there's no way to read it.

## Tools

[ctrtool](https://github.com/3dshax/ctr/tree/master/ctrtool) -
(CMD)(Windows/Linux) Parsing NCSD files

[3DSExplorer](3DSExplorer "wikilink") - (GUI)(Windows Only) Parsing NCSD
files

[Category:File formats](Category:File_formats "wikilink")