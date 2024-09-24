+++
title = 'FS:GetLegacyBannerData'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x083C00C2\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Program ID                                        |
| 4          | (0x23C0 \<\< 4) \| 0xC                                 |
| 5          | Output Pointer (size 0x23C0)                           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
