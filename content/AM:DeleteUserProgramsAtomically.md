+++
title = 'AM:DeleteUserProgramsAtomically'
+++

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

Wraps [AMPXI:DeleteProgramsAtomically](AMPXI:DeleteProgramsAtomically "wikilink"), but imposes a restriction on the title IDs such that system titles (CTR or TWL) are not allowed.
