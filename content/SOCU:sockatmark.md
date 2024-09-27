+++
title = 'SOCU:sockatmark'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00150042\]         |
| 1          | Socket descriptor                  |
| 2          | Value 0x20 (processID header)      |
| 3          | ProcessID set by the ARM11 kernel. |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |