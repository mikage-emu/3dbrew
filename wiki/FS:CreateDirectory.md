# Request

| Index Word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | Header code \[0x08090182\]                                          |
| 1          | Transaction (usually 0)                                             |
| 2-3        | u64, Archive Handle                                                 |
| 4          | [Path Type](Filesystem_services#PathType "wikilink")                |
| 5          | Path Size                                                           |
| 6          | [Attributes](Filesystem_services#Attributes "wikilink") (usually 0) |
| 7          | (PathSize \<\< 14) \| 2                                             |
| 8          | Path Data Pointer                                                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |