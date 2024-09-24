## Overview

The Extended Banner format is very simple. The Extended Banner is used
to add text (and optionally an extra texture) to a given banner. It can
also (optionally) be used to set an expiration date for a banner.

See [here](Extdata "wikilink") for how the extended-banners are loaded
from extdata. The Home Menu extended-banner loading function will
immediately return without loading anything if the programID is for
System Settings.

### SpotPass

When Home Menu loads extended-banners, it also attempts to load a
"[CBMD](CBMD "wikilink")" banner via
[SpotPass](BOSS_Services "wikilink") service commands. Normally this
CBMD banner doesn't exist in extended-banner extdata. This is
[broken](BOSS_Services "wikilink") with New3DS titles since Home Menu
uses these BOSS commands with the New3DS bitmask in the programID set.
The common and language-specific(when offset is non-zero) "CGFX"
specified by the CBMD are decompressed and processed.

The "CGFX" sections in this CBMD are actually the exact same exbanners
loaded from normal extdata. The exbanner data from SpotPass is stored to
the same state as the extdata-exbanners. No CWAV is loaded from SpotPass
data.

The exbanners from SpotPass must have a timestamp less than
current_datetime, otherwise they won't be parsed. The timestamp for the
banner is calculated with:
`nintimestamp_mktime(out, exbanner->year, exbanner->month, exbanner->day, <hour=23>, <minute = 59>, <second = 59>, <millisecond = 999>);`

## Format

Extension: .BIN

| OFFSET | SIZE  | DESCRIPTION                                                                           |
|--------|-------|---------------------------------------------------------------------------------------|
| 0x000  | 0x002 | Texture width (if texture is used)                                                    |
| 0x002  | 0x002 | Texture height (if texture is used)                                                   |
| 0x004  | 0x002 | Texture colour format (if texture is used)                                            |
| 0x006  | 0x004 | Year to expire                                                                        |
| 0x00A  | 0x002 | Month to expire                                                                       |
| 0x00C  | 0x002 | Day to expire                                                                         |
| 0x00E  | 0x016 | Name of texture (if texture is used)                                                  |
| 0x024  | 0x200 | Plain text comment (255 character max) to be displayed in the banner on the HOME Menu |
| 0x224  |       | If used, this is where the extra texture is located, otherwise file ends.             |
|        |       |                                                                                       |

The date used for never-expiring exbanners varies, on retail like with
Mii Maker this is December 31, 2099, where year is 0x833, month is 0xC,
and day is 0x1F. The expiration-timestamp is only used for SpotPass
exbanners, not extdata-exbanners.

## Texture Colour Formats

| CODE | ENCODING |
|------|----------|
| 0x00 | RGBA8    |
| 0x01 | RGB8     |
| 0x02 | RGBA5551 |
| 0x03 | RGBA565  |
| 0x04 | RGBA4    |
| 0x05 | LA8      |
| 0x06 | HILO8    |
| 0x07 | L8       |
| 0x08 | A8       |
| 0x09 | LA4      |
| 0x0A | L4       |
| 0x0B | A4       |
| 0x0C | ETC1     |
| 0x0D | ETC1A4   |
|      |          |

## Titles using extended banners

System:

- [Mii Maker](Mii_Maker "wikilink")
- [Face Raiders](Face_Raiders "wikilink")