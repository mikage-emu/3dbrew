+++
title = 'SOCU:accept'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00040082\]         |
| 1          | Socket descriptor                  |
| 2          | Max addrlen                        |
| 3          | Value 0x20 (processID header)      |
| 4          | ProcessID set by the ARM11 kernel. |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                                                                      |
|------------|----------------------------------------------------------------------------------|
| 0          | (maxaddrlen\<\<14) \| 2                                                          |
| 1          | Pointer to the output addr structure (must be a valid address, even when unused) |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |