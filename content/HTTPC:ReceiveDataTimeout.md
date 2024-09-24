+++
title = 'HTTPC:ReceiveDataTimeout'
+++

# Request

| Index Word | Description                                                                                                                                  |
|------------|----------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000C0102\]                                                                                                                   |
| 1          | HTTP context handle                                                                                                                          |
| 2          | Buffer size                                                                                                                                  |
| 3-4        | u64 nanoseconds delay, this specifies the maximum length of time to wait for the server to reply/send data before returning a time-out error |
| 5          | (OutSize\<\<4) \| 12                                                                                                                         |
| 6          | Output data pointer                                                                                                                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes the downloaded content(after the HTTP headers) to the output
buffer. Returns error code 0xd840a02b if the buffer is too small.
