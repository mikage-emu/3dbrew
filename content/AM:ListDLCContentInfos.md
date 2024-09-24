+++
title = 'AM:ListDLCContentInfos'
+++

TID high value must be 0x0004008C, otherwise 0xE0E0803C is returned.

# Request

| Index Word | Description                                                                         |
|------------|-------------------------------------------------------------------------------------|
| 0          | Header code \[0x10030142\]                                                          |
| 1          | Content Count                                                                       |
| 2          | [Media Type](Filesystem_services#MediaType "wikilink")                              |
| 3-4        | u64, Title ID                                                                       |
| 5          | Offset                                                                              |
| 6          | ((Content Count \* 0x18) \<\< 4) \| 0xC                                             |
| 7          | [Content Infos](Application_Manager_Services#ContentInfo "wikilink") Output Pointer |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | Number of Content Infos Read |
