+++
title = 'IRU:GetRecvTransferCount'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070000\] |

# Response

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code                               |
| 1          | Result code                               |
| 2          | Current amount of newly received IR data. |

# Description

This command can only be used after using
[IRU:StartRecvTransfer](IRU:StartRecvTransfer "wikilink"), and before
using [IRU:WaitRecvTransfer](IRU:WaitRecvTransfer "wikilink") / starting
a new transfer. Otherwise, this returns error 0xC8810FEF.