+++
title = 'FS:GetLegacyRomHeader'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x083B00C2\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Program ID                                        |
| 4          | (0x3B4 \<\< 4) \| 0xC                                  |
| 5          | Output Pointer (size 0x3B4)                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |