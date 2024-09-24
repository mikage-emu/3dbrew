| Offset | Size  | Description                                                                                                 |
|--------|-------|-------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4   | Magic "CRR0"                                                                                                |
| 0x4    | 0x4   | Reserved                                                                                                    |
| 0x8    | 0x4   | Next loaded CRR (Must be zero in file, set by RO during loading)                                            |
| 0xC    | 0x4   | Previous loaded CRR (Must be zero in file, set by RO during loading)                                        |
| 0x10   | 0x4   | Debug Info Offset                                                                                           |
| 0x14   | 0x4   | Debug Info Size                                                                                             |
| 0x18   | 0x8   | Reserved                                                                                                    |
| 0x20   | 0x4   | UniqueID Mask                                                                                               |
| 0x24   | 0x4   | UniqueID Pattern                                                                                            |
| 0x28   | 0x18  | Reserved                                                                                                    |
| 0x40   | 0x100 | RSA-2048 modulo                                                                                             |
| 0x140  | 0x100 | RSA-2048 signature signed by Nintendo, starting at offset 0x20 with size 0x120                              |
| 0x240  | 0x100 | RSA-2048 signature verified with the above modulo, over the data starting at 0x340 with the size from 0x358 |
| 0x340  | 0x4   | Process UniqueID\<\<8, from the ProgramID                                                                   |
| 0x344  | 0x4   | Size of the whole CRR0 file                                                                                 |
| 0x348  | 0x8   | Reserved                                                                                                    |
| 0x350  | 0x4   | Hash-table Offset                                                                                           |
| 0x354  | 0x4   | Total hashes in the hash-table                                                                              |
| 0x358  | 0x4   | Offset to the plain region containing text tags, from the process [NCCH](NCCH#CXI "wikilink")               |
| 0x35C  | 0x4   | Size of plain region                                                                                        |
| 0x360  |       | SHA-256 hash-table                                                                                          |

Each hash stored in the hash-table is over the corresponding executable
[CRO0](CRO0 "wikilink") hash-table.

CRR0 files must be stored under "romfs:/.crr/". The end of the file is
aligned to a 0x1000-byte boundary with 0xCC bytes.

[Category:File formats](Category:File_formats "wikilink")