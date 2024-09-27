+++
title = 'DSP:GetIsDspOccupied'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00210000\] |

# Response

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code                               |
| 1          | Result code                               |
| 2          | u8, 0 = not occupied, non-zero = occupied |
