+++
title = 'HTTPC:GetResponseData'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00200082\] |
| 1          | HTTP context handle        |
| 2          | Max buffer size            |
| 3          | (OutSize\<\<4) \| 12       |
| 4          | Output data pointer        |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code                |
| 1          | Result code                |
| 2          | Output total response size |

# Description

This obtains the raw HTTP response data, prior to the received content.

NOTE: Named GetHeaderAll by Nintendo
