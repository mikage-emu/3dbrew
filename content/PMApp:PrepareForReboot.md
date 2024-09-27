+++
title = 'PMApp:PrepareForReboot'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[0x00060082\]                        |
| 1-2        | u64, Timeout                                      |
| 3          | 0x20                                              |
| 4          | Process ID (Filled automatically by ARM11 kernel) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This terminates the process with ID 4 (PXI) and all other processes that
are not FIRM sysmodules or depended on by the calling process. It then
sends [SRV](Services "wikilink") notification 0x179 to the calling
process.

This returns result code 0xC8A05801 if it has already been called.