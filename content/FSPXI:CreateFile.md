+++
title = 'FSPXI:CreateFile'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x00050202\]                              |
| 1          | Transaction (usually 0)                                 |
| 2          | Archive handle lower word                               |
| 3          | Archive handle upper word                               |
| 4          | LowPath.Type                                            |
| 5          | LowPath.Size                                            |
| 6          | [Attributes](Filesystem_services#attributes "wikilink") |
| 7          | File size lower word                                    |
| 8          | File size upper word                                    |
| 9          | (LowPath.Size\<\<8) \| 6                                |
| 10         | LowPath.Data pointer                                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
