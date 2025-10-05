+++
title = 'IRU:StartRecvTransfer'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000500C2\] |
| 1          | Total shared memory size   |
| 2          | Size of data to receive    |
| 3          | u8 Variable length flag    |
| 4          | Value zero                 |
| 5          | Shared memory handle       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This starts an IR data-receive transfer, this command is non-blocking. The received data (when the receive transfer-count is non-zero) is written to sharedmemaddr + 0. The currently received transfer-count can be obtained via [IRU:GetRecvTransferCount](IRU:GetRecvTransferCount "wikilink"), unless cancelled using [IRU:WaitRecvTransfer](IRU:WaitRecvTransfer "wikilink").
Before another receive transfer can be started, [IRU:WaitRecvTransfer](IRU:WaitRecvTransfer "wikilink") needs to be called, otherwise error 0xE0210CCA is returned.
The shared memory size must be larger or equal to the input size and both have to be non-zero, otherwise error 0xE0E10FEC is returned.
The event handle returned by [IRU:GetRecvFinishedEvent](IRU:GetRecvFinishedEvent "wikilink") is signalled when the given amount of bytes has been received.

If the variable length flag is set, the command instead continuously reads a variable amount of bytes.
This treats the shared memory as a ring buffer with its length given by the receive size, overwriting bytes at the start of memory if more data is received.
The length returned by [IRU:GetRecvTransferCount](IRU:GetRecvTransferCount "wikilink") gives the total amount of bytes received, so determining the location of the most recently received bytes requires taking this wrapping behaviour into account.
Each time the IR module times out (it has not received any new signals for the time it would take to receive a number of bytes), the receive event is signalled.
The transfer only stops once it encounters a transfer error or it is cancelled using [IRU:WaitRecvTransfer](IRU:WaitRecvTransfer "wikilink").

Both cases also signal the receive event if they stop because a transfer error has been encountered, but not when cancelled or [shut down](IRU:Shutdown "wikilink"). The presence and type of a transfer error can be queried using [IRU::GetErrorStatus](IRU::GetErrorStatus "wikilink").
