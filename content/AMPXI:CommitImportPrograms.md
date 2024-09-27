+++
title = 'AMPXI:CommitImportPrograms'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x002A00C2\]                            |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink") |
| 2          | Title count                                           |
| 3          | u8, Database (0 = title.db, 1 = tmp\*.db)             |
| 4          | (TitleCount \* 8) \<\< 8 \| 0x6                       |
| 5          | Title IDs pointer                                     |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002A0040\] |
| 1          | Result code                |
