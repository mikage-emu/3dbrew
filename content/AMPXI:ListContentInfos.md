+++
title = 'AMPXI:ListContentInfos'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x005A0142\]                            |
| 1          | Content count                                         |
| 2          | [MediaType](Filesystem_services#MediaType "wikilink") |
| 3-4        | u64, Title ID                                         |
| 5          | Start Index?                                          |
| 6          | (ContentCount \* 24) \<\< 8 \| 0x4                    |
| 7          | Content Infos pointer                                 |

# Response

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x005A0080\]       |
| 1          | Result code                      |
| 2          | Number of content infos returned |

# Content Info

Size: 0x18
