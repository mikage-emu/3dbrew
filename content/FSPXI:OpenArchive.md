+++
title = 'FSPXI:OpenArchive'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001200C2\] |
| 1          | Archive idcode             |
| 2          | LowPath.Type               |
| 3          | LowPath.Size               |
| 4          | (LowPath.Size\<\<8) \| 4   |
| 5          | LowPath.Data pointer       |

# Response

| Index Word | Description               |
|------------|---------------------------|
| 0          | Header code               |
| 1          | Result code               |
| 2          | Archive handle lower word |
| 3          | Archive handle upper word |
