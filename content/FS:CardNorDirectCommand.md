+++
title = 'FS:CardNorDirectCommand'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08250040\] |
| 1          | u8 commandID               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This writes the specified command to [SPICARD](SPICARD "wikilink"),
without any parameters. This doesn't read/write any SPICARD regs after
writing the command to SPICARD-FIFO.