+++
title = 'CDCCHK:ReadSPI'
+++

# Request

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[SPI1=0x000100C0 SPI2=0x000200C0\] |
| 1          | u8 page                                         |
| 2          | u8 offset                                       |
| 3          | u8 size                                         |

0x100 bytes after the IPC buffer

| Index Word | Description         |
|------------|---------------------|
| 0          | (size \<\< 14) \| 2 |
| 1          | Buffer pointer      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# SPI Data list

| Page:Offset(Size) | Name              |
|-------------------|-------------------|
| 00:02(01)         | SPIDeviceVendor   |
| 00:03(01)         | SPIDeviceRevision |