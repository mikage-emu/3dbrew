+++
title = 'FSPXI:CardNorDirectCommand'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002A0040\] |
| 1          | u8 commandID               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This writes the specified command to [SPICARD](SPICARD "wikilink"),
without any parameters. This doesn't read/write any SPICARD regs after
writing the command to SPICARD-FIFO.
