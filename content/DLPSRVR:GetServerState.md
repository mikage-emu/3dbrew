+++
title = 'DLPSRVR:GetServerState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030000\] |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | u8 Server state |

# Description

This gets the internal server state.
