# Request

| Index Word | Description                                                                |
|------------|----------------------------------------------------------------------------|
| 0          | Header code \[0x000101C2\]                                                 |
| 1          | Transaction (usually 0)                                                    |
| 2          | Archive handle lower word                                                  |
| 3          | Archive handle upper word                                                  |
| 4          | LowPath.Type                                                               |
| 5          | LowPath.Size                                                               |
| 6          | Open flags (see [FS:OpenFile#OpenFlags](FS:OpenFile#OpenFlags "wikilink")) |
| 7          | Attributes (usually 0)                                                     |
| 8          | (LowPath.Size\<\<8) \| 6                                                   |
| 9          | LowPath.Data pointer                                                       |

# Response

| Index Word | Description            |
|------------|------------------------|
| 0          | Header code            |
| 1          | Result code            |
| 2          | File handle lower word |
| 3          | File handle upper word |
| 4          | 4                      |