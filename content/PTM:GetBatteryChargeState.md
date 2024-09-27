+++
title = 'PTM:GetBatteryChargeState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080000\] |

# Response

| Index Word | Description                                |
|------------|--------------------------------------------|
| 0          | Header code                                |
| 1          | Result code                                |
| 2          | u8 output: 0 = not charging, 1 = charging. |