+++
title = 'SRV:Unsubscribe'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0040\] |
| 1          | Notification ID            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This disables the specified notificationID for the current process.