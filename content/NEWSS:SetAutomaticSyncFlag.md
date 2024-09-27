+++
title = 'NEWSS:SetAutomaticSyncFlag'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00110040\] |
| 1          | u8 Flag                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This sets the input value to an internal state, which is checked when
handling BOSS notifications. If the state isn't set to zero, then any
new BOSS notifications will not be synced automatically. The "unread
notifications" flag on news.db will still be set, regardless of this
value.