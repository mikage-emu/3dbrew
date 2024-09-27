+++
title = 'FS:OpenFileDirectly'
+++

# Request

| Index Word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | Header code \[0x08030204\]                                          |
| 1          | Transaction (usually 0)                                             |
| 2          | [Archive ID](Filesystem_services#ArchiveId "wikilink")              |
| 3          | [Archive Path Type](Filesystem_services#PathType "wikilink")        |
| 4          | Archive Path Size (including null-terminator)                       |
| 5          | [File Path Type](Filesystem_services#PathType "wikilink")           |
| 6          | File Path Size (including null-terminator)                          |
| 7          | [Open Flags](Filesystem_services#OpenFlags "wikilink")              |
| 8          | [Attributes](Filesystem_services#Attributes "wikilink") (usually 0) |
| 9          | (ArchivePathSize \<\< 14) \| 0x802                                  |
| 10         | Archive Path Data Pointer                                           |
| 11         | (FilePathSize \<\< 14) \| 2                                         |
| 12         | File Path Data Pointer                                              |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code                |
| 1          | Result code                |
| 2          | N/A                        |
| 3          | File client session handle |