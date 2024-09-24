+++
title = 'SOCU:getsockname'
+++

# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x00170082\]                                              |
| 1          | Socket descriptor                                                       |
| 2          | Max addrlen (the output addrlen must be determined by the user process) |
| 3          | Value 0x20 (processID header)                                           |
| 4          | ProcessID set by the ARM11 kernel.                                      |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | (max_addrlen\<\<14) \| 2                      |
| 1          | Pointer to the output struct sockaddr buffer. |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |
