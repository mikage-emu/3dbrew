+++
title = 'NDMU:GetDaemonDisableCount'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x000E0040\]                              |
| 1          | Daemon (see [here](NDM_Services "wikilink") for values) |

# Response

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code                   |
| 1          | Result code                   |
| 2          | Current process disable count |
| 3          | Total disable count           |
