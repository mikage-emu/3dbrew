+++
title = 'FS:OpenFile'
+++

# Request

| Index Word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | Header code \[0x080201C2\]                                          |
| 1          | Transaction (usually 0)                                             |
| 2-3        | u64, Archive Handle                                                 |
| 4          | [Path Type](Filesystem_services#pathtype "wikilink")                |
| 5          | Path Size (including null-terminator)                               |
| 6          | [Open Flags](Filesystem_services#openflags "wikilink")              |
| 7          | [Attributes](Filesystem_services#attributes "wikilink") (usually 0) |
| 8          | (PathSize \<\< 14) \| 2                                             |
| 9          | Path Data Pointer                                                   |

# Response

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code                   |
| 1          | Result code                   |
| 2          | Move handle descriptor (0x10) |
| 3          | File client session handle    |
