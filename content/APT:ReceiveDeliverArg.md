+++
title = 'APT:ReceiveDeliverArg'
+++

# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x00350080\]       |
| 1          | Parameter Size (capped to 0x300) |
| 2          | HMAC Size (capped to 0x20)       |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | (Parameter Size \<\< 14) \| 2 |
| 1          | void\*, Parameter             |
| 2          | (HMAC Size \<\< 14) \| 0x802  |
| 3          | void\*, HMAC                  |

# Response

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | Header code                                   |
| 1          | Result code                                   |
| 2-3        | u64, Source Program ID                        |
| 4          | u8, Received (0 = not received, 1 = received) |
