+++
title = 'PXIPM:GetProgramInfo'
+++

# Request

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code \[0x00010082\]    |
| 1-2        | u64, Program Handle           |
| 3          | (0x400 \<\< 8) \| 0x4         |
| 4          | u8\* outBuffer (size = 0x400) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This retrieves the [System Control
Info](Exheader#System_Control_Info "wikilink") and [Access Control
Info](Exheader#Access_Control_Info "wikilink") of a program, writing
them to the output buffer.