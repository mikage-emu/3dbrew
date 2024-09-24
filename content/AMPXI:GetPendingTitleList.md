# Request

| Index Word | Description                                                                   |
|------------|-------------------------------------------------------------------------------|
| 0          | Header code \[0x001E00C2\]                                                    |
| 1          | Title count                                                                   |
| 2          | [MediaType](Filesystem_services#MediaType "wikilink")                         |
| 3          | Status mask (bit0 = include installing, bit1 = include awaiting finalization) |
| 3          | (TitleCount \* 8) \<\< 8 \| 4                                                 |
| 4          | Title IDs output pointer                                                      |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001E0080\] |
| 1          | Result code                |
| 2          | Number of entries returned |

# Description

Gets a list of title IDs that are currently pending installation.