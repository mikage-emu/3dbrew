# Request

| Index Word | Description                                                                     |
|------------|---------------------------------------------------------------------------------|
| 0          | Header code \[0x002C0084\]                                                      |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink")                          |
| 2          | Title Count                                                                     |
| 3          | ((Title Count \* 8) \<\< 4) \| 0xA                                              |
| 4          | Title IDs Input Pointer                                                         |
| 5          | ((Title Count \* 0x18) \<\< 4) \| 0xC                                           |
| 6          | [Title Infos](Application_Manager_Services#TitleInfo "wikilink") Output Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |