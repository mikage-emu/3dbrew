+++
title = 'FSFile:Dummy1'
+++

# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x000100C6\]     |
| 1          | Buffer1 Size                   |
| 2          | Buffer2 Size                   |
| 3          | Buffer3 Size                   |
| 4          | (buffer1Size \<\< 14) \| 0x2   |
| 5          | void\* Buffer1                 |
| 6          | (buffer2Size \<\< 14) \| 0x402 |
| 7          | void\* Buffer2                 |
| 8          | (buffer3Size \<\< 14) \| 0x802 |
| 9          | void\* Buffer3                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This command does nothing. If all three buffers are of size 0, this will
return 0xE0C046F8, otherwise it will return 0xD9001830.
