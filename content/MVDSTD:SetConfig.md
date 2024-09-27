+++
title = 'MVDSTD:SetConfig'
+++

# Request

| Index Word | Description                                              |
|------------|----------------------------------------------------------|
| 0          | Header code \[0x001E0044\]                               |
| 1          | Size, normally 0x11C.                                    |
| 2          | Value 0x0                                                |
| 3          | KProcess handle                                          |
| 4          | (Size\<\<4) \| 10                                        |
| 5          | Input data ptr (see [here](MVDSTD:GetConfig "wikilink")) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |
