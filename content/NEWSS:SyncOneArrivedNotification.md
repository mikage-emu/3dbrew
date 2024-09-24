+++
title = 'NEWSS:SyncOneArrivedNotification'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100040\] |
| 1          | u8 Flag                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This is similar to
[SyncArrivedNotifications](NEWSS:SyncArrivedNotifications "wikilink"),
but it only syncs the first entry of the NsDataList. If the input flag
isn't zero, the BOSS notification flag 0x6 is set to 1.