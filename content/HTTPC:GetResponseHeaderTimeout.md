+++
title = 'HTTPC:GetResponseHeaderTimeout'
+++

# Request

| Index Word | Description                                              |
|------------|----------------------------------------------------------|
| 0          | Header code \[0x001F0144\]                               |
| 1          | HTTP context handle                                      |
| 2          | Header name buffer size, including null-terminator.      |
| 3          | Header value buffer max size, including null-terminator. |
| 4-5        | u64 nanoseconds timeout                                  |
| 6          | (HeaderNameSize\<\<14) \| 0xC02                          |
| 7          | Header name input data pointer                           |
| 8          | (HeaderValueSize\<\<4) \| 12                             |
| 9          | Header value output data pointer                         |

# Response

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code                    |
| 1          | Result code                    |
| 2          | Total header value buffer size |

# Description

This obtains the string value for the specified HTTP response header.
This returns error-code 0xD8A0A028 when the specified header doesn't
exist in the received response.
