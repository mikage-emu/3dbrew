+++
title = 'FS:DeleteDirectoryRecursively'
+++

# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x08070142\]                           |
| 1          | Transaction (usually 0)                              |
| 2-3        | u64, Archive Handle                                  |
| 4          | [Path Type](Filesystem_services#pathtype "wikilink") |
| 5          | Path Size                                            |
| 6          | (PathSize \<\< 14) \| 0x2                            |
| 7          | Path Data Pointer                                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
