+++
title = 'CDCCHK:WriteSPI'
+++

# Request

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[SPI1=0x000300C2 SPI2=0x000400C2\] |
| 1          | u8 page                                         |
| 2          | u8 offset                                       |
| 3          | u8 size                                         |
| 4          | (size \<\< 14) \| 2                             |
| 5          | Buffer pointer                                  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |