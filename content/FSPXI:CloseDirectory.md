+++
title = 'FSPXI:CloseDirectory'
+++

# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x00110080\]  |
| 1          | Directory handle lower word |
| 2          | Directory handle upper word |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |