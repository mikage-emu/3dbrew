+++
title = 'Y2R:SetTransferEndInterrupt'
+++

# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x000D0040\]  |
| 1          | u8, 0 = Disable, 1 = Enable |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |