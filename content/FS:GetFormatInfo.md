+++
title = 'FS:GetFormatInfo'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x084500C2\]                             |
| 1          | [Archive ID](Filesystem_services#archiveid "wikilink") |
| 2          | [Path Type](Filesystem_services#pathtype "wikilink")   |
| 3          | Path Size                                              |
| 4          | (PathSize \<\< 14) \| 2                                |
| 5          | Path Data Pointer                                      |

# Response

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code                                      |
| 1          | Result code                                      |
| 2          | Total Size                                       |
| 3          | Number of Directories                            |
| 4          | Number of Files                                  |
| 5          | u8, 0 = don't duplicate data, 1 = duplicate data |
