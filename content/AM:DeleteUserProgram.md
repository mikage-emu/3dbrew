+++
title = 'AM:DeleteUserProgram'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x000400C0\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is an interface for
[AMPXI:DeleteTitle](AMPXI:DeleteTitle "wikilink"). This is the same as
[AM:DeleteProgram](AM:DeleteProgram "wikilink"), except for this command
AM module checks the titleID-high before using the PXIAM command. AM
module will return error 0xE0E0802C when the input TWL/CTR titleID-high
has the system-title bit set(bit4 for CTR, bit0 for TWL).
