+++
title = 'FSPXI:GetFileSize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0080\] |
| 1          | File handle lower word     |
| 2          | File handle upper word     |

# Response

| Index Word | Description          |
|------------|----------------------|
| 0          | Header code          |
| 1          | Result code          |
| 2          | File size lower word |
| 3          | File size upper word |
