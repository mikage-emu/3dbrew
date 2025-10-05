+++
title = 'AMPXI:GetCTCert'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x003B0042\] |
| 1          | Output size                |
| 2          | (Size \<\< 8) \| 0x4       |
| 3          | Output pointer             |

# Response

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code \[0x003B0080\]                |
| 1          | Result code                               |
| 2          | Output s32. Internal pxi:am9 result code. |

# Description

This returns the [CTCert](CTCert "wikilink") 0x180-byte certificate for the current system. The size must match 0x180, otherwise Process9 executes [svcBreak](SVC "wikilink").
