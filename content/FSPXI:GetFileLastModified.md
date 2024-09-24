+++
title = 'FSPXI:GetFileLastModified'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x004800C2\] |
| 1          | Archive handle lower word  |
| 2          | Archive handle upper word  |
| 3          | Path size                  |
| 4          | (Path size \<\< 9) \| 6    |
| 5          | u16 \*, UTF-16 path data   |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2-3        | u64, File last modified timestamp |
