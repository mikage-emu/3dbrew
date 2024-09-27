+++
title = 'FRDA:AddFriendOnline'
+++

# Request

| Index Word | Description                                |
|------------|--------------------------------------------|
| 0          | Header code \[0x04060042\]                 |
| 1          | principal_id                               |
| 2          | 0 (one copy handle translation descriptor) |
| 3          | Event Handle                               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
