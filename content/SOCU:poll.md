+++
title = 'SOCU:poll'
+++

# Request

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | Header code \[0x00140084\]           |
| 1          | nfds_t nfds                          |
| 2          | int timeout                          |
| 3          | Value 0x20 (processID header)        |
| 4          | ProcessID set by the ARM11 kernel.   |
| 5          | (insize\<\<14) \| 0x2802             |
| 6          | Pointer to input pollfd struct array |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                           |
|------------|---------------------------------------|
| 0          | (outsize\<\<14) \| 2                  |
| 1          | Pointer to output pollfd struct array |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |

# pollfd struct

| Type | Name    | Description                |
|------|---------|----------------------------|
| u32  | fd      | Socket handle              |
| u32  | events  | Events to poll for (input) |
| u32  | revents | Events received (output)   |

# Events

Events are a bitwise set of these flags. These flags don't exactly match
the Wii flags, even though the sockets sysmodule uses the same codebase.

| Value      | Name       | Description                   |
|------------|------------|-------------------------------|
| 0x01       | POLLIN     | Data can be read.             |
| 0x02       | POLLPRI    | Urgent data can be read.      |
| 0x08       | POLLWRNORM | Normal data can be written.   |
| 0x10       | POLLWRBAND | Priority data can be written. |
| 0x20       | POLLNVAL   | Invalid socket handle.        |
| POLLWRNORM | POLLOUT    | Data can be written.          |

Flag 0x4 isn't ever assigned in the code. Flags 0x40 and 0x80 are also
not used, even though they are assgined in the input events by default
along with 0x20. This is likely because that code section was inherited
from the Wii, where these flags are used for poll errors.

Contrary to the Wii sockets, the 3DS doesn't have POLLERR or POLLHUP, so
poll shouldn't be relied on when checking for socket errors.