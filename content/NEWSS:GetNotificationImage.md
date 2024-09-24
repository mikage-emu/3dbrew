# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0082\] |
| 1          | Notification ID            |
| 2          | Size                       |
| 3          | (Size\<\<4) \| 12          |
| 4          | Buffer ptr                 |

# Response

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | Header code                          |
| 1          | Resultcode                           |
| 2          | Actual read size from the .mpo file. |

# Description

This reads the news-module .mpo save-file for the specified
notificationID, into the output buffer.

The notifications applet uses hard-coded size 0x10000 for this.