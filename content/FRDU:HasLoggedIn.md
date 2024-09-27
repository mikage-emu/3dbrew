+++
title = 'FRDU:HasLoggedIn'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010000\] |

# Response

| Index Word | Description                                                      |
|------------|------------------------------------------------------------------|
| 0          | Header code                                                      |
| 1          | Result code                                                      |
| 2          | Logged in state (8-bit, 0 = not logged in, non-zero = logged in) |