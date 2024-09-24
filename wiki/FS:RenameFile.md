# Request

| Index Word | Description                                                           |
|------------|-----------------------------------------------------------------------|
| 0          | Header code \[0x08050244\]                                            |
| 1          | Transaction (usually 0)                                               |
| 2-3        | u64, Source Archive Handle                                            |
| 4          | [Source File Path Type](Filesystem_services#PathType "wikilink")      |
| 5          | Source File Path Size                                                 |
| 6-7        | u64, Destination Archive Handle                                       |
| 8          | [Destination File Path Type](Filesystem_services#PathType "wikilink") |
| 9          | Destination File Path Size                                            |
| 10         | (SourceFilePathSize \<\< 14) \| 0x402                                 |
| 11         | Source File Path Data                                                 |
| 12         | (DestinationFilePathSize \<\< 14) \| 0x802                            |
| 13         | Destination File Path Data                                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Renames or moves a file. The file is moved from the path srcFileLowPath
in archive srcArchive to destFileLowPath in destArchive. *This call does
not work with directories*, use
[RenameDirectory](FS:RenameDirectory "wikilink") instead. Renaming
across different archives is not allowed, as listed below.

# Errors

| Result code | Description                                                       |
|-------------|-------------------------------------------------------------------|
| 0           | Returned on success.                                              |
| 0xC8804478  | When the source file does not exist or is a directory.            |
| 0xC82044BE  | When the destination file already exists.                         |
| 0xE0C046F8  | When the source archive and destination archive are not the same. |