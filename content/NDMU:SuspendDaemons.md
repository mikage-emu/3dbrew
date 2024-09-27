+++
title = 'NDMU:SuspendDaemons'
+++

# Request

| Index Word | Description                                                           |
|------------|-----------------------------------------------------------------------|
| 0          | Header code \[0x00060040\]                                            |
| 1          | Daemon bit mask (see [here](NDM_Services "wikilink") for mask values) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
