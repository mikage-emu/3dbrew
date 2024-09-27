+++
title = 'SRV:ReceiveNotification'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0000\] |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | Notification ID |

# Description

This returns the notificationID which was triggered, if any (see
[GetNotificationSemaphore](SRV:GetNotificationSemaphore "wikilink")).