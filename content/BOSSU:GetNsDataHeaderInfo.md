+++
title = 'BOSSU:GetNsDataHeaderInfo'
+++

# Request

| Index Word | Description                                                           |
|------------|-----------------------------------------------------------------------|
| 0          | Header code \[0x002700C2\]                                            |
| 1          | NsDataId                                                              |
| 2          | u8 type                                                               |
| 3          | Size                                                                  |
| 4          | (Size \<\< 4) \| 0xC                                                  |
| 5          | Output Data Pointer for [NsDataHeaderInfo](BOSS_Services "wikilink"). |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |