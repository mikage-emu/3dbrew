# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0082\] |
| 1          | Notification ID            |
| 2          | Header buffer size         |
| 3          | (HdrSize\<\<4) \| 12       |
| 4          | Header buffer ptr          |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Resultcode          |
| 2          | Actual copied size. |

# Description

This writes the [header](NEWSS:AddNotification "wikilink") structure for
the specified notification, to the output buffer. The max size is
0x70-bytes.

This does additional processing with the output buffer after copying the
data there, see [here](NEWSS:AddNotification "wikilink").