+++
title = 'MPO'
categories = ["File formats"]
+++

### Overview

MPO = Multi-Picture Object

Document describing the file format used in mpo files:
<http://www.cipa.jp/std/documents/e/DC-007_E.pdf>

Nintendo uses a common format for its 3D pictures. MPO is basically two
JPG files concatenated in one file. The two JPG files has an EXIF data
structure in their headers (This was developed by CIPA).

EXIF is a standard that specifies the formats for images, sound, and
ancillary tags used by digital cameras (including smartphones), scanners
and other systems handling image and sound files recorded by digital
cameras.[1](http://en.wikipedia.org/wiki/Exchangeable_image_file_format)

### Nintendo's EXIF Data Structure

| ID     | DESCRIPTION                 | VALUE                                                                                                  |
|--------|-----------------------------|--------------------------------------------------------------------------------------------------------|
| 0x010F | Manufacturer                | Nintendo                                                                                               |
| 0x0110 | Camera                      | Nintendo 3DS                                                                                           |
| 0x011A | XResolution                 | 72:1                                                                                                   |
| 0x011B | YResolution                 | 72:1                                                                                                   |
| 0x0128 | ResolutionUnit              | 2                                                                                                      |
| 0x0131 | Software                    | Depends on the software: 00204 for the Camera (EU), 00227 for the Mii Editor (EU), 00955 for KH3D (EU) |
| 0x0132 | DateTime                    | YYYY:MM:DD HH:mm:SS                                                                                    |
| 0x0213 | YCbCrPositioning            | 2                                                                                                      |
| 0x9000 | ExifVersion                 | 0220                                                                                                   |
| 0x9003 | DateTimeOriginal            | YYYY:MM:DD HH:mm:SS                                                                                    |
| 0x9004 | DateTimeDigitized           | YYYY:MM:DD HH:mm:SS                                                                                    |
| 0x9101 | ComponentsConfiguration     | \[0x01,0x02,0x03,0x00\]                                                                                |
| 0x927C | MakerNote                   | \[DATA - 174 bytes\] (yet to be understood)                                                            |
| 0xA000 | FlashPixVersion             | 0100                                                                                                   |
| 0xA001 | ColorSpace                  | 1                                                                                                      |
| 0xA002 | PixelXDimension             | 640                                                                                                    |
| 0xA003 | PixelYDimension             | 480                                                                                                    |
| 0x5041 | InteroperabilityIndex       | R98                                                                                                    |
| 0x5042 | ExifInteroperabilityVersion | 0100                                                                                                   |
| 0x1000 | InteroperabilityVersion     | JPEG Exif Ver 2.2                                                                                      |
| 0x501B | ThumbnailData               | \[DATA - 3000+ bytes\]                                                                                 |
| 0x5023 | ThumbnailCompression        | 6                                                                                                      |
| 0x502D | ThumbnailXResolution        | 72:1                                                                                                   |
| 0x502E | ThumbnailYResolution        | 72:1                                                                                                   |
| 0x5030 | ThumbnailTransferFunction   | 2                                                                                                      |
| 0x0201 | JPEGInterchangeFormat       | 682                                                                                                    |
| 0x0202 | JPEGInterchangeFormatLength | 3000+                                                                                                  |
| 0x5091 | ChrominanceTable            | \[DATA - 128 bytes\]                                                                                   |
| 0x5090 | LuminanceTable              | \[DATA - 128 bytes\]                                                                                   |

#### Nintendo's EXIF MakerNote Tag

**This still need to be figured out:**

The MakerNote is made with Tiff Exif information (Big Endian)

first 2 bytes are the IFD Count (IFD is a 12 byte tag), Regulary there
are 2 IFDs.

**IFD structure**

| Tag     | Type    | Count/Value | Value/Offset |
|---------|---------|-------------|--------------|
| 2 bytes | 2 bytes | 4 bytes     | 4 bytes      |

**Nintendo's IFDs**

| Tag    | Desc                   | Type        | Count/Value | Value/Offset             |
|--------|------------------------|-------------|-------------|--------------------------|
| 0x1100 | Software-specific data | 7-Undefined | Count       | Count=1 ? Value : Offset |
| 0x1101 | Nintendo 64byte Note   | 7-Undefined | Count       | Offset                   |

After the IFDs comes a 4 byte Zero ( {0,0,0,0} ).

And then the Data the IFDs point at (if at all)

**Nintendo's 64Byte Note**

Different from the wrapping structure this structure is Little-Endian.

| Offset | Description  | Type       | Default Value                                          |
|--------|--------------|------------|--------------------------------------------------------|
| 0x00   | Magic        | char\[4\]  | {'3','D','S','1'}                                      |
| 0x04   | ?            | uint32     | 1 / 2 / 4 / 5                                          |
| 0x08   | Timestamp    | uint32     | Number of seconds since 1/1/2000 00:00:00              |
| 0x0C   | Padding      | uint32     | 0                                                      |
| 0x10   | Title ID Low | uint32     | like the title id low but without the last two letters |
| 0x14   | Flags        | uint32     |                                                        |
| 0x18   | Console ID   | byte\[4\]  | unique identifier                                      |
| 0x1C   | Padding      | byte\[12\] | 0                                                      |
| 0x28   | 3D Parallax  | float      | \[-52,54\]                                             |
| 0x2C   | Padding      | uint32     | 0                                                      |
| 0x30   | Category     | uint16     | 0x2000 for a man, 0x4000 a woman, 0x1000 a mii...      |
| 0x32   | Filter       | uint16     |                                                        |
| 0x34   | Padding      | byte\[12\] | 0                                                      |

[Category:File formats](Category:File_formats "wikilink")
