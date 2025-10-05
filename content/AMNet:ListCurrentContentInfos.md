+++
title = 'AMNet:ListCurrentContentInfos'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x08240082\] |
| 1 | Content Info Count |
| 2 | Offset |
| 3 | ((Content Info Count \* 0x18) \<\< 4) \| 0xC |
| 4 | [Content Infos](Application_Manager_Services#contentinfo "wikilink") Output Pointer |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2          | Number of Read Content Infos |

# Description

Wraps [AMPXI:ListCurrentContentInfos](AMPXI:ListCurrentContentInfos "wikilink").
