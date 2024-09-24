# Request

| Index Word | Description                                                                                                  |
|------------|--------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00630042\]                                                                                   |
| 1          | Import Content Context Count                                                                                 |
| 2          | ((Import Content Context Count \* 2) \<\< 8) \| 0x6                                                          |
| 3          | [Import Content Context](Application_Manager_Services#ImportContentContext "wikilink") Indices Input Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |