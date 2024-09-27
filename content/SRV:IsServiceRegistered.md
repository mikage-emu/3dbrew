+++
title = 'SRV:IsServiceRegistered'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E00C0\] |
| 1-2        | 8-byte UTF-8 service name  |
| 3          | Name length                |

# Response

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code                            |
| 1          | Result code                            |
| 2          | u8, 0 = not registered, 1 = registered |
