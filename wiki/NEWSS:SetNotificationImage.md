# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090082\] |
| 1          | Notification ID            |
| 2          | Size                       |
| 3          | (Size\<\<4) \| 10          |
| 4          | Buffer ptr                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This writes the input buffer to the news-module .mpo save-file for the
specified notificationID, the filesize is set to the input size.