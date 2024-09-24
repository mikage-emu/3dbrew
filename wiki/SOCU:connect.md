# Request

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | Header code \[0x00060084\]          |
| 1          | Socket descriptor                   |
| 2          | socklen_t addrlen                   |
| 3          | Value 0x20 (processID header)       |
| 4          | ProcessID set by the ARM11 kernel.  |
| 5          | (addrlen\<\<14) \| 2                |
| 6          | Pointer to input sockaddr structure |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |