+++
title = 'AM:FindDLCContentInfos'
+++

TID high value must be 0x0004008C, otherwise 0xE0E0803C is returned.

# Request

| Index Word | Description                                                                         |
|------------|-------------------------------------------------------------------------------------|
| 0          | Header code \[0x10020104\]                                                          |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink")                              |
| 2-3        | u64, Title ID                                                                       |
| 4          | Content Count                                                                       |
| 5          | ((Content Count \* 2) \<\< 4) \| 0xA                                                |
| 6          | Content Indices Input Pointer                                                       |
| 7          | ((Content Count \* 0x18) \<\< 4) \| 0xC                                             |
| 8          | [Content Infos](Application_Manager_Services#ContentInfo "wikilink") Output Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |