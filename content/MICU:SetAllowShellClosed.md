+++
title = 'MICU:SetAllowShellClosed'
+++

# Request

| Index Word | Description                                                              |
|------------|--------------------------------------------------------------------------|
| 0          | Header code \[0x000F0040\]                                               |
| 1          | u8, sampling allowed while shell closed (0 = disallow, non-zero = allow) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets whether sampling is allowed while the 3DS shell is closed. If
sampling is disallowed, calls to
[StartSampling](MICU:StartSampling "wikilink") while the shell is closed
will return result code 0xC9408C01.