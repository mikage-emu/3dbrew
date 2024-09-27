+++
title = 'FS:GetSpecialFileSize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08500040\] |
| 1          | Must be 0x0.               |

# Response

| Index Word | Description    |
|------------|----------------|
| 0          | Header code    |
| 1          | Result code    |
| 2-3        | u64, File Size |
