+++
title = 'AMNet:GetDeviceCert'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08180042\] |
| 1          | Size                       |
| 2          | (Size \<\< 4) \| 0xC       |
| 3          | Device Cert Output Pointer |

# Response

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code                        |
| 1          | Result code                        |
| 2          | s32, internal pxi:am9 result code. |

# Description

This is a wrapper for [AMPXI:GetCTCert](AMPXI:GetCTCert "wikilink").
