+++
title = 'Y2R Registers'
+++

# Registers

| Old3DS | Name                                 | Address    | Width | Used by                                       |
|--------|--------------------------------------|------------|-------|-----------------------------------------------|
| Yes    | [Y2R_PARAMS](#Y2R_PARAMS "wikilink") | 0x10102000 | 4     | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_LINEW                            | 0x10102004 | 2     | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_LINES                            | 0x10102006 | 2     | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_COEFFICIENTS                     | 0x10102010 | 0x10  | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_ALPHA                            | 0x10102020 | 2     | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_???                             | 0x10102100 | 0x20  | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_INPUT_Y                          | 0x10302000 | 0x80? | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_INPUT_U                          | 0x10302080 | 0x80? | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_INPUT_V                          | 0x10302100 | 0x80? | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_INPUT_X?                         | 0x10302180 | 0x80? | [Camera Services](Camera_Services "wikilink") |
| Yes    | Y2R_OUTPUT_RGB                       | 0x10302200 | 0x80? | [Camera Services](Camera_Services "wikilink") |

## Y2R_PARAMS

| BIT   | DESCRIPTION            |
|-------|------------------------|
| 0-3   | InputFormat            |
| 8-9   | OutputFormat           |
| 10-11 | Rotation               |
| 12    | BlockAlignment         |
| 15    | ?                      |
| 16    | ?                      |
| 17    | ?                      |
| 21    | ?                      |
| 22    | ?                      |
| 24    | ?                      |
| 25    | ?                      |
| 26    | ?                      |
| 27    | ?                      |
| 28    | ?                      |
| 29    | ?                      |
| 30    | Transfer end interrupt |
| 31    | Enable/Busy            |