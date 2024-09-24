+++
title = 'FSPXI:CardNorDirectReadWithAddress'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002D00C2\] |
| 1          | u8 commandID               |
| 2          | u32 address                |
| 3          | u32 Size                   |
| 4          | (Size\<\<8) \| 4           |
| 5          | Output buffer ptr          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This is about the same as
[FSPXI:CardNorDirectCommandWithAddress](FSPXI:CardNorDirectCommandWithAddress "wikilink")(one
of the values used with this code is loaded from Process9 state instead
of using value 0), except this also writes the specified amount of data
from SPICARD-FIFO to the output buffer.