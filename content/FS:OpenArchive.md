+++
title = 'FS:OpenArchive'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x080C00C2\]                             |
| 1          | [Archive ID](Filesystem_services#ArchiveId "wikilink") |
| 2          | [Path Type](Filesystem_services#PathType "wikilink")   |
| 3          | Path Size (including null-terminator)                  |
| 4          | (PathSize \<\< 14) \| 2                                |
| 5          | Path Data Pointer                                      |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2-3        | u64, Archive Handle |