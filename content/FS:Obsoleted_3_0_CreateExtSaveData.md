+++
title = 'FS:Obsoleted 3 0 CreateExtSaveData'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x08300182\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Save ID                                           |
| 4          | [SMDH](SMDH "wikilink") Size                           |
| 5          | Number of directories                                  |
| 6          | Number of files                                        |
| 7          | ([SMDH](SMDH "wikilink") Size \<\< 4) \| 0xA           |
| 8          | [SMDH](SMDH "wikilink") Data Pointer                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This has been obsoleted. It now wraps around the new
[FS:CreateExtSaveData](FS:CreateExtSaveData "wikilink").