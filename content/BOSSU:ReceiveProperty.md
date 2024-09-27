+++
title = 'BOSSU:ReceiveProperty'
+++

# Request

| Index Word | Description                                 |
|------------|---------------------------------------------|
| 0          | Header code \[0x00160082\]                  |
| 1          | [PropertyID](BOSSU:SendProperty "wikilink") |
| 2          | Size                                        |
| 3          | (Size \<\< 4) \| 0xC                        |
| 4          | Data Pointer                                |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Result code      |
| 2          | Actual read size |

# Description

Same as [BOSSU:SendProperty](BOSSU:SendProperty "wikilink") except for
reading.