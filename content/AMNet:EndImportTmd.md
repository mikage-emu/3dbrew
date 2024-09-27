+++
title = 'AMNet:EndImportTmd'
+++

# Request

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code \[0x080C0042\]        |
| 1          | bool, ? (usually true)            |
| 2          | 0x10                              |
| 3          | TMD Handle (closed automatically) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
