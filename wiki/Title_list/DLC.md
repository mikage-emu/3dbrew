[Go Back to Title list](Title_list "wikilink")

## Overview

These are titles which provide downloadable content to a specific title.
The reason why these titles can only be purchased in game, is because
all DLC content is under a set of title(s), downloading via the eShop
would download all DLC content. And because all DLC content is under a
set of title(s), they are viewed as one(?) title in system settings, and
individual DLC can only be deleted from within the game which uses the
DLC.

The titleID-low for DLC is: ((uniqueID\<\<8) \| DLC_title_index).
DLC_title_index starts at zero. Each DLC item is grouped under a
DLC_title_index. Usually an application only has one DLC_title_index,
but for applications which have a \*lot\* of DLC there's more than one
DLC_title_index(JPN Home Menu for themes for example).

Every DLC title include [NCCH](NCCH "wikilink") partitions. The first
one is always content metadata.

## Content metadata structure

The first [NCCH](NCCH "wikilink") partition of a DLC title. It
determines region, language and DLC icons. The ExeFS section of content
metadata only contains [icon](SMDH "wikilink") section. The RomFS
section contains "icons" directory, a MetaDataContentHeader.bin file and
some ContentInfoArchive files.

### icons directory

Contains DLC icons (.icn files).

### MetaDataContentHeader.bin

| Offset | Size     | Description                                          |
|--------|----------|------------------------------------------------------|
| 0x0    | 0x4      | Number of disabled DLC                               |
| 0x4    | 0x4      | Number of enabled DLC                                |
| 0x8    | 0x4      | Number of .icn files in "icons" directory            |
| 0xC    | 0x4      | Company Code                                         |
| 0x10   | 0x4      | Magic number, always 0xDEADBEEF (little endian)      |
| 0x14   | 0x4 \* 7 | Region data (see below)                              |
| 0x30   | 0x4      | Number of ContentInfoArchive file (n)                |
| 0x34   | 0x4 \* n | Region data of ContentInfoArchive files (see below). |

#### Region data

The first, the second and the third record of the main region data is
often assigned to JPN, USA, EUR region respectively.

| Offset | Size | Description |
|--------|------|-------------|
| 0x0    | 0x2  | Region ID   |
| 0x2    | 0x2  | Language ID |

#### Region IDs

| ID  | Region code | Region name   |
|-----|-------------|---------------|
| 0x0 | JPN         | Japan         |
| 0x1 | USA         | North America |
| 0x2 | EUR         | Europe        |
| 0x3 | EUR         | Australia     |
| 0x4 | CHN         | China         |
| 0x5 | KOR         | Korea         |
| 0x6 | TWN         | Taiwan        |

#### Language IDs

| ID  | Language code | Language            |
|-----|---------------|---------------------|
| 0x0 | ja            | Japanese            |
| 0x1 | en            | English             |
| 0x2 | fr            | French              |
| 0x3 | de            | German              |
| 0x4 | it            | Italian             |
| 0x5 | es            | Spanish             |
| 0x7 | ko            | Korean              |
| 0x8 | nl            | Dutch               |
| 0x9 | pt            | Portuguese          |
| 0xA | ru            | Russian             |
| 0xB | zh            | Traditional Chinese |

#### Example

MetaDataContentHeader.bin in Fire Emblem Awakening DLC (EUR):

`Offset(h) 00 01 02 03 04 05 06 07 08 09 0A 0B 0C 0D 0E 0F`

`00000000  01 00 00 00 19 00 00 00 19 00 00 00 30 00 30 00  ............0.0.`
`00000010  EF BE AD DE FF FF FF FF FF FF FF FF 02 00 01 00  ï¾.Þÿÿÿÿÿÿÿÿ....`
`00000020  FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF  ÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿÿ`
`00000030  08 00 00 00 02 00 01 00 02 00 05 00 02 00 02 00  ................`
`00000040  02 00 03 00 02 00 04 00 02 00 08 00 02 00 09 00  ................`
`00000050  02 00 0A 00                                      ....`

### ContentInfoArchive files

The name of these files follow this format:
ContentInfoArchive_<region code>_<language code>.bin (<region code>
and <language code> are determined in MetaDataContentHeader.bin)

| Offset | Size            | Description                |
|--------|-----------------|----------------------------|
| 0x0    | 0x4             | Number of disabled DLC (m) |
| 0x4    | 0x4             | Number of enabled DLC (n)  |
| 0x8    | 0xC8 \* (n + m) | DLC data (see below)       |

#### DLC data

| Offset | Size | Description                               |
|--------|------|-------------------------------------------|
| 0x0    | 0x40 | Content title (UTF-8)                     |
| 0x40   | 0x80 | Content description (UTF-8)               |
| 0xC0   | 0x4  | .icn file index.                          |
| 0xC4   | 0x4  | 1 if this content is enabled, otherwise 0 |

## List

| TitleID Low | Region | Description                                                                                                           | Versions                              |
|-------------|--------|-----------------------------------------------------------------------------------------------------------------------|---------------------------------------|
| 00008800    | JPN    | [New 3DS](New_3DS "wikilink") [Internet Browser](Internet_Browser "wikilink") DLC, used for disabling the web filter. | v0                                    |
| 0015D800    | USA    | IronFall Invasion \[DLC\]                                                                                             | Unknown                               |
| 00022800    | EUR    | StreetPass Mii Plaza \[DLC\]                                                                                          | v5                                    |
| 00068300    | ?      | ?                                                                                                                     | v0, v256                              |
| 00072000    | ?      | ?                                                                                                                     | v0, v128                              |
| 00072A00    | ?      | ?                                                                                                                     | v0                                    |
| 00078200    | ?      | ?                                                                                                                     | v0, v64                               |
| 0007AD00    | JPN    | New SUPER MARIO BROS. 2 \[DLC\]                                                                                       | v16, v48                              |
| 0007AE00    | USA    | New SUPER MARIO BROS. 2 \[DLC\]                                                                                       | v16, v48                              |
| 0007AF00    | EUR    | New SUPER MARIO BROS. 2 \[DLC\]                                                                                       | v0 (may never have existed), v16, v48 |
| 000B8900    | KOR    | New SUPER MARIO BROS. 2 \[DLC\]                                                                                       | v16                                   |
| 00084F00    | ?      | ?                                                                                                                     | v0, v80                               |
| 0008CC00    | ?      | ?                                                                                                                     | v0, v16                               |
| 00090E00    | ?      | ?                                                                                                                     | v0                                    |
| 00091600    | ?      | ?                                                                                                                     | v0, v16                               |
| 00095100    | ?      | ?                                                                                                                     | v0, v16                               |
| 00095700    | ?      | ?                                                                                                                     | v0, v96                               |
| 00095800    | ?      | ?                                                                                                                     | v0, v32, v48                          |
| 0009AB00    | ?      | ?                                                                                                                     | v0                                    |
| 0009AC00    | ?      | ?                                                                                                                     | v0                                    |
| 0009AD00    | ?      | ?                                                                                                                     | v0                                    |
| 0009AE00    | ?      | ?                                                                                                                     | v0                                    |
| 000A4D00    | ?      | ?                                                                                                                     | v0                                    |

## Tools

- [EveryFileExplorer](https://github.com/Gericom/EveryFileExplorer) Open
  .icn files.