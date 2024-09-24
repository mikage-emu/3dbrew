+++
title = 'CBMD'
categories = ["File formats"]
+++

**CBMD - CTR Banner Model Data**

This page describes the format used for banners' models. These are
stored in [CXI](NCCH#CXI "wikilink") ExeFS:/banner and optionally in
[extdata](extdata "wikilink") exbanner. CBMD is a container file for
[CGFX](CGFX "wikilink") blocks. This is used for banners of titles you
see in the home menu. BNR used for the app banners in the CXI/exbanner
is the same as CBMD with CWAV at the end.

## CBMD Header

| Offset | Length | Description                                                           |
|--------|--------|-----------------------------------------------------------------------|
| 0x0    | 0x4    | Magic "CBMD"                                                          |
| 0x4    | 0x4    | Zero                                                                  |
| 0x8    | 0x4    | Offset for common [CGFX](CGFX "wikilink")                             |
| 0xc    | 0x34   | Optional offsets for region/language specific [CGFX](CGFX "wikilink") |
| 0x40   | 0x44   | Padding?                                                              |
| 0x84   | 0x4    | [BCWAV](BCWAV "wikilink") offset                                      |

The common [CGFX](CGFX "wikilink") is used if the CGFX offset for the
system region/language is zero. Those optional offsets can be used in
extdata exbanner, but separate CBMD banner files for each
region/language can be used as well.

### Indexes for CGFX offset array

| Index | Description    |
|-------|----------------|
| 0     | EUR-English    |
| 1     | EUR-French     |
| 2     | EUR-German     |
| 3     | EUR-Italian    |
| 4     | EUR-Spanish    |
| 5     | EUR-Dutch      |
| 6     | EUR-Portuguese |
| 7     | EUR-Russian    |
| 8     | JPN-Japanese   |
| 9     | USA-English    |
| 10    | USA-French     |
| 11    | USA-Spanish    |
| 12    | USA-Portuguese |

## CGFX

[CGFX](CGFX "wikilink") are compressed using LZ11. For CXI banner CGFX,
the decompressed size must be no larger than 0x80000.

Graphics containers. Contains: 3D Models, Shaders, Objects, Materials,
Textures, etc. See [CGFX](CGFX "wikilink") for more information.

## BCWAV

The included [BCWAV](BCWAV "wikilink") total channels must be 2, and the
length of the audio must be 3 seconds or less, otherwise the sound will
play incorrectly (beeping/clicking) or the model may fail to load.

[Category:File formats](Category:File_formats "wikilink")
