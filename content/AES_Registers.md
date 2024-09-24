## Registers

| Old3DS | Name                                            | Address    | Width | RW  |
|--------|-------------------------------------------------|------------|-------|-----|
| Yes    | [AES_CNT](#AES_CNT "wikilink")                  | 0x10009000 | 4     | RW  |
| Yes    | [AES_MACBLKCNT](#AES_MACEXTRABLKCNT "wikilink") | 0x10009004 | 2     | W   |
| Yes    | [AES_BLKCNT](#AES_BLKCNT "wikilink")            | 0x10009006 | 2     | W   |
| Yes    | [AES_WRFIFO](#AES_WRFIFO/AES_RDFIFO "wikilink") | 0x10009008 | 4     | W   |
| Yes    | [AES_RDFIFO](#AES_WRFIFO/AES_RDFIFO "wikilink") | 0x1000900C | 4     | R   |
| Yes    | AES_KEYSEL                                      | 0x10009010 | 1     | RW  |
| Yes    | [AES_KEYCNT](#AES_KEYCNT "wikilink")            | 0x10009011 | 1     | RW  |
| Yes    | [AES_CTR](#AES_CTR "wikilink")                  | 0x10009020 | 16    | W   |
| Yes    | [AES_MAC](#AES_MAC "wikilink")                  | 0x10009030 | 16    | W   |
| Yes    | AES_KEY0                                        | 0x10009040 | 48    | W   |
| Yes    | AES_KEY1                                        | 0x10009070 | 48    | W   |
| Yes    | AES_KEY2                                        | 0x100090A0 | 48    | W   |
| Yes    | AES_KEY3                                        | 0x100090D0 | 48    | W   |
| Yes    | AES_KEYFIFO                                     | 0x10009100 | 4     | W   |
| Yes    | AES_KEYXFIFO                                    | 0x10009104 | 4     | W   |
| Yes    | AES_KEYYFIFO                                    | 0x10009108 | 4     | W   |

## AES_CNT

| Bit   | Description                                                                                                   |
|-------|---------------------------------------------------------------------------------------------------------------|
| 4-0   | Write FIFO count (0-16)                                                                                       |
| 9-5   | Read FIFO count (0-16)                                                                                        |
| 10    | Flush write FIFO (1=Clear write FIFO)                                                                         |
| 11    | Flush read fifo (1=Clear read FIFO)                                                                           |
| 12-13 | Write FIFO DMA size (0=16, 1=12, 2=8, 3=4 words)                                                              |
| 14-15 | Read FIFO DMA size (0=4, 1=8, 2=12, 3=16 words)                                                               |
| 18-16 | MAC size (encoding = (maclen-2)/2)                                                                            |
| 19    | ? (MAC related)                                                                                               |
| 20    | MAC input control (0 = read MAC from FIFO, 1 = read from MAC register)                                        |
| 21    | MAC status (0 = invalid, 1 = verified)                                                                        |
| 22    | Output endianness (1=Big endian, 0=Little endian)                                                             |
| 23    | Input endianness (1=Big endian, 0=Little endian)                                                              |
| 24    | Output word order (1=Normal order, 0=Reversed order)                                                          |
| 25    | Input word order (1=Normal order, 0=Reversed order)                                                           |
| 26    | Update keyslot (selects the keyslot specified by AES_KEYSEL when this bit is set)                             |
| 29-27 | Mode (0=CCM decrypt, 1=CCM encrypt, 2=CTR, 3=CTR, 4=CBC decrypt, 5=CBC encrypt, 6=ECB decrypt, 7=ECB encrypt) |
| 30    | Interrupt enable (1=enable, 0=disable)                                                                        |
| 31    | Start (1=enable/busy, 0=idle)                                                                                 |

When bit31 is set, this register essentially becomes locked and doesn't
change when written to. However if bit26 is "set", keyslot-selection is
cued to be handled when bit31 is cleared.

Clearing bit31 while the AES engine is doing crypto will result in the
AES engine stopping crypto, once it finishes processing the current
block.

Read/Write FIFO counts and the MAC status can never be set by writing to
AES_CNT, they are read-only.

Changing the input word order triggers the key/keyX/keyY FIFOs to be
flushed.

## AES_MACEXTRABLKCNT

(CCM-MAC extra data length)\>\>4, i.e. the number of block of CCM-MAC
extra data.

## AES_BLKCNT

(Data length)\>\>4, i.e. the number of blocks to process

## AES_WRFIFO/AES_RDFIFO

The AES engine can accept up to 64 bytes of input data (16 32-bit words)
and can hold up to 64 bytes of output data at a time (for a total of 128
bytes of buffered data). Bits 12-13 and 14-15 in AES_CNT configure the
DMA request for the relevant FIFO (see above).

The input data for the AES crypto operation is written to AES_WRFIFO,
the output data is read from AES_RDFIFO.

Reading from AES_RDFIFO when there's no data available in the RDFIFO
will result in reading the last word that was in the RDFIFO.

When triggering either RDFIFO or WRFIFO to be flushed, the AES Engine
does not clear either buffer.

Word order and endianness can be changed between each read/write to
these FIFOs. However changing the word order when writing to WRFIFO can
cause the word to be written outside the current block, leaving
uninitialized data in its place. Attempts to change endianness or word
order are not honored when reading from RDFIFO when no more data is
available.

## AES_KEYCNT

| Bit | Description                                                                                                       |
|-----|-------------------------------------------------------------------------------------------------------------------|
| 5-0 | Keyslot                                                                                                           |
| 6   | Hardware key-generator type: 0 = 3DS, 1 = DSi.                                                                    |
| 7   | This normally has value 1 written here when updating keys. 0 = disable key FIFO flush, 1 = enable key FIFO flush. |

Bit6 is only used when keyslots \>=4 are used, value1 has the same
affect as doing key-init with the TWL keyslots. Bit6 is only checked
when a keyY was completely written, for when the final-normalkey needs
updated via the key-generator. Changing bit6 has no affect on the
generated normalkey when writing to this bit immediately after writing
the last keyY word.

## AES_CTR

This register specifies the counter (CTR mode), nonce (CCM mode) or the
initialization vector (CBC mode) depending on the mode of operation. For
CBC and CTR mode this register takes up the full 16 bytes, but for CCM
mode the nonce is only the first 12 bytes. The AES engine will
automatically increment the counter up to the maximum BLKCNT, after
which point it must be manually incremented and set again.

## AES_MAC

This register specifies the message authentication code (MAC) for use in
CCM mode.

## AES_KEY0/1/2/3

| Byte  | Description |
|-------|-------------|
| 0-15  | Normalkey   |
| 16-31 | KeyX        |
| 32-47 | KeyY        |

These registers are the same as they were on TWL, and are likely
preserved for compatibility reasons. The keyslot is updated immediately
after \*any\* data(u8/u32/...) is written here, which was used on DSi to
[break](3DS_System_Flaws "wikilink") the key-generator.

## Endianness and word order

### AES_CNT.input_endianness

Swaps the bytes of 32-bit writes to AES_CTR, AES_WRFIFO, AES_KEY\*FIFO
according to specified endianness. AES_MAC?

### AES_CNT.output_endianness

Swaps the bytes of 32-bit reads from AES_RDFIFO.

### AES_CNT.input_word_order

If reversed, writes to AES_KEY\*FIFO and AES_WRFIFO fill the FIFO
backwards. For AES_WRFIFO, this means that every 16-byte block will have
its words in the reverse order, but the order of these blocks remains
the same. AES_CTR is unaffected by this field. AES_MAC?

### AES_CNT.output_word_order

If reversed, reads from AES_RDFIFO will drain the FIFO backwards. This
means that every 16-byte output block will have its words in the reverse
order, but the order of these blocks remains the same.

## CCM mode pitfall

Non-standard AES-CCM behaviour is observed on
[Wrap](APT:Wrap "wikilink")/[Unwrap](APT:Unwrap "wikilink") function.
According to [RFC 3610](https://tools.ietf.org/html/rfc3610), the first
block B_0 for authentication should be generated from the message length
and some other parameters. Using these function, it seems that the
message length is aligned up to 16 when generating B_0. This makes the
generated MAC not compliant with the standard when
(inputsize-noncesize)%16!=0. It is very likely that this non-standard
behaviour happens on the hardware level, but not confirmed yet.

## Keyslot ranges

This is approximately a table of what is set by bootrom before booting
into FIRM. Often it appears that keyslots in groups of 4 have the same
keyX, and sometimes also same keyY set.

| Keyslot   | Name                 | KeyX                                                           | KeyY/Normal-key                                                                     | Console unique.                                                                                                  |
|-----------|----------------------|----------------------------------------------------------------|-------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------|
| 0x00-0x03 | TWL keys.            | Probably unset.                                                | Probably unset.                                                                     | \-                                                                                                               |
| 0x04-0x07 | NAND partition keys. | Same for all.                                                  | Different for all.                                                                  | Yes                                                                                                              |
| 0x08-0x0B | See below.           | Same for all.                                                  | Different for all.                                                                  | Yes                                                                                                              |
| 0x0C-0x0F | SSL cert key.        | Same for all.                                                  | Same for all, normalkeys-only.                                                      | The keyXs are console-unique, however the normalkeys setup by Boot9 later during keyinit are not console-unique. |
| 0x10-0x17 | \-                   | Set for all except 0x11..0x13. Keydata is different for these. | Normalkey, same for all except the last 4 are all different.                        | \-                                                                                                               |
| 0x18-0x1B | Never used.          | Same for all.                                                  | Same for all, normalkeys-only.                                                      | The keyXs are console-unique, however the normalkeys setup by Boot9 later during keyinit are not console-unique. |
| 0x1C-0x1F | Never used.          | Same for all.                                                  | Same for all, normalkeys-only.                                                      | The keyXs are console-unique, however the normalkeys setup by Boot9 later during keyinit are not console-unique. |
| 0x20-0x23 | Never used.          | Same for all.                                                  | Same for all, normalkeys-only.                                                      | The keyXs are console-unique, however the normalkeys setup by Boot9 later during keyinit are not console-unique. |
| 0x24      | Never used.          | Individually set.                                              | Individually set, normalkey-only.                                                   | The keyX is console-unique, however the normalkey setup by Boot9 later during keyinit is not console-unique.     |
| 0x25-0x27 | \-                   | Not set.                                                       | Same for all, normalkeys-only. Same keydata as keyslot 0x24.                        | No                                                                                                               |
| 0x28-0x2B | Never used.          | Individually set.                                              | Individually set, normalkeys-only. Keyslot 0x28 has same normalkey as keyslot 0x24. | The keyX is console-unique, however the normalkey setup by Boot9 later during keyinit is not console-unique.     |
| 0x2C-0x2F | Various uniques.     | Same for all.                                                  | Same for all, normalkeys-only.                                                      | No                                                                                                               |
| 0x30-0x33 | Various uniques.     | Same for all.                                                  | Same for all, normalkeys-only.                                                      | No                                                                                                               |
| 0x34-0x37 | Various uniques.     | Same for all.                                                  | Same for all, normalkeys-only.                                                      | No                                                                                                               |
| 0x38-0x3B | Various uniques.     | Same for all.                                                  | Same for all, normalkeys-only.                                                      | No                                                                                                               |
| 0x3C-0x3F | Various uniques.     | Individually set.                                              | Individually set, normalkeys-only. Keyslot 0x3C has same normalkey as 0x38-0x3B.    | No                                                                                                               |

Keyslot pairs (0x24, 0x28) and (0x38, 0x3C) shares the same normal-key,
while at the same time having different keyX's. This suggests they were
set to same normal-key by bootrom.

## Keyslots

There are 0x40 keyslots, each of which stores three keys called keyX,
keyY and normalkey. All keys can be set explicitly, but the normalkey
can optionally be generated using a hardware key generator instead (see
[below](#Hardware_key_generator "wikilink")). There is no way to read
the contents of a keyslot.

<table>
<thead>
<tr class="header">
<th><p>Keyslot</p></th>
<th><p>Description</p></th>
<th><p>KeyX set by</p></th>
<th><p>KeyY set by</p></th>
<th><p>Normal-key</p></th>
<th><p>Old3DS</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x00-0x03</p></td>
<td><p>TWL keys.</p></td>
<td><p>NATIVE_FIRM hard-boot.</p></td>
<td><p>NATIVE_FIRM hard-boot.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x04..0x07</p></td>
<td><p><a href="Flash_Filesystem" title="wikilink">NAND</a> partition
keys.</p>
<p>Keyslot is determined by <a href="NCSD" title="wikilink">NCSD</a>
partition FS type and encryption type. The New3DS Process9 sets the keyY
for keyslot 0x05 (New3DS CTRNAND) to a key from .(ro)data. Its keyX is
console-unique and set by the bootloader.</p></td>
<td><p>Bootrom.</p></td>
<td><p>Bootrom.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x0A</p></td>
<td><p>DSiWare export key.</p>
<p>Used for encrypting the all-zero 0x10-byte block in the <a
href="DSiWare_Exports" title="wikilink">DSiWare_Exports</a> header.
Console-unique.</p></td>
<td><p>See above keyslot info.</p></td>
<td><p>See above keyslot info.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x0B</p></td>
<td><p>This is console-unique. This keyslot is used for the NAND <a
href="Title_Database" title="wikilink">dbs</a> images AES-CMACs, and the
<a href="Nand/private/movable.sed"
title="wikilink">Nand/private/movable.sed</a> AES-CMAC(when
used).</p></td>
<td><p>See above keyslot info.</p></td>
<td><p>See above keyslot info.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x0D</p></td>
<td><p>SSL-certificate key.</p>
<p>See <a href="PSPXI:EncryptDecryptAes"
title="wikilink">EncryptDecryptAes</a>.</p></td>
<td><p>-</p></td>
<td><p>-</p></td>
<td><p>Bootrom.</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x11</p></td>
<td><p>Temporary keyslot.</p>
<p>Used by FIRM for general normal-key crypto. Also used by the New3DS
<a href="FIRM" title="wikilink">FIRM</a> arm9 binary loader.</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x14</p></td>
<td><p>Starting with <a href="5.0.0-11" title="wikilink">5.0.0-11</a>,
NATIVE_FIRM Process9 now sets the keyY for this to the same one it uses
for initializing 3 of the keyslots' keyYs from <a
href="PSPXI:EncryptDecryptAes" title="wikilink">here</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM boot.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x15</p></td>
<td><p>Used/initialized by the New3DS arm9 binary loader, see <a
href="FIRM" title="wikilink">here</a>.</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>See previous info for this keyslot.</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p>0x16</p></td>
<td><p>Used/initialized by the New3DS arm9 binary loader starting with
<a href="9.5.0-22" title="wikilink">9.5.0-X</a>, see <a href="FIRM"
title="wikilink">here</a>.</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>See previous info for this keyslot.</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p>0x18..0x1F</p></td>
<td><p>These are the New3DS keyslots, where the keyX is generated with
keyslot 0x11 by the New3DS arm9 binary <a href="FIRM"
title="wikilink">loader</a>. As of <a href="FIRM"
title="wikilink">FIRM</a> <a href="9.6.0-24"
title="wikilink">9.6.0-X</a> keyslots 0x1C..0x1F are not yet used by
Process9.</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>NATIVE_FIRM / see previous info for these keyslots.</p></td>
<td><p>See previous info for these keyslots.</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p>0x18</p></td>
<td><p>New3DS <a href="9.3.0-21" title="wikilink">9.3.0-X</a> <a
href="NCCH" title="wikilink">NCCH</a> key, when ncchflag[3] is
0x0A.</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>NATIVE_FIRM</p></td>
<td><p>-</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p>0x19</p></td>
<td><p>New3DS gamecard <a href="Savegames" title="wikilink">savedata</a>
AES-CMAC key.</p>
<p>Equivalent of keyslot 0x33, used when a <a href="NCSD"
title="wikilink">NCSD</a> flag is set to a certain value (implemented
with <a href="9.3.0-21" title="wikilink">9.3.0-X</a>).</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>NATIVE_FIRM</p></td>
<td><p>-</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p>0x1A</p></td>
<td><p>New3DS gamecard <a href="Savegames" title="wikilink">savedata</a>
actual key.</p>
<p>Equivalent of keyslot 0x37, used when a <a href="NCSD"
title="wikilink">NCSD</a> flag is set to a certain value (implemented
with <a href="9.3.0-21" title="wikilink">9.3.0-X</a>).</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>NATIVE_FIRM</p></td>
<td><p>-</p></td>
<td><p>No</p></td>
</tr>
<tr class="even">
<td><p>0x1B</p></td>
<td><p>New3DS <a href="9.6.0-24" title="wikilink">9.6.0-X</a> <a
href="NCCH" title="wikilink">NCCH</a> key, when ncchflag[3] is
0x0B.</p></td>
<td><p>Arm9Loader.</p></td>
<td><p>NATIVE_FIRM</p></td>
<td><p>-</p></td>
<td><p>No</p></td>
</tr>
<tr class="odd">
<td><p>0x24</p></td>
<td><p>AGB_FIRM savegame AES-CMAC key.</p></td>
<td><p>Bootrom.</p></td>
<td><p>AGB/NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x25</p></td>
<td><p><a href="7.0.0-13" title="wikilink">v7.0</a> <a href="NCCH"
title="wikilink">NCCH</a> key, when ncchflag[3] is 0x01.</p></td>
<td><p>NATIVE_FIRM <a href="Savegames#6.0.0-11_Savegame_keyY"
title="wikilink">boot</a>.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x2C</p></td>
<td><p>Original <a href="NCCH" title="wikilink">NCCH</a> key, when
ncchflag[3] is 0x00 and always for certain NCCH sections.</p></td>
<td><p>Bootrom.</p></td>
<td><p>Process9.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x2D</p></td>
<td><p>UDS local-WLAN CCMP key.</p>
<p>See <a href="PSPXI:EncryptDecryptAes"
title="wikilink">EncryptDecryptAes</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>Bootrom.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x2E</p></td>
<td><p>Streetpass key.</p>
<p>See <a href="PSPXI:EncryptDecryptAes"
title="wikilink">EncryptDecryptAes</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x2F</p></td>
<td><p><a href="Savegames#6.0.0-11_Savegame_keyY"
title="wikilink">v6.0</a> save key.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x30</p></td>
<td><p>SD/NAND AES-CMAC key.</p>
<p>This keyY is initialized via <a href="Nand/private/movable.sed"
title="wikilink">movable.sed</a>. This is used for calculating the
AES-CMACs under SD <a href="SD_Filesystem" title="wikilink">/Nintendo
3DS/<ID0>/<ID1>/</a> (except <a href="DSiWare_Exports"
title="wikilink">DSiWare_Exports</a>) and <a href="Flash_Filesystem"
title="wikilink">NAND</a> /data/.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x31</p></td>
<td><p>APT wrap key.</p>
<p>See <a href="PSPXI:EncryptDecryptAes"
title="wikilink">EncryptDecryptAes</a>. NATIVE_FIRM sets this keyY to
the same one used for keyslot 0x2E.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x32</p></td>
<td><p>Unknown.</p>
<p>See <a href="PSPXI:EncryptDecryptAes"
title="wikilink">EncryptDecryptAes</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>Bootrom.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x33</p></td>
<td><p>Gamecard <a href="Savegames" title="wikilink">savedata</a>
AES-CMAC.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x34</p></td>
<td><p>SD key.</p>
<p>This keyY is initialized via <a href="Nand/private/movable.sed"
title="wikilink">movable.sed</a>. This is used for encrypting *all* SD
card data under <a href="SD_Filesystem" title="wikilink">/Nintendo
3DS/<ID0>/<ID1>/</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x35</p></td>
<td><p>Movable.sed key.</p>
<p>This is the keyslot used for movable.sed encryption + AES-CBC MAC
with the import/export <a href="FSPXI:ImportIntegrityVerificationSeed"
title="wikilink">commands</a>. The keyYs used for crypto/CMAC are
different, but both can be found in process9 rodata.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x36</p></td>
<td><p>Unknown. Used by friends module.</p>
<p>See <a href="PSPXI:EncryptDecryptAes"
title="wikilink">EncryptDecryptAes</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>Bootrom.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x37</p></td>
<td><p>Gamecard <a href="Savegames" title="wikilink">savedata</a> actual
key.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x38</p></td>
<td><p>BOSS key.</p>
<p>See <a href="PSPXI:EncryptDecryptAes"
title="wikilink">EncryptDecryptAes</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>Bootrom.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x39</p></td>
<td><p>Download Play key, and the actual NFC key for generating retail
<a href="Amiibo" title="wikilink">Amiibo</a> keys.</p>
<p>This keyslot is used for two different keys. Both are available via
<a href="PSPXI:EncryptDecryptAes"
title="wikilink">EncryptDecryptAes</a>. NATIVE_FIRM sets this keyY to
the same one used for keyslot 0x2E.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x3A</p></td>
<td><p>DSiWare export key.</p>
<p>This keyY is initialized via <a href="Nand/private/movable.sed"
title="wikilink">movable.sed</a>. This is used for calculating the
AES-CMACs for SD <a href="DSiWare_Exports"
title="wikilink">DSiWare_Exports</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x3B</p></td>
<td><p><a href="CTRCARD_Registers#CTRCARD_SECSEED"
title="wikilink">CTR-CARD hardware-crypto seed</a> decryption key.</p>
<p>AES-CCM is used, the keyY, nonce and MAC are stored in the <a
href="NCSD#Card_Info_Header" title="wikilink">Card Info
Header</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="odd">
<td><p>0x3D</p></td>
<td><p>Common key.</p>
<p>Used to decrypt title keys in <a href="Ticket"
title="wikilink">Ticket</a>.</p></td>
<td><p>Bootrom.</p></td>
<td><p>NATIVE_FIRM.</p></td>
<td><p>-</p></td>
<td><p>Yes</p></td>
</tr>
<tr class="even">
<td><p>0x3F</p></td>
<td><p>Used for various internal Boot9 crypto operations, different
keydata for each one. Used to decrypt the <a href="OTP_Registers"
title="wikilink">OTP</a>, the FIRM sections when <a
href="Bootloader#Non-NAND_FIRM_boot" title="wikilink">booting from
non-NAND</a>, and when generating the console-unique keys.</p>
<p>The keydata for this keyslot is overwritten with other keydata before
booting FIRM. This keyslot is not known to be used post-Boot9.</p></td>
<td><p>Bootrom.</p></td>
<td><p>Bootrom.</p></td>
<td><p>Bootrom.</p></td>
<td><p>Yes</p></td>
</tr>
</tbody>
</table>

### Updating keydata

The contents of the keyslot specified in AES_KEYCNT can be updated by
consecutively writing four words to AES_KEYXFIFO (keyX),
AES_KEYYFIFO(keyY), or AES_KEYFIFO (normalkey).

After writing to a keyslot, the keyslot must be selected again(write
AES_KEYSEL + set AES_CNT bit26), even when writing to the same keyslot.
Writing the last word to a key FIFO immediately after selecting a
keyslot will not affect the keyslot keydata that gets used at that time,
the new keydata will not get used until the keyslot gets selected again.

Writing to the key FIFOs with byte writes results in the AES engine
converting the byte to a word for setting the key word, with this: word
= (byteval) \| (byteval\<\<8) \| (byteval\<\<16) \| (byteval\<\<24). The
result is the same regardless of which FIFO register byte was written
to.

The TWL keyslots 0x00-0x03 can be set directly by writing to the
AES_KEY0-AES_KEY3 registers.

The key FIFOs can be written simultaneously. For example, executing the
following will result in the keyX and keyY being set to all-zero(unknown
for normalkey): memset(0x10009100, 0, 0x100);

Each key FIFO has a 0x10-byte tmp-buffer for storing the words written
to that FIFO. Once the last word is written to a key FIFO, the filled
tmp-buffer is then written to the key-data for the keyslot selected by
AES_KEYCNT at the time the last word was written.

### Hardware key generator

A dedicated hardware key generator can be used to generate a keyslot's
normal-key from its keyX and keyY. The hardware key generator is
triggered by writing the keyY, which is the only way to trigger it with
the 3DS keyslots.

The algorithm for generating the normal-key from keyX and keyY is as
follows, in big-endian 128-bit unsigned wraparound arithmetic:

| Mode | Formula                                           |
|------|---------------------------------------------------|
| 3DS  | NormalKey = (((KeyX ROL 2) XOR KeyY) + C1) ROR 41 |
| DSi  | NormalKey = ((KeyX XOR KeyY) + C2) ROL 42         |

Unless noted otherwise, all keyslots on retail units use the hardware
key generator.

### FIRM-launch key clearing

Starting with [9.0.0-20](9.0.0-20 "wikilink") the Process9 FIRM-launch
code now "clears" the following AES keyslots, with certain keydata by
writing the normal-key: 0x15 and 0x18-0x20. These are the keyslots used
by the New3DS [FIRM](FIRM "wikilink") arm9bin loader(minus keyslot
0x11), the New3DS Process9 does this too.

### AES key-init

See [here](Bootloader "wikilink") for how Boot9 initializes the AES
keyslots.

For an issue with console-unique key-init, see
[here](OTP_Registers "wikilink").

Some of the Boot9 key-init appears to have a bug(?) when initializing a
chunk of keyslots at once: normally it does
`for(i=0; i<4; i++){... <setup_keyslot_keydata(keyslotbase+i, keydata)> ...}`,
however in some cases it does that except with `(keyslotbase,` instead.
This results in the keyslot specified by keyslotbase being initialized 4
times in a row, with the remaining 3 keyslots following keyslotbase
being left uninitialized.

initialize_aeskeys() works as follows:

-   Validates input, calls panic() on failure. conunique_dataptr and
    bootrom_dataptr are both input parameters for initialize_aeskeys().
-   Calls crypto_initialize().
-   Then it *basically*: copies 0x1C-bytes from conunique_dataptr to
    tmpbuf+0(sp+12), and copies data from bootrom_dataptr with size
    0x40-0x1C to tmpbuf+0x1C(conunique_dataptr and bootrom_dataptr are
    updated afterwards).
-   The 0x40-byte tmpbuf is hashed with SHA256.
-   Keyslot 0x3F is then initialized using the above hash: keyX = first
    0x10-bytes of the hash, keyY = last 0x10-bytes of the hash.
-   Then with each console-unique key-init code-block: IV is loaded from
    bootrom_dataptr(which is updated afterwards), then the 0x40-bytes
    from bootrom_dataptr is encrypted with AES-CBC. The output is then
    used as 4 keyXs for initializing keyslots. How bootrom_dataptr is
    updated if at all varies per code-block. Hashing similar to the code
    at the start of this function is also run(when the remaining size
    for conunique_dataptr is non-zero), but the output hash isn't
    used(this code is also slightly different for one code-block).
-   Once finished with that, the non-console-unique keyslots are
    initialized. This is done with keydata loaded directly from
    bootrom_dataptr.
-   The last initialized keyslot is 0x3F, via normalkey. The keydata for
    this is copied to 0xFFF00618. This is for restoring the keydata when
    non-NAND FIRM boot *fails*, since those use keyslot 0x3F with other
    keydata.
-   Lastly it clears the 0x40-bytes at tmpbuf with the u32 loaded from
    bootrom_dataptr(the word following the above keyslot 0x3F keydata),
    then returns.

The keyslots are initialized with the same order of
keyslots+keydata_type listed below:

Console-unique keydata, after the initialization for the key-generation
keyslot(0x3F):

` 0x04..0x07 keyX`  
` 0x08..0x0B keyX`  
` 0x0C..0x0F keyX`  
` 0x10       keyX`  
` 0x14..0x17 keyX`  
` 0x18..0x1B keyX`  
` 0x1C..0x1F keyX`  
` 0x20..0x23 keyX`  
` 0x24       keyX`  
` 0x28..0x2B keyX`

Common keydata:

` 0x2C..0x2F keyX`  
` 0x30..0x33 keyX`  
` 0x34..0x37 keyX`  
` 0x38..0x3B keyX`  
` 0x3C..0x3F keyX`  
` 0x04..0x0B keyY`  
` 0x0C..0x0F normalkey`  
` 0x10..0x13 normalkey`  
` 0x14..0x17 normalkey`  
` 0x18..0x1B normalkey`  
` 0x1C..0x1F normalkey`  
` 0x20..0x23 normalkey`  
` 0x24..0x27 normalkey`  
` 0x28..0x2B normalkey`  
` 0x2C..0x2F normalkey`  
` 0x30..0x33 normalkey`  
` 0x34..0x37 normalkey`  
` 0x38..0x3B normalkey`  
` 0x3C..0x3F normalkey`
