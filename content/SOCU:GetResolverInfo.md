+++
title = 'SOCU:GetResolverInfo'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x001F0040\]         |
| 1          | Output size, normally 0x150-bytes. |

The following is located 0x100-bytes after the beginning of the above
command buffer:

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | (size\<\<14) \| 2             |
| 1          | Pointer to the output buffer. |

# Response

| Index Word | Description        |
|------------|--------------------|
| 0          | Header code        |
| 1          | Result code        |
| 2          | POSIX return value |