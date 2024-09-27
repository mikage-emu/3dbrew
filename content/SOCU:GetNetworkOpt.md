+++
title = 'SOCU:GetNetworkOpt'
+++

# Request

| Index Word | Description                                                      |
|------------|------------------------------------------------------------------|
| 0          | Header code \[0x001A00C0\]                                       |
| 1          | int level (Must be value 0xfffe, otherwise an error is returned) |
| 2          | int optname                                                      |
| 3          | socklen_t optlen                                                 |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | (optlen\<\<14) \| 2                  |
| 1          | Pointer to the output optval buffer. |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |
| 3          | Output optlen      |

# Description

This seems to be similar to Wii
[sockets](http://wiibrew.org/wiki/Socket) GetInterfaceOpt?(same optnames
/ optvals, for optname 0x4003, etc)
