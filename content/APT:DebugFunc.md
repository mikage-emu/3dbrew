+++
title = 'APT:DebugFunc'
+++

# Request

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code \[0x001000C2\]    |
| 1          | Function                      |
| 2          | Input Size                    |
| 3          | Output Size                   |
| 4          | (Input Size \<\< 14) \| 0x402 |
| 5          | void\*, Input                 |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                |
|------------|----------------------------|
| 0          | (Output Size \<\< 14) \| 2 |
| 1          | void\*, Output             |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | Debug Result |
