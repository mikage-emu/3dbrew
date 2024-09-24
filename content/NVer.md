+++
title = 'NVer'
+++

This [CFA](NCCH#CFA "wikilink") contains the below file in the RomFS.

### version.bin

This 8-byte file mainly contains the system revision number, for the
version number displayed by [System
Settings](System_Settings "wikilink"). The rest of the data used for the
system version is contained in [CVer](CVer "wikilink").

| Offset | Size | Description                                   |
|--------|------|-----------------------------------------------|
| 0x0    | 0x1  | Reserved                                      |
| 0x1    | 0x1  | Reserved                                      |
| 0x2    | 0x1  | Revision version number, after the '-'        |
| 0x3    | 0x1  | Reserved                                      |
| 0x4    | 0x1  | ASCII character for the system version region |
| 0x5    | 0x3  | Reserved                                      |
