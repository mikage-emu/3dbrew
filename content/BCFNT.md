# CTR Font Format

[.bcfnt](.bcfnt "wikilink") files are bitmap fonts made for the 3ds. The
system font uses this format too except the header is changed from CFNT
to CFNU and all file offsets are changed to absolute in memory offsets.

### CFNT Header

| Offset | Size | Description                                |
|--------|------|--------------------------------------------|
| 0x00   | 0x04 | Magic Header (either CFNT or CFNU or FFNT) |
| 0x04   | 0x02 | Endianness (0xFEFF = little, 0xFFFE = big) |
| 0x06   | 0x02 | Header Size                                |
| 0x08   | 0x04 | Version (observed to be 0x03000000)        |
| 0x0C   | 0x04 | File size (the total)                      |
| 0x10   | 0x04 | Number of "blocks" to read                 |

### FINF Header

#### Version 3 (BCFNT)

| Offset | Size | Description                                            |
|--------|------|--------------------------------------------------------|
| 0x00   | 0x04 | Magic Header (FINF)                                    |
| 0x04   | 0x04 | Section Size                                           |
| 0x08   | 0x01 | Font Type                                              |
| 0x09   | 0x01 | Line Feed                                              |
| 0x0A   | 0x02 | Alter Char Index                                       |
| 0x0C   | 0x03 | Default Width (3 bytes: Left, Glyph Width, Char Width) |
| 0x0F   | 0x01 | Encoding                                               |
| 0x10   | 0x04 | TGLP Offset                                            |
| 0x14   | 0x04 | CWDH Offset                                            |
| 0x18   | 0x04 | CMAP Offset                                            |
| 0x1C   | 0x01 | Height                                                 |
| 0x1D   | 0x01 | Width                                                  |
| 0x1E   | 0x01 | Ascent                                                 |
| 0x1F   | 0x01 | Reserved                                               |

#### Version 4 (BFFNT)

| Offset | Size | Description                                            |
|--------|------|--------------------------------------------------------|
| 0x00   | 0x04 | Magic Header (FINF)                                    |
| 0x04   | 0x04 | Section Size                                           |
| 0x08   | 0x01 | Font Type                                              |
| 0x09   | 0x01 | Height                                                 |
| 0x0A   | 0x01 | Width                                                  |
| 0x0B   | 0x01 | Ascent                                                 |
| 0x0C   | 0x02 | Line Feed                                              |
| 0x0E   | 0x02 | Alter Char Index                                       |
| 0x10   | 0x03 | Default Width (3 bytes: Left, Glyph Width, Char Width) |
| 0x13   | 0x01 | Encoding                                               |
| 0x14   | 0x04 | TGLP Offset                                            |
| 0x18   | 0x04 | CWDH Offset                                            |
| 0x1C   | 0x04 | CMAP Offset                                            |

### TGLP Header

#### Version 3 (BCFNT)

| Offset | Size | Description                                                                                                    |
|--------|------|----------------------------------------------------------------------------------------------------------------|
| 0x00   | 0x04 | Magic Header (TGLP)                                                                                            |
| 0x04   | 0x04 | Section Size                                                                                                   |
| 0x08   | 0x01 | Cell Width                                                                                                     |
| 0x09   | 0x01 | Cell Height                                                                                                    |
| 0x0A   | 0x01 | Baseline Position                                                                                              |
| 0x0B   | 0x01 | Max Character Width                                                                                            |
| 0x0C   | 0x04 | Sheet Size                                                                                                     |
| 0x10   | 0x02 | Number of Sheets                                                                                               |
| 0x12   | 0x02 | Sheet Image Format 0-13: (RGBA8, RGB8, RGBA5551, RGB565, RGBA4, LA8, HILO8, L8, A8, LA4, L4, A4, ETC1, ETC1A4) |
| 0x14   | 0x02 | Number of columns                                                                                              |
| 0x16   | 0x02 | Number of rows                                                                                                 |
| 0x18   | 0x02 | Sheet Width                                                                                                    |
| 0x1A   | 0x02 | Sheet Height                                                                                                   |
| 0x1C   | 0x04 | Sheet Data Offset                                                                                              |

#### Version 4 (BFFNT)

| Offset | Size | Description                                                                                                    |
|--------|------|----------------------------------------------------------------------------------------------------------------|
| 0x00   | 0x04 | Magic Header (TGLP)                                                                                            |
| 0x04   | 0x04 | Section Size                                                                                                   |
| 0x08   | 0x01 | Cell Width                                                                                                     |
| 0x09   | 0x01 | Cell Height                                                                                                    |
| 0x0A   | 0x01 | Number of Sheets                                                                                               |
| 0x0B   | 0x01 | Max Character Width                                                                                            |
| 0x0C   | 0x04 | Sheet Size                                                                                                     |
| 0x10   | 0x02 | Baseline Position                                                                                              |
| 0x12   | 0x02 | Sheet Image Format 0-13: (RGBA8, RGB8, RGBA5551, RGB565, RGBA4, LA8, HILO8, L8, A8, LA4, L4, A4, ETC1, ETC1A4) |
| 0x14   | 0x02 | Number of Sheet columns                                                                                        |
| 0x16   | 0x02 | Number of Sheet rows                                                                                           |
| 0x18   | 0x02 | Sheet Width                                                                                                    |
| 0x1A   | 0x02 | Sheet Height                                                                                                   |
| 0x1C   | 0x04 | Sheet Data Offset                                                                                              |

### CMAP Header

| Offset | Size | Description                                      |
|--------|------|--------------------------------------------------|
| 0x00   | 0x04 | Magic Header (CMAP)                              |
| 0x04   | 0x04 | Section Size                                     |
| 0x08   | 0x02 | Code Begin                                       |
| 0x0A   | 0x02 | Code End                                         |
| 0x0C   | 0x02 | Mapping Method (0 = Direct, 1 = Table, 2 = Scan) |
| 0x0E   | 0x02 | Reserved?                                        |
| 0x10   | 0x04 | Next CMAP Offset                                 |

Depending on the mapping method the next bytes are read like so:

Direct: IndexOffset = read uint16

Table: IndexTable = read uint16 array (CodeEnd - CodeBegin + 1)

Scan: Number of Scan Entries = read uint16 for every scan entry: read
uint16 & read uint16

### CWDH Header

| Offset | Size                             | Description                                          |
|--------|----------------------------------|------------------------------------------------------|
| 0x00   | 0x04                             | Magic Header (CWDH)                                  |
| 0x04   | 0x04                             | Section Size                                         |
| 0x08   | 0x02                             | Start Index                                          |
| 0x0A   | 0x02                             | End Index                                            |
| 0x0C   | 0x04                             | Next CWDH Offset                                     |
| 0x10   | 3 \* (EndIndex - StartIndex + 1) | Char Widths (3 bytes: Left, Glyph Width, Char Width) |

# Tools

[1](https://github.com/ObsidianX/3dstools) - BFFNT Extractor/Creator.
Creates PNG files from TGLP atlas data and a JSON manifest.

[Category:File formats](Category:File_formats "wikilink")