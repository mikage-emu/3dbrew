# Request

| Index Word | Description                                                       |
|------------|-------------------------------------------------------------------|
| 0          | Header code \[0x08510242\]                                        |
| 1-4        | [ExtSaveDataInfo](Filesystem_services#ExtSaveDataInfo "wikilink") |
| 5          | Number of Directories                                             |
| 6          | Number of Files                                                   |
| 7-8        | u64, Size Limit (default = -1)                                    |
| 9          | [SMDH](SMDH "wikilink") Size                                      |
| 10         | ([SMDH](SMDH "wikilink") Size \<\< 4) \| 0xA                      |
| 11         | [SMDH](SMDH "wikilink") Data Pointer                              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This creates the ExtSaveData with the specified saveid in the specified
media type. It stores the SMDH as "icon" in the root of the created
directory. For more information see
[Extdata#VSXE_Filesystem_structure](Extdata#VSXE_Filesystem_structure "wikilink")