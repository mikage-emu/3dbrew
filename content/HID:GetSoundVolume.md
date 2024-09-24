+++
title = 'HID:GetSoundVolume'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00170000\] |

# Response

| Index Word | Description                                                    |
|------------|----------------------------------------------------------------|
| 0          | Header code                                                    |
| 1          | Result code                                                    |
| 2          | u8 output value, see [here](MCUHID:GetSoundVolume "wikilink"). |

# Description

This is an interface for
[MCUHID:GetSoundVolume](MCUHID:GetSoundVolume "wikilink").