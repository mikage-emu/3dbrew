# Request

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | Header code \[0x000600C2\]                    |
| 1          | u8 Account slot (0xFE to use current account) |
| 2          | Size                                          |
| 3          | [BlkID](ACT_Services#DataBlocks "wikilink")   |
| 4          | (Size\<\<4) \| 12                             |
| 5          | Output buffer ptr                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This returns NNID account info. This data usually comes from account.dat

Also known as GetAccountInfo.