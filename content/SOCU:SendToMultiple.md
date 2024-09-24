+++
title = 'SOCU:SendToMultiple'
+++

# Request

| Index Word | Description                                  |
|------------|----------------------------------------------|
| 0          | Header code \[0x00200146\]                   |
| 1          | Socket descriptor                            |
| 2          | size_t input buf len                         |
| 3          | int flags                                    |
| 4          | socklen_t addrlen                            |
| 5          | input sockaddr buffer size                   |
| 6          | Value 0x20 (processID header)                |
| 7          | ProcessID set by the ARM11 kernel.           |
| 8          | (input buf len\<\<14) \| 0x3002              |
| 9          | Pointer to input buf                         |
| 10         | (input sockaddr buffer size\<\<14) \| 0x3402 |
| 11         | Pointer to input dest_addr structures        |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |

# Description

This is the same as [SOCU:sendto](SOCU:sendto "wikilink"), but instead
of one sockaddr being passed in, multiple are allowed. As with
[SOCU:sendto](SOCU:sendto "wikilink"), the total input data size is
limited to 0x2000. In FRD module, the input data must not be greater
than 0x1E00 and the sockaddr buffer size must not exceed 0x200.