+++
title = 'FS:ReadNandReport'
+++

# Request

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code \[0x086A0082\]   |
| 1          | Buffer Length                |
| 2          | Unknown                      |
| 2          | (bufferLength \<\< 4) \| 0xC |
| 3          | Buffer Pointer               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |