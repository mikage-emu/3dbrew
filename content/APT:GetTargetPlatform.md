+++
title = 'APT:GetTargetPlatform'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x01010000\] |

# Response

| Index Word | Description                                    |
|------------|------------------------------------------------|
| 0          | Header code                                    |
| 1          | Result code                                    |
| 2          | u8, Target Platform (0 = Old 3DS, 1 = New 3DS) |

# Description

This writes an output u8 to cmdreply indexword\[2\]. This uses
[PTMSYSM:CheckNew3DS](PTMSYSM:CheckNew3DS "wikilink"). When a certain NS
state field is non-zero, the output value is zero, otherwise the output
is from [PTMSYSM:CheckNew3DS](PTMSYSM:CheckNew3DS "wikilink"). Normally
this NS state field is zero, however this state field is set to 1 when
[<APT:PrepareToStartApplication>](APT:PrepareToStartApplication "wikilink")
is used with flags bit8 is set.