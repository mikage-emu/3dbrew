+++
title = 'IRU:WaitRecvTransfer'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060000\] |

# Response

| Index Word | Description |
|----|----|
| 0 | Header code |
| 1 | Result code |
| 2 | Total amount of newly received data, loaded from the same field which [IRU:GetRecvTransferCount](IRU:GetRecvTransferCount "wikilink") uses. |

# Description

This command cancels the current data-receive transfer and waits for the [Transfer State](IRU:GetTransferState "wikilink") to be Ready before returning. The response includes the amount of data already written to the shared memory by the time the transfer is cancelled.
The event returned by [GetRecvFinishedEvent](IRU:GetRecvFinishedEvent "wikilink") will not be signalled when the transfer is cancelled this way.
