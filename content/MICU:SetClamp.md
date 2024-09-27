+++
title = 'MICU:SetClamp'
+++

# Request

| Index Word | Description                                   |
|------------|-----------------------------------------------|
| 0          | Header code \[0x000D0040\]                    |
| 1          | u8, clamp (0 = don't clamp, non-zero = clamp) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
