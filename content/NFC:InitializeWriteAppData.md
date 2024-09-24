+++
title = 'NFC:InitializeWriteAppData'
+++

# Request

| Index Word | Description                                                           |
|------------|-----------------------------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00140384\]                     |
| 1          | u32 little-endian [Amiibo](Amiibo "wikilink") AppID                   |
| 2          | Size                                                                  |
| 3-14       | 0x30-byte structure, must be all-zero otherwise an error is returned. |
| 15         | 0x20, PID translate-header for kernel.                                |
| 16         | PID written by kernel.                                                |
| 17         | (Size\<\<14) \| 2                                                     |
| 18         | Pointer to input buf                                                  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is used to write to the [Amiibo](Amiibo "wikilink") app-data in
memory, when the app-data is not already setup for the user application.

Once finished this updates the actual Amiibo NFC data.