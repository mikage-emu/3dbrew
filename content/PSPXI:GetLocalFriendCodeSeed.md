+++
title = 'PSPXI:GetLocalFriendCodeSeed'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0000\] |

# Response

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x000A0000\]     |
| 1          | Result code                    |
| 2          | LocalFriendCodeSeed lower word |
| 3          | LocalFriendCodeSeed upper word |

# Description

This retrieves the LocalFriendCodeSeed/64-bit consoleID from an u64
already in memory(that memory is initialized by bootrom), which is not
loaded from NAND. The source data this retrieves, is also used to
generate the console-unique part of the TWL [keyslots](AES "wikilink"),
and can be used as part of the keyY when
[movable.sed](Nand/private/movable.sed "wikilink") doesn't exist.
