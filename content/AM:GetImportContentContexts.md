+++
title = 'AM:GetImportContentContexts'
+++

# Request

| Index Word | Description                                                                                            |
|------------|--------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00110104\]                                                                             |
| 1          | Import Content Context Count                                                                           |
| 2          | [Media Type](Filesystem_services#mediatype "wikilink")                                                 |
| 3-4        | u64, Title ID                                                                                          |
| 5          | ((Import Content Context Count \* 2) \<\< 4) \| 0xA                                                    |
| 6          | Import Content Context Indices Input Pointer                                                           |
| 7          | ((Import Content Context Count \* 0x18) \<\< 4) \| 0xC                                                 |
| 8          | [Import Content Contexts](Application_Manager_Services#importcontentcontext "wikilink") Output Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wraps
[AMPXI:GetImportContentContexts](AMPXI:GetImportContentContexts "wikilink").
