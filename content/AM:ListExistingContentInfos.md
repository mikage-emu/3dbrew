+++
title = 'AM:ListExistingContentInfos'
+++

# Request

| Index Word | Description                                                                         |
|------------|-------------------------------------------------------------------------------------|
| 0          | Header code \[0x002B0142\]                                                          |
| 1          | Content Count                                                                       |
| 2          | [Media Type](Filesystem_services#mediatype "wikilink")                              |
| 3-4        | u64, Title ID                                                                       |
| 5          | Offset                                                                              |
| 6          | ((Content Count \* 0x18) \<\< 4) \| 0xC                                             |
| 7          | [Content Infos](Application_Manager_Services#contentinfo "wikilink") Output Pointer |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | Number of Read Content Infos |
