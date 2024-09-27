+++
title = 'APT:GetAppletProgramInfo'
+++

# Request

| Index Word | Description                                                     |
|------------|-----------------------------------------------------------------|
| 0          | Header code \[0x004D0080\]                                      |
| 1          | [AppID](NS_and_APT_Services#AppIDs "wikilink") / Program ID Low |
| 2          | Flags                                                           |

# Response

| Index Word | Description                                                                                                                                                                             |
|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                                                                                             |
| 1          | Result code                                                                                                                                                                             |
| 2          | u16, Title Version (from [AMNet:ListTitles](AMNet:ListTitles "wikilink"), only returns version & 0xFC00 as of the [NS](NS "wikilink") title-version for [9.3.0-X](9.3.0-21 "wikilink")) |

# Flags

| Bit Mask | Description                                                                                                                                                                                                           |
|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x1      | When set, this enables using [AMNet:ListTitles](AMNet:ListTitles "wikilink") with [MediaType](Filesystem_services#MediaType "wikilink") = NAND.                                                                       |
| 0x2      | When set, this enables using [AMNet:ListTitles](AMNet:ListTitles "wikilink") with [MediaType](Filesystem_services#MediaType "wikilink") = SD.                                                                         |
| 0x4      | When set, this enables using [AMNet:ListTitles](AMNet:ListTitles "wikilink") with [MediaType](Filesystem_services#MediaType "wikilink") = gamecard.                                                                   |
| 0x10     | When set, the Program ID is determined via the input [AppID](NS_and_APT_Services#AppIDs "wikilink"). When clear, Program ID Low = input cmdword\[1\], with the Program ID High determined by the following bit masks. |
| 0x20     | This bit mask must be set when bit mask 0x10 is not set, otherwise an error is returned.                                                                                                                              |
| 0x100    | This is used when bit mask 0x10 is clear and bit mask 0x20 is set. When this is clear, Program ID High = 0x00040000, otherwise Program ID High = 0x00040010.                                                          |

# Description

This returns the title-version for the specified applet/application. NS
will attempt to use [AMNet:ListTitles](AMNet:ListTitles "wikilink") for
each [MediaType](Filesystem_services#MediaType "wikilink") when the bit
mask for the [MediaType](Filesystem_services#MediaType "wikilink") is
enabled, in the following order: NAND, SD, and Gamecard.
