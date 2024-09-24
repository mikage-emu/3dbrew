+++
title = 'CfgI:SecureInfoGetSignature'
+++

# Request

| Index Word | Description                                                                                                                               |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x08150042\]                                                                                                                |
| 1          | Size, normally 0x100. This is unused by Cfg module.                                                                                       |
| 2          | 12 \| (Size\<\<4)                                                                                                                         |
| 3          | Buffer for the 0x100-byte RSA-2048 [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink") signature, from the already-loaded SecureInfo buffer. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |