+++
title = 'CfgS:SecureInfoGetByte101'
+++

# Request

| Index Word | Description                                                           |
|------------|-----------------------------------------------------------------------|
| 0          | Header code \[0x04070000\] (Alternate header for "cfg:i": 0x08170000) |

# Response

| Index Word | Description                                                                                                                    |
|------------|--------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                                    |
| 1          | Result code                                                                                                                    |
| 2          | u8 value loaded from [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink") offset 0x101, from the already-loaded SecureInfo buffer. |