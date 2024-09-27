+++
title = 'FS:CloseArchive'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080E0080\] |
| 1-2        | u64, Archive Handle        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |