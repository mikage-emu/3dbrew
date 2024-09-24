+++
title = 'SOCU:fcntl'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x001300C2\]         |
| 1          | Socket descriptor                  |
| 2          | int cmd                            |
| 3          | arg                                |
| 4          | Value 0x20 (processID header)      |
| 5          | ProcessID set by the ARM11 kernel. |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |

# Description

The input cmd must be either F_GETFL(3)/F_SETFL(4), otherwise an error
is returned. For fd-flags, O_NONBLOCK is bitmask value 0x4.