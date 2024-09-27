+++
title = 'DLPSRVR:GetDupNoticeNeed'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100000\] |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | bool Unknown |

# Description

This returns a bool whose value depends on internal state and [config
block](Config_Savegame "wikilink") 0x00130000
