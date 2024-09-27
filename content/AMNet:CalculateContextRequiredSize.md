+++
title = 'AMNet:CalculateContextRequiredSize'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x08250102\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                          |
| 4          | Content Count                                          |
| 5          | ((Content Count \* 2) \<\< 4) \| 0xA                   |
| 6          | Content Indices Input Pointer                          |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2-3        | u64, Required Size |
