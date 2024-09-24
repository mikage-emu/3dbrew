# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090000\] |

# Response

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code                                    |
| 1          | Result code                                    |
| 2          | 1 if the auto startup bit is set, 0 otherwise. |

# Description

This is a wrapper for
[PSPXI:GetCTRCardAutoStartupBit](PSPXI:GetCTRCardAutoStartupBit "wikilink").