+++
title = 'NIMU:GetAutoDbgDat'
+++

# Request

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x001A0002\]                       |
| 1          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC) |
| 2          | AutoDbgDat Output Pointer                        |

# Response

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x001A0042\]                       |
| 1          | Result code                                      |
| 1          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC) |
| 2          | AutoDbgDat Output Pointer                        |

# Description

Retrieves the contents of autodbg.dat from the NIM save data. Rather
than reading the file at call time, NIM will simply copy its in-memory
copy of the data to the output. The provided buffer should be of size
0x108.