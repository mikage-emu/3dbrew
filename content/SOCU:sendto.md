+++
title = 'SOCU:sendto'
+++

# Request

| Index Word | Description                                                                      |
|------------|----------------------------------------------------------------------------------|
| 0          | Header code \[0x000A0106\]                                                       |
| 1          | Socket descriptor                                                                |
| 2          | size_t len                                                                       |
| 3          | int flags                                                                        |
| 4          | socklen_t addrlen                                                                |
| 5          | Value 0x20 (processID header)                                                    |
| 6          | ProcessID set by the ARM11 kernel.                                               |
| 7          | (len\<\<14) \| 0x802                                                             |
| 8          | Pointer to input buf                                                             |
| 9          | (addrlen\<\<14) \| 0x402                                                         |
| 10         | Pointer to input dest_addr structure (must be a valid address, even when unused) |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |