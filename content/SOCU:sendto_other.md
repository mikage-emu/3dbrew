# Request

| Index Word | Description                                                                      |
|------------|----------------------------------------------------------------------------------|
| 0          | Header code \[0x00090106\]                                                       |
| 1          | Socket descriptor                                                                |
| 2          | size_t len                                                                       |
| 3          | int flags                                                                        |
| 4          | socklen_t addrlen                                                                |
| 5          | Value 0x20 (processID header)                                                    |
| 6          | ProcessID set by the ARM11 kernel.                                               |
| 7          | (addrlen\<\<14) \| 0x402                                                         |
| 8          | Pointer to input dest_addr structure (must be a valid address, even when unused) |
| 9          | (len\<\<4) \| 10                                                                 |
| 10         | Pointer to input buf                                                             |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |

# Description

This is the same as [SOCU:sendto](SOCU:sendto "wikilink"), except for
the "(insize\<\<X) \| val" headers.