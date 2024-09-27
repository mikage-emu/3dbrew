+++
title = 'Y2R:GetTransferEndInterrupt'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E0000\] |

# Response

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code                   |
| 1          | Result code                   |
| 2          | u8, 0 = Disabled, 1 = Enabled |
