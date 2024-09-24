+++
title = 'AMFile:GetSize'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x08040000\] |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Resultcode          |
| 2          | Filesize lower word |
| 3          | Filesize upper word |