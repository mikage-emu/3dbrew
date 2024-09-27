+++
title = 'FS:Obsoleted 3 0 CreateSystemSaveData'
+++

# Request

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x08100200\]                       |
| 1          | Save ID                                          |
| 2          | Total Size                                       |
| 3          | Block Size (usually 0x1000)                      |
| 4          | Number of Directories                            |
| 5          | Number of Files                                  |
| 6          | Directory Bucket Count                           |
| 7          | File Bucket Count                                |
| 8          | u8, 0 = don't duplicate data, 1 = duplicate data |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This has been obsoleted. It has been replaced with the new
[FS:CreateSystemSaveData](FS:CreateSystemSaveData "wikilink").