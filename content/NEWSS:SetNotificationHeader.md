+++
title = 'NEWSS:SetNotificationHeader'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070082\] |
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

This writes the input [header](NEWSS:AddNotification "wikilink")
structure for the specified notification, to the stored news-module
notification header.