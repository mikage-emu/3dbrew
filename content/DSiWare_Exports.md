The DSiWare exported from a 3DS is located at
"[sdmc](SD_Filesystem "wikilink"):/Nintendo 3DS/<ID0>/<ID1>/Nintendo
DSiWare". Filenames are same format as
[DSi](http://dsibrew.org/wiki/Tad): "<TitleID-Low>.bin". The below sizes
include the 0x20-byte block metadata.

DSiWare exported from 3DS use console-unique
[keyslots](Nand/private/movable.sed "wikilink") initialized by
movable.sed. Each section is encrypted with AES-CBC.

The content sections are ordered the same way as DSi: TMD, SRL from
content0, <content1-7 for format v2>, public.sav, and banner.sav when
banner.sav exists. When the DSiWare export type is 7-11, the 12th
content section is the private.sav, if it exists.(ContentX here is the
.app data from TWL-NAND /title)

# DSiWare Export Types

| Value | Format version | Description         |
|-------|----------------|---------------------|
| 0-6   |                | Same as value 14.   |
| 7-11  | v2             | 12 content sections |
| 12    | v2             | 4 content sections  |
| 13    | v1             | 4 content sections  |
| 14    | v2             | 11 content sections |

For NATIVE_FIRM versions where this DSiWare export
[type](AM:ExportDSiWare "wikilink") field is unused, format version v1
is used with 4 content sections. Otherwise when this field is used, see
the above table. [System Settings](System_Settings "wikilink") uses type
1 for [exporting](AM:ExportDSiWare "wikilink") DSiWare, regardless of
the System Settings title-version.

# Block Metadata

| Offset | Size | Description                                                       |
|--------|------|-------------------------------------------------------------------|
| 0x0    | 0x10 | AES MAC over a SHA-256 hash                                       |
| 0x10   | 0x10 | IV, generated by the [RNG](PSPXI:GenerateRandomBytes "wikilink"). |

Each section begins with the payload encrypted data, followed by this
block metadata. The SHA-256 hash used for the MAC is calculated over the
cleartext payload. This hash used for generating the MAC is also stored
in the footer.

# Footer

| Offset    | Size  | Description                                                                                                                                                          |
|-----------|-------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0       | X     | SHA-256 hashes over the banner, header, and content sections. When a content section doesn't exist, the corresponding hash here is uninitialized.                    |
| 0x0 + X   | 0x3C  | ECDSA signature using SHA-256 over the previous hashes, signed by the APCert.                                                                                        |
| 0x3C + X  | 0x180 | ECDSA "APXXXXXXXXXXXXXXXX" cert signed by the below [CTCert](CTCert "wikilink"), where X is [random](PSPXI:GenerateRandomBytes "wikilink") lowercase ASCII hex data. |
| 0x1BC + X | 0x180 | ECDSA [CTCert](CTCert "wikilink")                                                                                                                                    |
| 0x33C + X | 0x4   | Uninitialized padding.                                                                                                                                               |

These hashes are the same hashes used for generating each section's MAC
stored in the metadata block. X = 0x40 + totalcontentsections\*0x20.

The curve sect233r1 is used for all related ECDSA signing operations

# File Structure v1

| Offset               | Size                                                                            | Description      |
|----------------------|---------------------------------------------------------------------------------|------------------|
| 0x0                  | 0x4020                                                                          | Banner section   |
| 0x4020               | 0xC0                                                                            | Header section   |
| 0x40E0               | 0x340 + 0x20 + X, where X is the total size of the hashes stored in the footer. | Footer section   |
| 0x40E0 + footer_size |                                                                                 | Content sections |

## Header

| Offset | Size | Description                                                                                                                                      |
|--------|------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Magic number 0x54444633, "3FDT".                                                                                                                 |
| 0x4    | 0x2  | Byte-swapped groupID from the TWL [TMD](TMD "wikilink").                                                                                         |
| 0x6    | 0x2  | Byte-swapped title version from the TWL [TMD](TMD "wikilink").                                                                                   |
| 0x8    | 0x20 | SHA-256 hash [calculated](AMPXI:ValidateDSiWareMovableSedHash "wikilink") over the encrypted movable.sed.                                        |
| 0x28   | 0x10 | Encrypted AES block from [encrypting](AES "wikilink") an all-zero 0x10-byte block with AES-CBC, where the IV is all-zero.                        |
| 0x38   | 0x8  | Byte-swapped titleID from the TWL [TMD](TMD "wikilink").                                                                                         |
| 0x40   | 0x8  | ?                                                                                                                                                |
| 0x48   | 0x10 | u32 payload sizes for the 4 content sections.                                                                                                    |
| 0x58   | 0x4  | ?                                                                                                                                                |
| 0x5C   | 0x3E | Data from the TWL [TMD](TMD "wikilink") reserved section. Only the first 0x20-bytes from the TWL TMD is written here, the rest is uninitialized. |
| 0x9A   | 0x6  | Padding?                                                                                                                                         |

# File Structure v2

| Offset               | Size                                                                            | Description      |
|----------------------|---------------------------------------------------------------------------------|------------------|
| 0x0                  | 0x4020                                                                          | Banner section   |
| 0x4020               | 0x110                                                                           | Header section   |
| 0x4130               | 0x340 + 0x20 + X, where X is the total size of the hashes stored in the footer. | Footer section   |
| 0x4130 + footer_size |                                                                                 | Content sections |

## Header

| Offset | Size | Description                                                                                                                                      |
|--------|------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Magic number 0x54444633, "3FDT".                                                                                                                 |
| 0x4    | 0x2  | Byte-swapped groupID from the TWL [TMD](TMD "wikilink").                                                                                         |
| 0x6    | 0x2  | Byte-swapped title version from the TWL [TMD](TMD "wikilink").                                                                                   |
| 0x8    | 0x20 | SHA-256 hash [calculated](AMPXI:ValidateDSiWareMovableSedHash "wikilink") over the encrypted movable.sed.                                        |
| 0x28   | 0x10 | Encrypted AES block from [encrypting](AES "wikilink") an all-zero 0x10-byte block with AES-CBC, where the IV is all-zero.                        |
| 0x38   | 0x8  | Byte-swapped titleID from the TWL [TMD](TMD "wikilink").                                                                                         |
| 0x40   | 0x8  | ?                                                                                                                                                |
| 0x48   | 0x2C | u32 payload sizes for the 11 content sections.                                                                                                   |
| 0x74   | 0x30 | ?                                                                                                                                                |
| 0xA4   | 0x3E | Data from the TWL [TMD](TMD "wikilink") reserved section. Only the first 0x20-bytes from the TWL TMD is written here, the rest is uninitialized. |
| 0xE2   | 0x0E | Padding?                                                                                                                                         |