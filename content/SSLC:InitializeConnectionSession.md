+++
title = 'SSLC:InitializeConnectionSession'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00120042\]                             |
| 1          | [contexthandle](SSLC:CreateContext "wikilink")         |
| 2          | 0x20, processID translate-header for the ARM11-kernel. |
| 3          | processID set by the ARM11-kernel.                     |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
