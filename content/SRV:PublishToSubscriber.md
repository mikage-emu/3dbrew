+++
title = 'SRV:PublishToSubscriber'
+++

# Request

| Index Word | Description                                                                                                                    |
|------------|--------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000C0080\]                                                                                                     |
| 1          | Notification ID, see [Notifications](Services#notifications "wikilink")                                                        |
| 2          | Flags (bit0: only fire if not already pending, bit1: do *not* report an error if there are more than 16 pending notifications) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This fires a notification to subscribed processes.
