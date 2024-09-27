+++
title = 'HTTPC:SendPOSTDataTimeout'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001B0102\] |
| 1          | HTTP context handle        |
| 2          | Buffer size                |
| 3-4        | u64 nanoseconds timeout    |
| 5          | (Size\<\<4) \| 10          |
| 6          | Input data pointer         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This uploads the specified raw POST data content.