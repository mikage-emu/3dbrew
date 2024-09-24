# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x08040142\]                           |
| 1          | Transaction (usually 0)                              |
| 2-3        | u64, Archive Handle                                  |
| 4          | [Path Type](Filesystem_services#PathType "wikilink") |
| 5          | Path Size                                            |
| 6          | (PathSize \<\< 14) \| 2                              |
| 7          | Path Data Pointer                                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |