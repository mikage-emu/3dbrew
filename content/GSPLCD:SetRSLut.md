+++
title = 'GSPLCD:SetRSLut'
+++

# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x00030080\]             |
| 1          | Screen (1 = top, 2 = bottom, 3 = both) |
| 2          | Level (0-5)                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
