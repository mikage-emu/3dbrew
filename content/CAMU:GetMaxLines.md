+++
title = 'CAMU:GetMaxLines'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0080\] |
| 1          | s16, Width                 |
| 2          | s16, Height                |

# Response

| Index Word | Description    |
|------------|----------------|
| 0          | Header code    |
| 1          | Result code    |
| 2          | s16, Max Lines |
