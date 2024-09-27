+++
title = 'FS:ReadExtSaveDataIcon'
+++

# Request

| Index Word | Description                                                       |
|------------|-------------------------------------------------------------------|
| 0          | Header code \[0x08530142\]                                        |
| 1-4        | [ExtSaveDataInfo](Filesystem_services#ExtSaveDataInfo "wikilink") |
| 5          | [SMDH](SMDH "wikilink") Size                                      |
| 6          | ([SMDH](SMDH "wikilink") Size \<\< 4) \| 0xC                      |
| 7          | [SMDH](SMDH "wikilink") Data Pointer                              |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | Total Read Data |
