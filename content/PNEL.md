+++
title = 'PNEL'
+++

**PNEL** is a file format that is used by Puzzle Swap of [StreetPass Mii
Plaza](StreetPass_Mii_Plaza "wikilink") for loading additional puzzles
to the 7 default ones. PNEL probably stands for *Panel*.

## File Format

### Header

| Offset | Size | Description                                                         |
|--------|------|---------------------------------------------------------------------|
| 0x00   | 0x04 | Magic word "PNEL"                                                   |
| 0x04   | 0x04 | Magic word "0800". Probably last 4 digits of the japanese title ID. |
| 0x08   | 0x04 | Number of puzzles                                                   |
| 0x0C   | 0x04 | Unknown. Always 0x00000001                                          |
| 0x10   | 0x04 | CRC-32 over the 0x14 bytes of the header with this field being 0.   |

After the header the first additional puzzle begins.

### Puzzle Entry

| Offset | Size  | Description                                                                                        |
|--------|-------|----------------------------------------------------------------------------------------------------|
| 0x00   | 0x04  | Order number. First puzzle is a 7 because 0-6 are the preinstalled puzzles                         |
| 0x04   | 0x04  | CRC-32 over the 0xC30 bytes of the puzzle entry with this field beeing 0.                          |
| 0x08   | 0x04  | Absolut offset of start of puzzle image                                                            |
| 0x0C   | 0x04  | Absolut offset of start of puzzle settings                                                         |
| 0x10   | 0x04  | Absolut offset of start of puzzle model/figure                                                     |
| 0x14   | 0x04  | Size of puzzle image                                                                               |
| 0x18   | 0x04  | Size of puzzle settings                                                                            |
| 0x1C   | 0x04  | Size of puzzle model/figure                                                                        |
| 0x20   | 0x04  | CRC-32 over data of the puzzle image                                                               |
| 0x24   | 0x04  | CRC-32 over data of the puzzle settings                                                            |
| 0x28   | 0x04  | CRC-32 over data of the puzzle model/figure                                                        |
| 0x2C   | 0xC00 | Name of the puzzle in different languages                                                          |
| 0xC2C  | 0x01  | ID of number of puzzle pieces: 0 =\> 15 pieces; 1 =\> 24 pieces; 2 =\> 40 pieces; 3 =\> 540 pieces |
| 0xC2D  | 0x01  | Pink puzzle pieces                                                                                 |
| 0xC2E  | 0x02  | Unknown or Padding                                                                                 |

The data of the image, settings and model/figure are always padded at
the end with 0x00 until size is divisible by 4 (4 byte alignment). These
padding bytes are not part of the CRC-32 calculation

For more information about the (pink) puzzle piece IDs see
<https://tcrf.net/StreetPass_Mii_Plaza#Unused_Pink_Puzzle_Piece_Formats>

After all puzzle entries the data of the image of the first puzzle entry
begins followed by settings data and then by the model data. Then the
second puzzle image data begins followed by settings data and then by
the model data. And so on...
As already mentioned every single data is 4 byte aligned.

### Image Data

The image data is a 512x256 pixel image in a [CGFX](CGFX "wikilink")
container.

### Settings Data

Unknown format.

### Model Data

The model data is in a [CGFX](CGFX "wikilink") container.

## Tools

- [PanelData
  Extractor](http://wiiucodes.ddnss.eu/tools/PanelData%20Extractor.zip)
  Extracts a PNEL file into its components.
- [PanelData
  Builder](http://wiiucodes.ddnss.eu/tools/PanelData%20Builder.zip)
  Builds a PNEL file from components.

[category:File formats](category:File_formats "wikilink")
