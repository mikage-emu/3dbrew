+++
title = 'FS:CreateSystemSaveData'
+++

# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x08560240\]                                              |
| 1-2        | [SystemSaveDataInfo](Filesystem_services#SystemSaveDataInfo "wikilink") |
| 3          | Total Size                                                              |
| 4          | Block Size (usually 0x1000)                                             |
| 5          | Number of Directories                                                   |
| 6          | Number of Files                                                         |
| 7          | Directory Bucket Count                                                  |
| 8          | File Bucket Count                                                       |
| 9          | u8, 0 = don't duplicate data, 1 = duplicate data                        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Creates [system save data](System_SaveData "wikilink").

See [here](RomFS#HashKey_Table_Structure "wikilink") for an example of
how bucket counts should be calculated.