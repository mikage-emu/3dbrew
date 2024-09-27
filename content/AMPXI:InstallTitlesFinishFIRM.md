+++
title = 'AMPXI:InstallTitlesFinishFIRM'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x00420142\]                            |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink") |
| 2          | Title count                                           |
| 3-4        | FIRM Title ID                                         |
| 5          | u8, Database (0 = title.db, 1 = tmp\*.db)             |
| 6          | (TitleCount \* 8) \<\< 8 \| 0x6                       |
| 7          | Title IDs pointer                                     |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00420040\] |
| 1          | Result code                |
