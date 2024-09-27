+++
title = 'SRV:Subscribe'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090040\] |
| 1          | Notification ID            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This enables the specified notificationID for the current process.