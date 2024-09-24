+++
title = 'FSPXI:CardNorDirectSectorEraseWithoutVerify'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00320040\] |
| 1          | u32 address                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This erases the specified sector.