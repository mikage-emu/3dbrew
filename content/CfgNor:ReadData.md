+++
title = 'CfgNor:ReadData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00050082\] |
| 1          | Offset                     |
| 2          | Size                       |
| 3          | (Size\<\<4) \| 12          |
| 4          | Output buffer ptr          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
