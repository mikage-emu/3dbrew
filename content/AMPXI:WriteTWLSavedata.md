+++
title = 'AMPXI:WriteTWLSavedata'
+++

# Request

| Index Word | Description                                                    |
|------------|----------------------------------------------------------------|
| 0          | Header code \[0x00460182\]                                     |
| 1-2        | u64, TWL Title ID                                              |
| 3          | Input size                                                     |
| 4          | NAND file offset                                               |
| 5          | u8, Section type. See below.                                   |
| 6          | u8, [Operation](AM:ImportDSiWare "wikilink"). Must be 5 or 11. |
| 7          | (Size \<\< 8) \| 6                                             |
| 8          | Input pointer                                                  |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00460040\] |
| 1          | Result code                |

# Section types

| Section type | Allowed with operation type | Written filename | Normal filename |
|--------------|-----------------------------|------------------|-----------------|
| 5            | Both                        | "public.new"     | "public.sav"    |
| 6            | Both                        | "banner.new"     | "banner.sav"    |
| 7            | 11                          | "private.new"    | "private.sav"   |

# Description

This writes the specified input plaintext buffer data to the specified
TWL-NAND title raw ".new" file. The file which is written to in NAND
depends on the section_type.

The ".new" files written by this are moved to the regular filenames by
[AMPXI:InstallTitlesFinish](AMPXI:InstallTitlesFinish "wikilink") /
other install-finish command(s).

When used with sections which the title doesn't actually use, this
command returns 0, but after the DSiWare import is all finished the
.sav/.new files for those sections don't exist under the NAND data/. The
filesizes are also set to the sizes used by the title by the time the
import is finished(trying to write larger savedata with this command
doesn't change the final filesize in NAND).