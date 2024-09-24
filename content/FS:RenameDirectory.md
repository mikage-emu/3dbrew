# Request

| Index Word | Description                                                                |
|------------|----------------------------------------------------------------------------|
| 0          | Header code \[0x080A0244\]                                                 |
| 1          | Transaction (usually 0)                                                    |
| 2-3        | u64, Source Archive Handle                                                 |
| 4          | [Source Directory Path Type](Filesystem_services#PathType "wikilink")      |
| 5          | Source Directory Path Size                                                 |
| 6-7        | u64, Destination Archive Handle                                            |
| 8          | [Destination Directory Path Type](Filesystem_services#PathType "wikilink") |
| 9          | Destination Directory Path Size                                            |
| 10         | (SourceDirectoryPathSize \<\< 14) \| 0x402                                 |
| 11         | Source Directory Path Data Pointer                                         |
| 12         | (DestinationDirectoryPathSize \<\< 14) \| 0x802                            |
| 13         | Destination Directory Path Data Pointer                                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Renames or moves a directory. The file is moved from the path
srcDirLowPath in archive srcArchive to destDirLowPath in destArchive.
Renaming across different archives is not allowed, as listed below.

# Errors

| Result code | Description                                                       |
|-------------|-------------------------------------------------------------------|
| 0           | Returned on success.                                              |
| 0xC8804478  | When the source directory does not exist or is a file.            |
| 0xC82044BE  | When the destination directory already exists.                    |
| 0xE0C046F8  | When the source archive and destination archive are not the same. |