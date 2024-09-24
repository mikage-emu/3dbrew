# Request

| Index Word | Description                                                              |
|------------|--------------------------------------------------------------------------|
| 0          | Header code \[0x002400C2\]                                               |
| 1          | Import Title Context Count                                               |
| 2          | [Media Type](Filesystem_services#MediaType "wikilink")                   |
| 3          | Filter (bit0 = include installing, bit1 = include awaiting finalization) |
| 4          | ((Import Title Context Count \* 8) \<\< 4) \| 0xC                        |
| 5          | Import Title Context Title IDs Output Pointer                            |

# Response

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | Header code                                   |
| 1          | Result code                                   |
| 2          | Number of Read Import Title Context Title IDs |