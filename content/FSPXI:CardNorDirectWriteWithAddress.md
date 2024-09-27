+++
title = 'FSPXI:CardNorDirectWriteWithAddress'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002F00C2\] |
| 1          | u8 commandID               |
| 2          | u32 address                |
| 3          | u32 Size                   |
| 4          | (Size\<\<8) \| 4           |
| 5          | Input buffer ptr           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This is the same as
[FSPXI:CardNorDirectReadWithAddress](FSPXI:CardNorDirectReadWithAddress "wikilink"),
except this writes data to SPICARD-FIFO after writing the cmd-data
instead of reading from FIFO.
