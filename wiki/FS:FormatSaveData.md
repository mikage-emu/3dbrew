# Request

| Index Word | Description                                                                                                                                       |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x084C0242\]                                                                                                                        |
| 1          | [Archive ID](Filesystem_services#ArchiveId "wikilink"). This must be either 0x4 (SaveData) or 0x567890B2, otherwise error 0xE0E046BE is returned. |
| 2          | [Path Type](Filesystem_services#PathType "wikilink")                                                                                              |
| 3          | Path Size                                                                                                                                         |
| 4          | Size of a block. Only 0x200 and 0x1000 are accepted it seems. The value of this word is hard-coded to 0x200 in official titles it appears.        |
| 5          | Number of Directories                                                                                                                             |
| 6          | Max number of Files                                                                                                                               |
| 7          | Directory Bucket Count                                                                                                                            |
| 8          | File Bucket Count                                                                                                                                 |
| 9          | u8, 0 = don't duplicate data, 1 = duplicate data                                                                                                  |
| 10         | (PathSize \<\< 14) \| 2                                                                                                                           |
| 11         | Path Data Pointer                                                                                                                                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This clears the SaveData archive for the specified game, if the
LowPath.Type is Empty then this will clear the SaveData for the current
game. The target SaveData to format is determined by a Binary path, a
game needs an exheader permission set in order to format the SaveData of
another program.

See [here](RomFS#Hash_Table_Structure "wikilink") for an example of how
bucket counts should be calculated.