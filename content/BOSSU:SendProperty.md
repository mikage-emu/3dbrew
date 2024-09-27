+++
title = 'BOSSU:SendProperty'
+++

# Request

| Index Word | Description                                |
|------------|--------------------------------------------|
| 0          | Header code \[0x00140082\]                 |
| 1          | u16 [PropertyID](BOSS_Services "wikilink") |
| 2          | Size                                       |
| 3          | (Size \<\< 4) \| 0xA                       |
| 4          | Data Pointer                               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the data for the specified property with the currently
selected BOSS task. This data will be written into FS later(normally
with [BOSSU:RegisterTask](BOSSU:RegisterTask "wikilink")).