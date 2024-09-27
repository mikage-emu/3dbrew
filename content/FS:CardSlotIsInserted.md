+++
title = 'FS:CardSlotIsInserted'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08210000\] |

# Response

| Index Word | Description                          |
|------------|--------------------------------------|
| 0          | Header code                          |
| 1          | Result code                          |
| 2          | u8 No card inserted = 0, otherwise 1 |