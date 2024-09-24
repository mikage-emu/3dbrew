See also: [NCSD](NCSD "wikilink").

This page documents the format of NCSD. CTR cart images (CCI) is NCSD,
but is used for other things as well. CSU is NCSD used for system
updates and development tools.

This is a container format which generally holds [CXI](CXI "wikilink")
files inside.

### Overview

NCSD images start with a NCSD header, followed by up to a maximum of 8
partitions according to spec. The first partition(NCCH 0) usually starts
at 0x4000, this is generally the main NCCH executable. The following
info on partitions 1, 2, and 7 are only valid for .CCI. The second
partition(NCCH 1) contains the game "Manual"(title ID for the .CXI
containing the Manual always starts with '0005'). The third
partition(NCCH 2) contains the download play "Child"(The title ID for
the NCCH containing the Child always starts with '0006'). The eighth
block(NCCH 7) contains "Update Data"(The title ID for the NCCH
containing the Update Data always starts with '8000') The format of
partitions can be determined from the partition FS flags, while the
contents can be determined from the partitions flags.

### NCSD header

| Offset | Size          | Description                                                                                                                                                     |
|--------|---------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x000  | 0x100         | RSA-2048 SHA-256 signature of the NCSD header                                                                                                                   |
| 0x100  | 4             | Magic Number 'NCSD'                                                                                                                                             |
| 0x104  | 4             | Size of the NCSD image, in media units (1 media unit = 0x200 bytes)                                                                                             |
| 0x108  | 8             | Title/Program ID                                                                                                                                                |
| 0x110  | 8             | Partitions FS type                                                                                                                                              |
| 0x118  | 8             | Partitions crypt type                                                                                                                                           |
| 0x120  | 0x40=(4+4)\*8 | Offset & Length partition table                                                                                                                                 |
| 0x160  | 0x20          | Exheader SHA-256 hash                                                                                                                                           |
| 0x180  | 0x4           | Additional header size                                                                                                                                          |
| 0x184  | 0x4           | Sector zero offset                                                                                                                                              |
| 0x188  | 8             | Partition Flags: byte\[5\]-byte\[7\] indicate content type ( system update, application, manual, ... ) size of media units ( 512\*2^byte\[6\] ) and encryption. |
| 0x190  | 0x40=8\*8     | Partitions' Title ID table                                                                                                                                      |
| 0x1D0  | 0x28          | Reserved                                                                                                                                                        |
| 0x1F8  | 8             | Unknown                                                                                                                                                         |
| 0x200  | 4             | Always 0xFFFFFFFF                                                                                                                                               |
| 0x204  | 252           | Padding?                                                                                                                                                        |
| 0x300  | 4             | Used ROM size in bytes                                                                                                                                          |
| 0x304  | 28            | Padding                                                                                                                                                         |
| 0x320  | 8             | [NVer](NVer "wikilink") Title ID (Only Present in retail .CCI)                                                                                                  |
| 0x328  | 8             | [NVer](NVer "wikilink") Title Version (Only Present in retail .CCI)                                                                                             |

Parts of the first NCCH block's header are found around 0x1000 for
whatever reason. NCSD can hold up to 8 partitions. (i.e. Mario Kart 7
holds 4 NCCHs, most we've seen so far)

The region-specific NVer title for this NCSD presumably must exist on
NAND. The NVer title version may also be used to check whether a system
update is required before running the app.

[Category:File formats](Category:File_formats "wikilink")