# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x00060182\]                              |
| 1          | Transaction (usually 0)                                 |
| 2          | Archive handle lower word                               |
| 3          | Archive handle upper word                               |
| 4          | LowPath.Type                                            |
| 5          | LowPath.Size                                            |
| 6          | [Attributes](Filesystem_services#Attributes "wikilink") |
| 7          | (LowPath.Size\<\<8) \| 6                                |
| 8          | LowPath.Data pointer                                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |