+++
title = 'LOADER:GetProgramInfo'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040080\] |
| 1-2        | u64, Program Handle        |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | (0x400 \<\< 14) \| 2          |
| 1          | u8\* outBuffer (size = 0x400) |

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
