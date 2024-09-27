+++
title = 'AMPXI:GetCurrentImportContentContexts'
+++

# Request

| Index Word | Description                                                                                            |
|------------|--------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00270044\]                                                                             |
| 1          | Import Content Context Count                                                                           |
| 2          | ((Import Content Context Count \* 2) \<\< 8) \| 0x6                                                    |
| 3          | Import Content Context Indices Input Pointer                                                           |
| 4          | ((Import Content Context Count \* 0x18) \<\< 8) \| 0x14                                                |
| 5          | [Import Content Contexts](Application_Manager_Services#importcontentcontext "wikilink") Output Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
