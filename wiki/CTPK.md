**CTPK - CTR Texture PacKage**

CTPK is a container file for one or multiple textures that are in
various formats readable by the 3ds system. Offsets are relative to the
beginning of the header section unless specified.

## CTPK Header

| Offset | Length | Description                    |
|--------|--------|--------------------------------|
| 0x0    | 0x4    | Magic "CTPK"                   |
| 0x4    | 0x2    | Version?                       |
| 0x6    | 0x2    | Number of Texture Entries      |
| 0x8    | 0x4    | Texture Data section offset    |
| 0xC    | 0x4    | Texture Data section size      |
| 0x10   | 0x4    | Hash section offset            |
| 0x14   | 0x4    | Conversion Info section offset |
| 0x18   | 0x8    | Padding                        |

## Texture Info Entry

The Header block is followed by a texture info entry for each texture in
the container. This block is usually followed by the bitmap size arrays
and then the file paths. 0x20 byte aligned.

| Offset | Length | Description                                                 |
|--------|--------|-------------------------------------------------------------|
| 0x0    | 0x4    | File path Offset                                            |
| 0x4    | 0x4    | Texture Data Size                                           |
| 0x8    | 0x4    | Texture Data Offset (Relative to texture data block offset) |
| 0xC    | 0x4    | Texture Format                                              |
| 0x10   | 0x2    | Width                                                       |
| 0x12   | 0x2    | Height                                                      |
| 0x14   | 0x1    | Mip Level                                                   |
| 0x15   | 0x1    | Type (0: Cube Map, 1: 1D, 2: 2D)                            |
| 0x16   | 0x2    | Cube Map Related                                            |
| 0x18   | 0x4    | Bitmap Size Array Offset (Relative to to this block)        |
| 0x1C   | 0x4    | Unix Timestamp                                              |

## Hash Block Entry

The texture info block is followed by a hash entry for each texture
entry. 0x8 byte aligned.

| Offset | Length | Description            |
|--------|--------|------------------------|
| 0x0    | 0x4    | Crc32 of the file path |
| 0x4    | 0x4    | Index                  |

## Conversion Info Block Entry

The hash block is followed by a conversion info entry for each texture
entry. 0x4 byte aligned.

| Offset | Length | Description             |
|--------|--------|-------------------------|
| 0x0    | 0x1    | Texture Format          |
| 0x1    | 0x1    | Unknown                 |
| 0x2    | 0x1    | Compressed              |
| 0x3    | 0x1    | ETC1 Related (Quality?) |

## Texture Data Block

This block and all it's texture entries are 0x80 byte aligned.

## Texture Formats

| Value | Description  |
|-------|--------------|
| 0x0   | RGBA8888     |
| 0x1   | RGB888       |
| 0x2   | RGBA5551     |
| 0x3   | RGB565       |
| 0x4   | RGBA4444     |
| 0xC   | ETC1         |
| 0xD   | ETC1 + Alpha |

[Category:File formats](Category:File_formats "wikilink")