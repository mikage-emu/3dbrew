+++
title = 'HTTPC:GetResponseHeader'
+++

# Request

| Index Word | Description                                              |
|------------|----------------------------------------------------------|
| 0          | Header code \[0x001E00C4\]                               |
| 1          | HTTP context handle                                      |
| 2          | Header name buffer size, including null-terminator.      |
| 3          | Header value buffer max size, including null-terminator. |
| 4          | (HeaderNameSize\<\<14) \| 0xC02                          |
| 5          | Header name input data pointer                           |
| 6          | (HeaderValueSize\<\<4) \| 12                             |
| 7          | Header value output data pointer                         |

# Response

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code                    |
| 1          | Result code                    |
| 2          | Total header value buffer size |

# Description

This is the same as
[HTTPC:GetResponseHeaderDelay](HTTPC:GetResponseHeaderDelay "wikilink"),
without the delay.
