+++
title = 'FS:Obsoleted 2 0 FormatCtrCardUserSaveData'
+++

# Request

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x08470180\]                       |
| 1          | Size in Blocks (1 block = 512 bytes)             |
| 2          | Number of Directories                            |
| 3          | Number of Files                                  |
| 4          | Directory Bucket Count                           |
| 5          | File Bucket Count                                |
| 6          | u8, 0 = don't duplicate data, 1 = duplicate data |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This has been obsoleted. Prefer
[FS:FormatSaveData](FS:FormatSaveData "wikilink").
