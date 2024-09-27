+++
title = 'AM:GetImportContentContextList'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00100102\]                             |
| 1          | Import Content Context Count                           |
| 2          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 3-4        | u64, Title ID                                          |
| 5          | ((Import Content Context Count \* 2) \<\< 4) \| 0xC    |
| 6          | Import Content Context Indices Output Pointer          |

# Response

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | Header code                                   |
| 1          | Result code                                   |
| 2          | Number of Read Import Content Context Indices |

# Description

Wraps
[AMPXI:GetImportContentContextList](AMPXI:GetImportContentContextList "wikilink").
