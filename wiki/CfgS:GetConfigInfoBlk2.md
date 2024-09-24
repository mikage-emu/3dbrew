# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010082\] |
| 1          | Size                       |
| 2          | BlkID                      |
| 3          | (Size\<\<4) \| 12          |
| 4          | Output data pointer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This loads data from the Cfg NAND
[savegame](Config_Savegame "wikilink"), with the ConfigInfoBlk flag 0x2
set. The above input size field must match the size field for the
corresponding block entry.