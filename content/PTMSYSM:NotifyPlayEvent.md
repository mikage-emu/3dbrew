+++
title = 'PTMSYSM:NotifyPlayEvent'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080E0140\] |
| 1          | Type?                      |
| 2-3        | u64 ProgramID              |
| 4-5        | u64 Timestamp              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This updates the play-log stored in the [PTM
Savegame](PTM_Savegame "wikilink") PlayHistory.dat. This is used when
applications/applets are launched/closed.
