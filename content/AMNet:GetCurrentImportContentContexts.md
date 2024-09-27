+++
title = 'AMNet:GetCurrentImportContentContexts'
+++

# Request

| Index Word | Description                                                                                            |
|------------|--------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x08150044\]                                                                             |
| 1          | Import Content Context Count                                                                           |
| 2          | ((Import Content Context Count \* 2) \<\< 4) \| 0xA                                                    |
| 3          | Import Content Context Indices Input Pointer                                                           |
| 4          | ((Import Content Context Count \* 0x18) \<\< 4) \| 0xC                                                 |
| 5          | [Import Content Contexts](Application_Manager_Services#ImportContentContext "wikilink") Output Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wraps
[AMPXI:GetCurrentImportContentContexts](AMPXI:GetCurrentImportContentContexts "wikilink").
