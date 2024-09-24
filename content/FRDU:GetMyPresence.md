+++
title = 'FRDU:GetMyPresence'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080000\] |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description |
|------------|-------------|
| 0          | 004b0002?   |
| 1          | u8\* buffer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |