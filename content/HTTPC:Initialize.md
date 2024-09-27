+++
title = 'HTTPC:Initialize'
+++

# Request

| Index Word | Description                                  |
|------------|----------------------------------------------|
| 0          | Header code \[0x00010044\]                   |
| 1          | POST buffer size.                            |
| 2          | 0x20                                         |
| 3          | 0x0 (Filled with process ID by ARM11 Kernel) |
| 4          | 0x0                                          |
| 5          | POST buffer memory block handle.             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This initializes the HTTPC service, preparing it for requests. The
provided POST buffer must be page-aligned (0x1000).
