+++
title = 'AM:GetProgramList'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00020082\]                             |
| 1          | Title Count                                            |
| 2          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 3          | ((Title Count \* 8) \<\< 4) \| 0xC                     |
| 4          | Title IDs Output Pointer                               |

# Response

| Index Word | Description              |
|------------|--------------------------|
| 0          | Header code              |
| 1          | Result code              |
| 2          | Number of Read Title IDs |
