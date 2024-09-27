**GFAC** files are archive files.

## File Format

### Header

| Offset | Size | Type      | Description                  |
|--------|------|-----------|------------------------------|
| 0x00   | 4    | char\[4\] | Magic Word 'GFAC'            |
| 0x04   | 4    | uint32    | Version?                     |
| 0x08   | 4    | uint32    | Always 1                     |
| 0x0C   | 4    | uint32    | Absolut offset of file table |
| 0x10   | 4    | uint32    | Size of file table           |
| 0x14   | 4    | uint32    | Absolut offset of file data  |
| 0x18   | 4    | uint32    | Size of file data            |
| 0x1C   | 16   |           | Padding/Unknown              |

### File Table

| Offset | Size | Type   | Description                                               |
|--------|------|--------|-----------------------------------------------------------|
| 0x00   | 4    | uint32 | Entry count / Number of files                             |
| Entry  |      |        |                                                           |
|        | 4    | uint32 | CRC-32 ?                                                  |
|        | 4    | uint32 | Absolut offset of file name; Last offset has MSB set to 1 |
|        | 4    | uint32 | file size                                                 |
|        | 4    | uint32 | file offset                                               |

The file offset refers to the raw file data. If a container like
[GFCP](GFCP "wikilink") is used the data has to be decompressed and must
replace the whole container.