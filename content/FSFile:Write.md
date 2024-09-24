+++
title = 'FSFile:Write'
+++

# Request

| Index Word | Description                                               |
|------------|-----------------------------------------------------------|
| 0          | Header code \[0x08030102\]                                |
| 1-2        | u64, File Offset                                          |
| 3          | Size                                                      |
| 4          | [WriteOption](Filesystem_services#WriteOption "wikilink") |
| 5          | (Size \<\< 4) \| 0xA                                      |
| 6          | Data Pointer                                              |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | Total written data |
