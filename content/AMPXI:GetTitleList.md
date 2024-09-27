+++
title = 'AMPXI:GetTitleList'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x00020082\]                            |
| 1          | Title count                                           |
| 2          | [MediaType](Filesystem_services#MediaType "wikilink") |
| 3          | (TitleCount \* 8) \<\< 8 \| 4                         |
| 4          | Title IDs output pointer                              |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020080\] |
| 1          | Result code                |
| 2          | Number of entries returned |