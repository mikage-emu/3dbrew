# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00070104\]         |
| 1          | Socket descriptor                  |
| 2          | size_t len                         |
| 3          | int flags                          |
| 4          | socklen_t addrlen                  |
| 5          | Value 0x20 (processID header)      |
| 6          | ProcessID set by the ARM11 kernel. |
| 7          | (len\<\<4) \| 12                   |
| 8          | Pointer to output buf              |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                                                                          |
|------------|--------------------------------------------------------------------------------------|
| 0          | (addrlen\<\<14) \| 2                                                                 |
| 1          | Pointer to the output src_addr structure (must be a valid address, even when unused) |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |

# Description

This is the same as [SOCU:recvfrom](SOCU:recvfrom "wikilink"), except
this doesn't have the size restriction, and this uses the
"(outsize\<\<4) \| 12" header instead of the "\| 2" header. This also
doesn't have the extra "total received data" field in the response which
recvfrom has.