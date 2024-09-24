+++
title = 'CfgS:SetConfigInfoBlk4'
+++

# Request

| Index Word | Description                                                   |
|------------|---------------------------------------------------------------|
| 0          | Header code \[0x04020082\] ("cfg:i": 0x04020082 / 0x08020082) |
| 1          | BlkID                                                         |
| 2          | Size                                                          |
| 3          | (Size\<\<4) \| 10                                             |
| 4          | Input data pointer                                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes data to the Cfg [savegame](Config_Savegame "wikilink")
buffer in memory, the specified block must have flags bitmask 0x4 set.
The above input size field must match the size field for the
corresponding block entry. This only writes to the buffer in memory, the
NAND savegame is not updated.