# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x08080202\]                              |
| 1          | Transaction (usually 0)                                 |
| 2-3        | u64, Archive Handle                                     |
| 4          | [Path Type](Filesystem_services#PathType "wikilink")    |
| 5          | Path Size                                               |
| 6          | [Attributes](Filesystem_services#Attributes "wikilink") |
| 7-8        | u64, Bytes to fill with zeroes in the file              |
| 9          | (PathSize \<\< 14) \| 2                                 |
| 10         | Path Data Pointer                                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Errors

| Result code | Description                                                     |
|-------------|-----------------------------------------------------------------|
| 0           | Returned on success.                                            |
| 0x82044BE   | There is already a file or directory in the requested location. |
| 0x86044D2   | The created file is too large.                                  |