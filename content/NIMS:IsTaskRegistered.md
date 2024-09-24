+++
title = 'NIMS:IsTaskRegistered'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060080\] |
| 1-2        | Title ID to query for      |

# Response

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code                                             |
| 1          | Result code                                             |
| 2          | (u8) non-zero if there is a task for the given title ID |

# Description

Checks whether there is a task registered with
[NIMS:RegisterTask](NIMS:RegisterTask "wikilink") for the given title
ID.
