+++
title = 'IRU:StartRecvTransfer'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000500C2\] |
| 1          | Total shared memory size   |
| 2          | Size of data to receive    |
| 3          | u8 flag                    |
| 4          | Value zero                 |
| 5          | Shared memory handle       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This starts an IR data-receive transfer, this command is non-blocking.
The received data(when the receive transfer-count is non-zero) is
written to sharedmemaddr + 0. The newly received transfer-count can be
obtained via [IRU:WaitRecvTransfer](IRU:WaitRecvTransfer "wikilink").
The input size must be \<=0x800, otherwise error 0xE0E10FEC is returned.
