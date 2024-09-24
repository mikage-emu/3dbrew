+++
title = 'FSPXI:WriteFile'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0182\] |
| 1          | File handle lower word     |
| 2          | File handle upper word     |
| 3          | Offset lower word          |
| 4          | Offset upper word          |
| 5          | Size                       |
| 6          | Flush flags                |
| 7          | (Size \<\< 8) \| 6         |
| 8          | Input buffer               |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | Size written |
| 3          | 4            |
