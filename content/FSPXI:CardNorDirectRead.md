+++
title = 'FSPXI:CardNorDirectRead'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002C0082\] |
| 1          | u8 commandID               |
| 2          | u32 Size                   |
| 3          | (Size\<\<8) \| 4           |
| 4          | Output buffer ptr          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This is about the same as
[FSPXI:CardNorDirectCommand](FSPXI:CardNorDirectCommand "wikilink")(one
of the values used with this code is loaded from Process9 state instead
of using value 0), except this also writes the specified amount of data
from SPICARD-FIFO to the output buffer.
