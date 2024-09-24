+++
title = 'SOCU:listen'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00030082\]         |
| 1          | Socket descriptor                  |
| 2          | int backlog                        |
| 3          | Value 0x20 (processID header)      |
| 4          | ProcessID set by the ARM11 kernel. |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |