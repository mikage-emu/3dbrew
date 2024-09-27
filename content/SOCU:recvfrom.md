+++
title = 'SOCU:recvfrom'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00080102\]         |
| 1          | Socket descriptor                  |
| 2          | size_t len                         |
| 3          | int flags                          |
| 4          | socklen_t addrlen                  |
| 5          | Value 0x20 (processID header)      |
| 6          | ProcessID set by the ARM11 kernel. |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                                                                          |
|------------|--------------------------------------------------------------------------------------|
| 0          | (len\<\<14) \| 2                                                                     |
| 1          | Pointer to output buf                                                                |
| 2          | (addrlen\<\<14) \| 2                                                                 |
| 3          | Pointer to the output src_addr structure (must be a valid address, even when unused) |

# Response

| Index Word | Description                                                                  |
|------------|------------------------------------------------------------------------------|
| 0          | Header code                                                                  |
| 1          | Result code                                                                  |
| 2          | POSIX return value                                                           |
| 3          | Total received data, from the above return-value when no error was returned. |

# Description

This receives data from the socket. The max length for the len field is
0x2000, the socket module will use length 0x2000 when this field is
\>0x2000.