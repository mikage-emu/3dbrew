+++
title = 'DSP:GetPipeReadableSize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000F0080\] |
| 1          | Channel                    |
| 2          | Peer                       |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | u16, Readable size |