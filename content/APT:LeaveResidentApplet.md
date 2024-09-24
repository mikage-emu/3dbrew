+++
title = 'APT:LeaveResidentApplet'
+++

# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x00300044\]     |
| 1          | Parameters Size                |
| 2          | 0x0                            |
| 3          | Handle Parameter               |
| 4          | (Parameters Size \<\< 14) \| 2 |
| 5          | void\*, Parameters             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is stubbed: this just returns 0 after verifying the cmd/translate
headers.