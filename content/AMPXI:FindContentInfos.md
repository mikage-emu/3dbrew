+++
title = 'AMPXI:FindContentInfos'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x00590104\]                            |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                         |
| 4          | Content count                                         |
| 5          | (ContentCount \* 2) \<\< 8 \| 0x6                     |
| 6          | Content indices pointer                               |
| 7          | (ContentCount \* 24) \<\< 8 \| 0x14                   |
| 8          | Content Infos pointer                                 |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00590040\] |
| 1          | Result code                |

# Content Info

Size: 0x18