+++
title = 'FS:CardNorDirectWriteWithAddress'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x082A00C2\] |
| 1          | u8 commandID               |
| 2          | u32 address                |
| 3          | u32 Size                   |
| 4          | (Size\<\<6) \| 0xA         |
| 5          | Input buffer ptr           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is the same as
[FS:CardNorDirectReadWithAddress](FS:CardNorDirectReadWithAddress "wikilink"),
except this writes data to SPICARD-FIFO after writing the cmd-data
instead of reading from FIFO.
