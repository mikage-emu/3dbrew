+++
title = 'SOCU:socket'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x000200C2\]         |
| 1          | int domain                         |
| 2          | int type                           |
| 3          | int protocol                       |
| 4          | Value 0x20 (processID header)      |
| 5          | ProcessID set by the ARM11 kernel. |

# Response

| Index Word | Description              |
|------------|--------------------------|
| 0          | Header code              |
| 1          | Result code              |
| 2          | Output socket descriptor |

# Description

The input domain must be value 2(AF_INET), otherwise an error is
returned. The input protocol must be value 0, otherwise an error is
returned. The input type must be either value 1(SOCK_STREAM) or value
2(SOCK_DGRAM), otherwise an error is returned. Due to this, bitmask
flags(such as SOCK_NONBLOCK) for the type field are not supported,
therefore the user process when using socket() must use
[SOCU:fcntl](SOCU:fcntl "wikilink") to support those flag(s).