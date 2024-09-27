+++
title = 'AMPXI:DeleteContents'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x005E0102\]                            |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                         |
| 4          | Content count                                         |
| 5          | (ContentCount \* 2) \<\< 8 \| 0x6                     |
| 6          | Content indices pointer                               |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x005E0040\] |
| 1          | Result code                |
