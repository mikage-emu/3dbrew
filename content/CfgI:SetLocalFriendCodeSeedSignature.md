+++
title = 'CfgI:SetLocalFriendCodeSeedSignature'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080C0042\] |
| 1          | Buffer size                |
| 2          | 10 \| (Size\<\<4)          |
| 3          | Signature buffer           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

When u8 LocalFriendCodeSeed_state+0x21 == 0, this returns error
0xD8A103F8. This overwrites the LocalFriendCodeSeed RSA-signature data
stored in memory(not the one stored in NAND) with the input data. This
then writes u8 value zero to LocalFriendCodeSeed_state+0x20.

Setting +0x20 to zero results in most SecureInfo commands being
unusable. For those to be usable again,
[CfgI:VerifySigSecureInfo](CfgI:VerifySigSecureInfo "wikilink") must be
used. The +0x20 u8 will only be restored to value 1 if
[CfgI:VerifySigSecureInfo](CfgI:VerifySigSecureInfo "wikilink") is
successful.
