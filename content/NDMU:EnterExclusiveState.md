+++
title = 'NDMU:EnterExclusiveState'
+++

# Request

| Index Word | Description                                                      |
|------------|------------------------------------------------------------------|
| 0          | Header code \[0x00010042\]                                       |
| 1          | Exclusive State (see [here](NDM_Services "wikilink") for values) |
| 2          | 0x20                                                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
