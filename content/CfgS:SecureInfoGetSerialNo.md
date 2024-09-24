+++
title = 'CfgS:SecureInfoGetSerialNo'
+++

# Request

| Index Word | Description                                                                                                                        |
|------------|------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x04080042\] (Alternate header for "cfg:i": 0x08180042)                                                              |
| 1          | Size, this is normally 0xF. Cfg module only uses this for the output buffer "12 \| (Size\<\<4)" field.                             |
| 2          | 12 \| (Size\<\<4)                                                                                                                  |
| 3          | Buffer for the 0xF-byte [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink") serial number, from the already-loaded SecureInfo buffer. |

# Response

| Index Word | Description       |
|------------|-------------------|
| 0          | Header code       |
| 1          | Result code       |
| 2          | 12 \| (Size\<\<4) |
| 3          | Buffer            |
