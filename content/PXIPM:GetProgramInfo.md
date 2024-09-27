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
Info](Exheader#system_control_info "wikilink") and [Access Control
Info](Exheader#access_control_info "wikilink") of a program, writing
them to the output buffer.
