+++
title = 'NIMU:SetAutoDbgDat'
+++

# Request

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x00190002\]                      |
| 1          | Mapped Input Buffer Header (Size \<\< 4 \| 0xA) |
| 2          | AutoDbgDat Input Pointer                        |

# Response

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x00190042\]                      |
| 1          | Result code                                     |
| 1          | Mapped Input Buffer Header (Size \<\< 4 \| 0xA) |
| 2          | AutoDbgDat Input Pointer                        |

# Description

Sets the contents of autodbg.dat in the NIM save data. The provided
buffer should be of size 0x108.