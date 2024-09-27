+++
title = 'FS:CardNorDirectSectorEraseWithoutVerify'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x082D0040\] |
| 1          | u32 address                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This erases the specified sector.
