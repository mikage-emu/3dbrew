+++
title = 'FSPXI:HasFile'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00130102\] |
| 1          | Archive handle lower word  |
| 2          | Archive handle upper word  |
| 3          | Path type                  |
| 4          | Path size                  |
| 5          | (Path size \<\< 8) \| 6    |
| 6          | Path data pointer          |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | u8, has file |

# Description

Checks whether or not a file exists in the given archive. The output u8
is set to 1 if the file exists, and to 0 if the file does not exist.