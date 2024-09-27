+++
title = 'NIMU:GetDtlXml'
+++

# Request

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x00240042\]                       |
| 1          | Buffer Capacity                                  |
| 2          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC) |
| 3          | XML Output Pointer                               |

# Response

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x00240042\]                       |
| 1          | Result code                                      |
| 2          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC) |
| 3          | XML Output Pointer                               |

# Description

Reads the auto title delivery XML from dtl.xml into the provided output
buffer.
