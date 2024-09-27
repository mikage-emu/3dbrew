# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080400C2\] |
| 1          | BlkID                      |
| 2          | Size                       |
| 3          | u16 block flags            |
| 4          | (Size\<\<4) \| 10          |
| 5          | Input data pointer         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This creates a new info-blk in the Cfg
[savegame](Config_Savegame "wikilink") buffer in memory. The new block
is added to the end of the list of entries. This only writes to the
buffer in memory, the NAND savegame is not updated. The value for the
flags field must be one of the following, otherwise an error is
returned: 8, 12, 10, or 14.