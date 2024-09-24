+++
title = 'FS:Obsoleted 2 0 FormatThisUserSaveData'
+++

# Request

| Index Word | Description                                                   |
|------------|---------------------------------------------------------------|
| 0          | Header code \[0x080F0180\]                                    |
| 1          | Size of a block. Only 0x200 and 0x1000 are accepted it seems. |
| 2          | Number of Directories                                         |
| 3          | Number of Files                                               |
| 4          | Directory Bucket Count                                        |
| 5          | File Bucket Count                                             |
| 6          | u8, 0 = don't duplicate data, 1 = duplicate data              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This has been obsoleted. Prefer
[FS:FormatSaveData](FS:FormatSaveData "wikilink").
