+++
title = 'IRU:WaitRecvTransfer'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060000\] |

# Response

| Index Word | Description                                                                                                                                 |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code                                                                                                                                 |
| 1          | Result code                                                                                                                                 |
| 2          | Total amount of newly received data, loaded from the same field which [IRU:GetRecvTransferCount](IRU:GetRecvTransferCount "wikilink") uses. |

# Description

This command waits for the data-receive transfer to finish.