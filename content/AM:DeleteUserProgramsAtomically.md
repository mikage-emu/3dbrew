+++
title = 'AM:DeleteUserProgramsAtomically'
+++

This checks each [Title ID](Titles#title_ids "wikilink") for being a CTR
System Title (Content Category mask 0x10) or a TWL System Title (Content
Category mask 0x8000 and mask 0x100000000). If any were found, this will
return 0xE0E0802C (Trying to uninstall system title).

Due to this check, it is safe to say that the [Media
Type](Filesystem_services#mediatype "wikilink") must be SD.

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00290082\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2          | Title Count                                            |
| 3          | ((Title Count \* 8) \<\< 4) \| 0xA                     |
| 4          | Title IDs Input Pointer                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wraps
[AMPXI:DeleteProgramsAtomically](AMPXI:DeleteProgramsAtomically "wikilink").
