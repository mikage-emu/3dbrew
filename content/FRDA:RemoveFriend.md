+++
title = 'FRDA:RemoveFriend'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x04090100\] |
| 1          | principal_id               |
| 2..3       | u64 friend_code            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
