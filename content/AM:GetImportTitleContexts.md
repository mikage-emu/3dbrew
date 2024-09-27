+++
title = 'AM:GetImportTitleContexts'
+++

# Request

| Index Word | Description                                                                                        |
|------------|----------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000D0084\]                                                                         |
| 1          | Import Title Context Count                                                                         |
| 2          | [Media Type](Filesystem_services#MediaType "wikilink")                                             |
| 3          | ((Import Title Context Count \* 8) \<\< 4) \| 0xA                                                  |
| 4          | Import Title Context Title IDs Input Pointer                                                       |
| 5          | ((Import Title Context Count \* 0x18) \<\< 4) \| 0xC                                               |
| 6          | [Import Title Contexts](Application_Manager_Services#ImportTitleContext "wikilink") Output Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
