+++
title = 'ERR:SetUserString'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020042\] |
| 1          | Size                       |
| 2          | (Size \<\< 14) \| 2        |
| 3          | char\*, String             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
