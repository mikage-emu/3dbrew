# Request

| Index Word | Description                                                                                                                                                 |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x08110084\]                                                                                                                                  |
| 1          | SecureInfo data buffer size                                                                                                                                 |
| 2          | Signature buffer size                                                                                                                                       |
| 3          | 10 \| (SecureInfo_databufsize\<\<4)                                                                                                                         |
| 4          | Buffer for the 0x11-byte [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink") data following the signature, this is written to the SecureInfo buffer in memory. |
| 5          | 10 \| (Signature_bufsize\<\<4)                                                                                                                              |
| 6          | Buffer for the 0x100-byte RSA-2048 [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink") signature, this is written to the SecureInfo buffer in memory.          |

# Response

| Index Word | Description                                                                                             |
|------------|---------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                             |
| 1          | Result code                                                                                             |
| 2          | 10 \| (SecureInfo_databufsize\<\<4)                                                                     |
| 3          | Buffer for the 0x11-byte [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink") data following the signature. |
| 4          | 10 \| (Signature_bufsize\<\<4)                                                                          |
| 5          | Buffer for the 0x100-byte RSA-2048 [SecureInfo](Nandrw/sys/SecureInfo_A "wikilink") signature.          |

# Description

This overwrites the SecureInfo data stored in memory with the input
data. The signature-set code has the same result as
[CfgI:SetLocalFriendCodeSeedSignature](CfgI:SetLocalFriendCodeSeedSignature "wikilink"),
except for SecureInfo.