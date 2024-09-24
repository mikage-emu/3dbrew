+++
title = 'GSPGPU:TryAcquireRight'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00150002\] |
| 1          | Value 0x0                  |
| 2          | Process handle             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is a non-blocking version of
[AcquireRight](GSPGPU:AcquireRight "wikilink"). It returns error
0xc8402bf0 if the rights couldn't be acquired.
