+++
title = 'APT:StartApplication'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x001B00C4\]              |
| 1          | Parameter Size (capped to 0x300)        |
| 2          | HMAC Size (capped to 0x20)              |
| 3          | u8, Paused (0 = not paused, 1 = paused) |
| 4          | (Parameter Size \<\< 14) \| 2           |
| 5          | void\*, Parameter                       |
| 6          | (HMAC Size \<\< 14) \| 0x802            |
| 7          | void\*, HMAC                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

The parameter buffer is copied to NS FIRMparams+0x0, then the HMAC
buffer is copied to NS FIRMparams+0x480. Then the application is
launched.
