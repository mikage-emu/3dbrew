+++
title = 'HTTPC:GetResponseStatusCodeTimeout'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002300C0\] |
| 1          | HTTP context handle        |
| 2-3        | u64 nanoseconds timeout    |

# Response

| Index Word | Description               |
|------------|---------------------------|
| 0          | Header code               |
| 1          | Result code               |
| 2          | HTTP response status code |