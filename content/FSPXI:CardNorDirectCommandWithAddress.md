+++
title = 'FSPXI:CardNorDirectCommandWithAddress'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002B0080\] |
| 1          | u8 commandID               |
| 2          | u32 address                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This is similar to
[FSPXI:CardNorDirectCommand](FSPXI:CardNorDirectCommand "wikilink"),
except this writes the specified address to SPICARD-FIFO(after
converting it), after writing the cmdID.