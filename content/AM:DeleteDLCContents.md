+++
title = 'AM:DeleteDLCContents'
+++

TID high value must be 0x0004008C, otherwise error 0xE0E0803C is
returned.

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x10040102\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                          |
| 4          | Content Count                                          |
| 5          | ((Content Count \* 2) \<\< 4) \| 0xA                   |
| 6          | Content Indices Input Pointer                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
