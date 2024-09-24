# Request

| Index Word | Description                                 |
|------------|---------------------------------------------|
| 0          | Header code \[0x00050082\]                  |
| 2          | Size                                        |
| 3          | [BlkID](ACT_Services#DataBlocks "wikilink") |
| 4          | (Size\<\<4) \| 12                           |
| 5          | Output buffer ptr                           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This returns common account info. This data usually comes from
common.dat