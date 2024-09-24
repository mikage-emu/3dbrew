# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x084D0102\]                             |
| 1          | Output Size                                            |
| 2          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 3-4        | u64, Program ID                                        |
| 4          | (OutputSize \<\< 4) \| 0xC                             |
| 5          | Output Pointer                                         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |