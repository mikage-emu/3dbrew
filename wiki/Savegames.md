This page describes the format and encryption of savegames contained in
gamecards, SD and NAND. You can find savegames from various 3DS games on
the [Games](Games "wikilink") page.

## Overview

Savegames are stored in [DISA container
format](DISA_and_DIFF "wikilink"). Inside the DISA container, it forms a
[FAT filesystem](Inner_FAT "wikilink"). **Please refer to these pages
for how to fully extract save files**. This page only describes
additional encryption wear leveling on top of the DISA container. These
layers only apply to gamecard save games. SD savegames and NAND
savegames are DISA containers in plaintext after decrypting the common
SD/NAND encryption layer.

## Gamecard savegame Encryption

Gamecard encryption is AES-CTR applied on top of DISA container, but
below the wear leveling layer (if exists). The same key Y used for
encryption is also used for DISA CMAC signing. Several versions of
encryption scheme have been introduced over the time.

| FW Introduced                   | Old3DS | [AES Keyslots](AES#Keyslot "wikilink") (Encryption / CMAC) | KeyY generation method | Repeating CTR |
|---------------------------------|--------|------------------------------------------------------------|------------------------|---------------|
| The initial version             | Yes    | 0x37 / 0x33                                                | v1                     | Yes           |
| [2.0.0-2](2.0.0-2 "wikilink")   | Yes    | 0x37 / 0x33                                                | v2                     | Yes           |
| [2.2.0-4](2.2.0-4 "wikilink")   | Yes    | 0x37 / 0x33                                                | v2                     | No            |
| [6.0.0-11](6.0.0-11 "wikilink") | Yes    | 0x37 / 0x33                                                | v3                     | No            |
| [9.6.0-X](9.6.0-24 "wikilink")  | No     | 0x1A / 0x19                                                | v2?                    | No            |

### Repeating CTR Fail

On the 3DS savegames are stored much like on the DS, that is on a FLASH
chip in the gamecart. On the DS these savegames were stored in
plain-text but on the 3DS a layer of encryption was added. This is
AES-CTR, as the contents of several savegames exhibit the odd behavior
that xor-ing certain parts of the savegame together will result in the
plain-text appearing.

The reason this works is because the stream cipher used has a period of
512 bytes. That is to say, it will repeat the same keystream after 512
bytes. The way you encrypt with a stream cipher is you XOR your data
with the keystream as it is produced. Unfortunately, if your
streamcipher repeats and you are encrypting a known plain-text (in our
case, zeros) you are basically giving away your valuable keystream.

So how do you use this to decrypt a savegame on a 3DS? First off, you
chunk up the savegame into 512 byte chunks. Then, you bin these chunks
by their contents, discarding any that contain only FF. Now look for the
most common chunk. This is your keystream. Now XOR the keystream with
your original savegame and you should have a fully decrypted savegame.
XOR with the keystream again to produce an encrypted savegame.

### KeyY Generation method

The [NCSD](NCSD "wikilink") partition flags determine the method used to
generate this keyY.

#### v1

When all of the flags checked by the running NATIVE_FIRM are clear, the
keyY is the following:

| Offset | Size | Description                                                                                                                                                                                                                                               |
|--------|------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x8  | First 8-bytes from the plaintext [CXI](NCCH#CXI "wikilink") accessdesc signature.                                                                                                                                                                         |
| 0x8    | 0x4  | u32 CardID0 from [gamecard](Gamecards "wikilink") plaintext-mode command 0x90, Process9 reads this with the [NTRCARD](NTRCARD "wikilink") hw. The actual cmdID used by Process9 is different since Process9 reads it with the gamecard in encrypted-mode. |
| 0xC    | 0x4  | u32 CardID1 from [gamecard](Gamecards "wikilink") plaintext-mode command 0xA0, Process9 reads this with the [NTRCARD](NTRCARD "wikilink") hw. The actual cmdID used by Process9 is different since Process9 reads it with the gamecard in encrypted-mode. |

#### v2

Key Y is the first 0x10 bytes of SHA-256 calculated over the following
data

| Offset | Size | Description                                                                                                                                   |
|--------|------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x8  | First 8-bytes from the plaintext [CXI](NCCH#CXI "wikilink") accessdesc signature.                                                             |
| 0x8    | 0x40 | read from a gamecard command(this 0x40-byte data is also read by [GetRomId](Process_Services_PXI "wikilink"), which is the gamecard-uniqueID) |

This keyY generation method was implemented with
[2.0.0-2](2.0.0-2 "wikilink") via NCSD partition flag\[3\], however the
proper CTR wasn't implemented for flag\[7\] until
[2.2.0-4](2.2.0-4 "wikilink"). The hashed keyY flag\[3\] implemented
with [2.0.0-2](2.0.0-2 "wikilink") was likely never used with retail
gamecards.

#### v3

[6.0.0-11](6.0.0-11 "wikilink") implemented support for generating the
savegame keyY with a new method, this method is much more complex than
previous keyY methods. This is enabled via new [NCSD](NCSD "wikilink")
partition flags, all retail games which have the NCSD image finalized
after the [6.0.0-11](6.0.0-11 "wikilink") release(and
[6.0.0-11](6.0.0-11 "wikilink")+ in the system update partition) will
have these flags set for using this new method.

First, a SHA-256 hash is calculated over the following data

| Offset | Size | Description                                                                       |
|--------|------|-----------------------------------------------------------------------------------|
| 0x0    | 0x8  | First 8-bytes from the plaintext [CXI](NCCH#CXI "wikilink") accessdesc signature. |
| 0x8    | 0x40 | Same ID as [GetRomId](Process_Services_PXI "wikilink")                            |
| 0x48   | 0x8  | CXI Program ID                                                                    |
| 0x50   | 0x20 | ExeFS:/.code hash from the decrypted [ExeFS](ExeFS "wikilink") header             |

Then an [AES](AES "wikilink")-CMAC is calculated over this hash. The
output CMAC is used for keyY. The key slot for this CMAC is 0x2F.

The 0x2F keyY used for calculating this AES-CMAC (not to be confused
with the final keyY for decrypting/signing savegames) is initialized
while NATIVE_FIRM is loading, this keyY is generated via the
[RSA](RSA "wikilink") engine. The RSA slot used here is slot0(key-data
for slot0 is initialized by bootrom), this RSA slot0 key-data is
overwritten during system boot. This RSA slot0 key-data gets overwritten
with the RSA key-data used for verifying RSA signatures, every time
Process9 verifies any RSA signatures except for [NCCH](NCCH "wikilink")
accessdesc signatures. Starting with [7.0.0-13](7.0.0-13 "wikilink")
this key-init function used at boot is also used to initialize a
separate keyslot used for the new [NCCH](NCCH "wikilink") encryption
method.

This [Process9](FIRM "wikilink") key-init function first checks if a
certain 0x10-byte block in the 0x01FF8000 region is all-zero. When
all-zero it immediately returns, otherwise it clears that block then
continues to do the key generation. This is likely for supporting
launching a v6.0+ NATIVE_FIRM under this FIRM.

## Gamecard wear leveling

The 3DS employs a wear leveling scheme on the savegame FLASH chips(only
used for CARD1 gamecards). This is done through the usage of blockmaps
and a journal. The blockmap is located at offset 0 of the flash chip,
and is immediately followed by the journal. The initial state is
dictated by the blockmap, and the journal is then applied to that.

There are two versions of wear leveling have been observed. V1 is used
for 128KB and 512 KB CARD1 flash chips. V2 is used for 1MB CARD1 flash
chips (uncommon. Pokemon Sun/Moon is an example).

First, there are two 32-bit integers whose purposes are currently
unknown. They generally increase the value as the savegame is written
more times, so probably counter for how many times the journal became
full and got flushed into the block map, and/or how many times
`alloc_cnt` has wrapped around.

Then comes the actual blockmap. The block map contains entries of 10
bytes (V1) or 2 bytes (V2) with total number of
`(flash_size / 0x1000 - 1)`. The blockmap entry is simple:

    struct blockmap_entry_v1 {
            uint8_t phys_sec; // when bit7 is set, block is initialized and has checksums, otherwise checksums are all zero
            uint8_t alloc_cnt;
            uint8_t chksums[8];
    } __attribute__((__packed__));

    struct blockmap_entry_v2 {
            // Note that the phys_sec and alloc_cnt field are swapped in v2,
            // but the initialized bit is still on the first byte
            uint8_t alloc_cnt; // when bit7 is set, block is initialized
            uint8_t phys_sec;
            // v2 has no chksums
    } __attribute__((__packed__));

There's one entry per 0x1000-byte sector, counting from physical sector
1 (sector 0 contains the blockmap/journal).

A 2-byte CRC16 follows the block map. For V1 it immediately follows the
last block map entry. For V2 it is located at 0x3FE, and bytes before
the CRC is padded with zero. The CRC16 checks all the bytes before it,
including the two unknown integers, the block map, and the padding bytes
for V2. The CRC standard used looks like CRC-16-IBM (modbus). Here is
the code in Rust for it

    fn crc16(data: &[u8]) -> u16 {
        let poly = 0xA001;
        let mut crc = 0xFFFFu16;
        for byte in data {
            crc ^= <u16>::from(*byte);
            for _ in 0..8 {
                let b = crc & 1 != 0;
                crc >>= 1;
                if b {
                    crc ^= poly;
                }
            }
        }
        crc
    }

Then comes the journal. The journal contains entries that describes how
sectors should be remapped. The rest bytes before 0x1000 after all
journal entries are padded with 0xFF The journal entry structure is as
follows:

    struct journal_entry_half {
            uint8_t virt_sec;       // Mapped to sector
            uint8_t prev_virt_sec;  // Physical sector previously mapped to
            uint8_t phys_sec;       // Mapped from sector
            uint8_t prev_phys_sec;  // Virtual sector previously mapped to
            uint8_t phys_realloc_cnt;       // Amount of times physical sector has been remapped
            uint8_t virt_realloc_cnt;       // Amount of times virtual sector has been remapped
            uint8_t chksums[8];     // Unused & uninitialized for V2
    } __attribute__((__packed__));

    struct journal_entry{
            struct journal_entry_half entry;
            struct journal_entry_half dupe; // same data as `entry`. No idea what this is used fore
            uint32_t uninitialized;         // 0xFFFFFFFF in newer system
    }__attribute__((__packed__));

The checksums in the blockmap/journal entries work as follows:

- each byte is the checksum of an encrypted 0x200 bytes large block
- to calculate the checksum, a CRC16 of the block (same CRC16 algorithm
  as above) is calculated, and the two bytes of the CRC16 are XORed
  together to produce the 8bit checksum

## Initialization

When a save FLASH contains all xFFFF blocks it's assumed uninitialized
by the game cartridges and it initializes default data in place, without
prompting the user. The 0xFFFFFFFF blocks are uninitialized data. When
creating a non-gamecard savegame and other images/files, it's initially
all 0xFFFFFFFF until it's formatted where some of the blocks are
overwritten with encrypted data.

I got a new game SplinterCell3D-Pal and I downloaded the save and it was
128KB of 0xFF, except the first 0x10 bytes which were the letter 'Z'
(uppercase) --[Elisherer](User:Elisherer "wikilink") 22:41, 15 October
2011 (CEST)

## Fun Facts

If you have facts that you found out by looking at the binary files
please share them here:

- From one save to another the game backups the last files that were in
  the partition and the entire image header in "random" locations..
  --[Elisherer](User:Elisherer "wikilink") 22:41, 15 October 2011 (CEST)

## Tools

- [save3ds](https://github.com/wwylele/save3ds) supports reading and
  modifying savegames, extdata and title database in FUSE filesystem or
  batch extracting/importing.
- [3dsfuse](https://github.com/3dshax/3ds/tree/master/3dsfuse) supports
  reading and modifying savegames. In the mounted FUSE filesystem, the
  /output.sav is the raw FLASH save-image. When the save was modified, a
  separate tool to update the CMAC must be used with /clean.sav, prior
  to writing output.sav to a gamecard. (This is an old tool that doesn't
  handle the savegame format correctly.
  --[Wwylele](User:Wwylele "wikilink")
  ([talk](User_talk:Wwylele "wikilink")) 16:13, 2 December 2019 (CET))
- [3DSExplorer](3DSExplorer "wikilink") supports reading of savegames,
  it doesn't support reading the new encrypted savegames and maybe in
  the future it will support modifying (some of the modyfing code is
  already implemented).
- [wwylele's 3ds-save-tool](https://github.com/wwylele/3ds-save-tool)
  supports extracting files from savegames and extdata. It properly
  reconstructs data from the DPFS tree and extracts files in directories
  hierarchy.

[Japanese](セーブデータ "wikilink")