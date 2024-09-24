+++
title = 'FS:CardNorDirectWrite'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08290082\] |
| 1          | u8 commandID               |
| 2          | u32 Size                   |
| 3          | (Size\<\<6) \| 0xA         |
| 4          | Input buffer ptr           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is the same as
[FS:CardNorDirectRead](FS:CardNorDirectRead "wikilink"), except this
writes data to SPICARD-FIFO after writing the cmd-data instead of
reading from FIFO.