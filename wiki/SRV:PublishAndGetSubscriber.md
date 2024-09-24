# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000D0040\] |
| 1          | Notification ID            |

# Response

| Index Word | Description            |
|------------|------------------------|
| 0          | Header code            |
| 1          | Result code            |
| 2          | Process ID Count       |
| 3-62       | Subscriber Process IDs |

# Description

This fires a notification to subscribed processes, returning a list of
up to 60 process IDs of subscribers that received the notification.