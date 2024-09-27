+++
title = 'FRDU:GetMyPassword'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100040\] |
| 1          | Buffer length              |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | (bufferLength \<\< 14) \| 2 |
| 1          | char\* buffer               |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
