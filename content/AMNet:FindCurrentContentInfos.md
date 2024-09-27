# Request

| Index Word | Description                                                                         |
|------------|-------------------------------------------------------------------------------------|
| 0          | Header code \[0x08230044\]                                                          |
| 1          | Content Info Count                                                                  |
| 2          | ((Content Info Count \* 2) \<\< 4) \| 0xA                                           |
| 3          | Content Info Indices Input Pointer                                                  |
| 4          | ((Content Info Count \* 0x18) \<\< 4) \| 0xC                                        |
| 5          | [Content Infos](Application_Manager_Services#ContentInfo "wikilink") Output Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |