+++
title = 'AMNet:Verify'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08170146\] |
| 1-2        | u64, ?                     |
| 3          | ? Size 1                   |
| 4          | ? Size 2                   |
| 5          | ? Size 3                   |
| 6          | (? Size 1 \<\< 4) \| 0xA   |
| 7          | ? Input Pointer 1          |
| 8          | (? Size 2 \<\< 4) \| 0xA   |
| 9          | ? Input Pointer 2          |
| 10         | (? Size 3 \<\< 4) \| 0xA   |
| 11         | ? Input Pointer 3          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | ?           |

# Description

Stubbed, returns 0xF8C083F4.