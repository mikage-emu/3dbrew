+++
title = 'FS:OpenDirectory'
+++

# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x080B0102\]                           |
| 1-2        | u64, Archive Handle                                  |
| 3          | [Path Type](Filesystem_services#pathtype "wikilink") |
| 4          | Path Size                                            |
| 5          | (PathSize \<\< 14) \| 2                              |
| 6          | Path Data Pointer                                    |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Result code      |
| 3          | Directory Handle |
