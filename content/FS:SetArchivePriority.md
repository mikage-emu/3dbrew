+++
title = 'FS:SetArchivePriority'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x085A00C0\] |
| 1-2        | u64, Archive Handle        |
| 3          | Priority                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |