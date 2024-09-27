+++
title = 'IRU:GetRecvFinishedEvent'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E0000\] |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2          | Value 0             |
| 3          | Output event handle |

# Description

The event handle returned by this is signaled when a
[receive-transfer](IRU:StartRecvTransfer "wikilink") finishes, if
[IRU:WaitRecvTransfer](IRU:WaitRecvTransfer "wikilink") wasn't used
already.
