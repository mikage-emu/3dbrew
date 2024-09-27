+++
title = 'FS:UpdateSha256Context'
+++

# Request

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code \[0x084E0342\]   |
| 1-8        | Input Hash. Not used at all. |
| 9          | Input Data Size              |
| 10         | u32 Flag, must be zero.      |
| 11         | u32 Flag, must be zero.      |
| 12         | s8 Flag, must be zero.       |
| 13         | s8 Flag, must be non-zero.   |
| 14         | (Size \<\< 4) \| 0xA         |
| 15         | Input Data Pointer           |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2-9        | Output SHA-256 Hash |

# Description

This calculates a SHA-256 hash using the ARM11 hash engine.

None of the input flags are used at all after validation(error
0xf9604784 is returned on validation failure).
