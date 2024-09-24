# Request

| Index Word | Description                                                                         |
|------------|-------------------------------------------------------------------------------------|
| 0          | Header code \[0x005C0044\]                                                          |
| 1          | Content Info Count                                                                  |
| 2          | ((Content Info Count \* 2) \<\< 8) \| 0x6                                           |
| 3          | Content Info Indices Input Pointer                                                  |
| 4          | ((Content Info Count \* 0x18) \<\< 8) \| 0x14                                       |
| 5          | [Content Infos](Application_Manager_Services#ContentInfo "wikilink") Output Pointer |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x005C0041\] |
| 1          | Result code                |