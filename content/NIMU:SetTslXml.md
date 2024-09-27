+++
title = 'NIMU:SetTslXml'
+++

# Request

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x001E0042\]                      |
| 1          | Buffer Size                                     |
| 2          | Mapped Input Buffer Header (Size \<\< 4 \| 0xA) |
| 3          | XML Input Pointer                               |

# Response

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x001E0042\]                      |
| 1          | Result code                                     |
| 2          | Mapped Input Buffer Header (Size \<\< 4 \| 0xA) |
| 3          | XML Input Pointer                               |

# Description

Saves the provided auto title delivery XML data to tsl.xml in the NIM
system save data. If the provided XML is invalid, tsl.xml will
subsequently be deleted.