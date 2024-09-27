+++
title = 'AMPXI:ListCurrentContentInfos'
+++

# Request

| Index Word | Description                                                                         |
|------------|-------------------------------------------------------------------------------------|
| 0          | Header code \[0x005D0082\]                                                          |
| 1          | Content Info Count                                                                  |
| 2          | Offset                                                                              |
| 4          | ((Content Info Count \* 0x18) \<\< 8) \| 0x4                                        |
| 5          | [Content Infos](Application_Manager_Services#ContentInfo "wikilink") Output Pointer |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | Number of Read Content Infos |