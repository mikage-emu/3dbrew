# Request

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x000C0082\]                      |
| 1          | Socket descriptor                               |
| 2          | int how (SHUT_RD=0, SHUT_WR=1, and SHUT_RDWR=2) |
| 3          | Value 0x20 (processID header)                   |
| 4          | ProcessID set by the ARM11 kernel.              |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |