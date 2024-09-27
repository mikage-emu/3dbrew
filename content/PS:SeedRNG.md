+++
title = 'PS:SeedRNG'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000C0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This initializes a stack buffer using data from svcGetSystemTick and
various commands, then passes this buffer to
[PSPXI:SeedRNG](Process_Services_PXI "wikilink"). Then this returns 0.
