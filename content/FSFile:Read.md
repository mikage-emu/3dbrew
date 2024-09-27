+++
title = 'FSFile:Read'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080200C2\] |
| 1-2        | u64, File Offset           |
| 3          | Size                       |
| 4          | (Size \<\< 4) \| 0xC       |
| 5          | Data Pointer               |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | Total read data |
