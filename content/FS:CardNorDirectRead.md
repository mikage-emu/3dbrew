# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08270082\] |
| 1          | u8 commandID               |
| 2          | u32 Size                   |
| 3          | (Size\<\<6) \| 0xC         |
| 4          | Output buffer ptr          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is about the same as
[FS:CardNorDirectCommand](FS:CardNorDirectCommand "wikilink")(one of the
values used with this code is loaded from Process9 state instead of
using value 0), except this also writes the specified amount of data
from SPICARD-FIFO to the output buffer.