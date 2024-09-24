# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00120104\]         |
| 1          | Socket descriptor                  |
| 2          | int level (SOL_SOCKET=0xffff)      |
| 3          | int optname                        |
| 4          | socklen_t optlen                   |
| 5          | Value 0x20 (processID header)      |
| 6          | ProcessID set by the ARM11 kernel. |
| 7          | (optlen\<\<14) \| 0x2402           |
| 8          | Pointer to input optval buffer     |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |