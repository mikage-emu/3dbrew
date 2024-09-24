+++
title = 'FSFile:GetSize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08040000\] |

# Response

| Index Word | Description    |
|------------|----------------|
| 0          | Header code    |
| 1          | Result code    |
| 2-3        | u64, File Size |