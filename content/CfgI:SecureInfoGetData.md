+++
title = 'CfgI:SecureInfoGetData'
+++

# Request

| Index Word | Description                                                                                                                                        |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x08140042\]                                                                                                                         |
| 1          | Size, normally 0x11.                                                                                                                               |
| 2          | 12 \| (Size\<\<4)                                                                                                                                  |
| 3          | Buffer for the 0x11-byte data following the [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink") signature, from the already-loaded SecureInfo buffer. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |