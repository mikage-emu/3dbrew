+++
title = 'AM:GetPatchTitleInfos'
+++

Iterates through a list of TIDs to return [Title
Infos](Application_Manager_Services#TitleInfo "wikilink"). One pass over
the TID list is done initially to validate that all TID high values are
0x0004000E, otherwise 0xE0E0803C is returned. [Title
Info](Application_Manager_Services#TitleInfo "wikilink") is only written
once all titles are validated as patch titles.

# Request

| Index Word | Description                                                                     |
|------------|---------------------------------------------------------------------------------|
| 0          | Header code \[0x100D0084\]                                                      |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink")                          |
| 2          | Title Count                                                                     |
| 3          | ((Title Count \* 8) \<\< 4) \| 0xA                                              |
| 4          | Title IDs Input Pointer                                                         |
| 5          | ((Title Count \* 0x18) \<\< 4) \| 0xC                                           |
| 6          | [Title Infos](Application_Manager_Services#TitleInfo "wikilink") Output Pointer |

# Response

| Index Word | Description                                                              |
|------------|--------------------------------------------------------------------------|
| 0          | Header code                                                              |
| 1          | Result code                                                              |
| 2          | ((Title Count \* 8) \<\< 4) \| 0xA                                       |
| 3          | Title IDs Pointer                                                        |
| 4          | ((Title Count \* 0x18) \<\< 4) \| 0xC                                    |
| 5          | [Title Infos](Application_Manager_Services#TitleInfo "wikilink") Pointer |