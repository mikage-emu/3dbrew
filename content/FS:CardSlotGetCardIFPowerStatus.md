+++
title = 'FS:CardSlotGetCardIFPowerStatus'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08240000\] |

# Response

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code                 |
| 1          | Result code                 |
| 2          | u8 Status (0 = off, 1 = on) |