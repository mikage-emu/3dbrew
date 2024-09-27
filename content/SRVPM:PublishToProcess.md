+++
title = 'SRVPM:PublishToProcess'
+++

# Request

| Index Word | Description                                                                          |
|------------|--------------------------------------------------------------------------------------|
| 0          | Header code \[0x04010042 pre-[7.0.0-13](7.0.0-13 "wikilink"), 0x00010042 currently\] |
| 1          | Notification ID, see [Notifications](Services#notifications "wikilink")              |
| 2          | 0x0                                                                                  |
| 3          | Process Handle                                                                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
