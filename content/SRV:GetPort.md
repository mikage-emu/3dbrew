+++
title = 'SRV:GetPort'
+++

# Request

| Index Word | Description                                                                       |
|------------|-----------------------------------------------------------------------------------|
| 0          | Header code \[0x00080100\]                                                        |
| 1-2        | 8-byte UTF-8 port name                                                            |
| 3          | Name length                                                                       |
| 4          | Flags (non-zero: block until port is found, then return 0 instead of port handle) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 3          | Port handle |