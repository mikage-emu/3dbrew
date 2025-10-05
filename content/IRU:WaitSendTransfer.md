+++
title = 'IRU:WaitSendTransfer'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This command cancels the current send-transfer and waits for the [Transfer State](IRU:GetTransferState "wikilink") to be Ready before returning.
The event returned by [GetSendFinishedEvent](IRU:GetSendFinishedEvent "wikilink") will not be signalled when the transfer is cancelled this way.
