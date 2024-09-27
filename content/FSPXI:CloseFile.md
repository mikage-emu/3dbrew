+++
title = 'FSPXI:CloseFile'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000F0080\] |
| 1          | File handle lower word     |
| 2          | File handle upper word     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
