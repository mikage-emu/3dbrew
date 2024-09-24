+++
title = 'FS:CardNorDirectCommandWithAddress'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08260080\] |
| 1          | u8 commandID               |
| 2          | u32 address                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is similar to
[FS:CardNorDirectCommand](FS:CardNorDirectCommand "wikilink"), except
this writes the specified address to SPICARD-FIFO(after converting it),
after writing the cmdID.