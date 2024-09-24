+++
title = 'AMPXI:InstallTmdWrite'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00140042\] |
| 1          | TMD size                   |
| 2          | (TMDSize \<\< 8) \| 6      |
| 3          | TMD data input pointer     |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00140040\] |
| 1          | Result code                |
