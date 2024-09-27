+++
title = 'IRU:GetIRLEDRecvState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000C0000\] |

# Response

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code                               |
| 1          | Result code                               |
| 2          | u32 [value](IRU:SetIRLEDState "wikilink") |

# Description

This gets the current bit value received from IR, via GPIO (bitmask 0x20
from register 0x10147020). The GPIO value seems to be reset to zero when
value 1 is returned, the GPIO value is updated the next time the IR hw
checks for an IR signal.