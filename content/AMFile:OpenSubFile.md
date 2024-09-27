+++
title = 'AMFile:OpenSubFile'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08010100\] |
| 1-2        | u64, Offset                |
| 3-4        | u64, Size                  |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08010040\] |
| 1          | Result code                |
| 3          | Handle                     |
