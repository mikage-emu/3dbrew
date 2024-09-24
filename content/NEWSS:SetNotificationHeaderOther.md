# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00120082\] |
| 1          | Notification ID            |
| 2          | Header buffer size         |
| 3          | (HdrSize\<\<4) \| 10       |
| 4          | Header buffer ptr          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This is the same as
[NEWSS:SetNotificationHeader](NEWSS:SetNotificationHeader "wikilink"),
but it only applies the changes in memory, and doesn't save the changes
to the savedata.