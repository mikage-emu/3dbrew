# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0000\] |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2          | Value 0             |
| 3          | Output event handle |

# Description

The event handle returned by this is signaled when a
[send-transfer](IRU:StartSendTransfer "wikilink") finishes, if
[IRU:WaitSendTransfer](IRU:WaitSendTransfer "wikilink") wasn't used
already.