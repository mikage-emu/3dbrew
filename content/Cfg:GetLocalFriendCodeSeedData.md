+++
title = 'Cfg:GetLocalFriendCodeSeedData'
+++

# Request

| Index Word | Description                                                   |
|------------|---------------------------------------------------------------|
| 0          | Header code \[0x04040042\] ("cfg:i": 0x04040042 / 0x080F0042) |
| 1          | Size (Unused by Cfg module)                                   |
| 2          | (Size\<\<4) \| 12                                             |
| 3          | Output data pointer                                           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This copies the entire 0x110-byte buffer containing the data for the
[LocalFriendCodeSeed](Nandrw/sys/LocalFriendCodeSeed_B "wikilink"), to
the output buffer. The output buffer size is not checked, therefore the
size must be at least 0x110-bytes.