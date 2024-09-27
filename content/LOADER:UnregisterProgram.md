+++
title = 'LOADER:UnregisterProgram'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030080\] |
| 1-2        | u64, Program Handle        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
