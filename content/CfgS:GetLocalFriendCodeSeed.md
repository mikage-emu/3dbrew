+++
title = 'CfgS:GetLocalFriendCodeSeed'
+++

# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x04050000\] (Alternate header-code for CfgI: 0x08100000) |

# Response

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code                    |
| 1          | Result code                    |
| 2          | LocalFriendCodeSeed lower word |
| 3          | LocalFriendCodeSeed upper word |

# Description

This returns the u64 stored in
[LocalFriendCodeSeed](Nandrw/sys/LocalFriendCodeSeed_B "wikilink") from
the already-loaded buffer, at offset 0x108.