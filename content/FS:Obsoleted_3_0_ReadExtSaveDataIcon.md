+++
title = 'FS:Obsoleted 3 0 ReadExtSaveDataIcon'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x08320102\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Save ID                                           |
| 4          | [SMDH](SMDH "wikilink") size                           |
| 5          | ([SMDH](SMDH "wikilink") size\<\<4) \| 12              |
| 6          | [SMDH](SMDH "wikilink") Data Pointer                   |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Resultcode      |
| 2          | Total read data |