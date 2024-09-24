+++
title = 'PTM:GetAdapterState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00050000\] |

# Response

| Index Word | Description                                  |
|------------|----------------------------------------------|
| 0          | Header code                                  |
| 1          | Result code                                  |
| 2          | u8 output: 0 = not connected, 1 = connected. |

# Description

Similar to
[PTM:GetBatteryChargeState](PTM:GetBatteryChargeState "wikilink"), but
when the battery is already fully charged with the adapter still
connected, this function returns 1, while PTM:GetBatteryChargeState
returns 0.
