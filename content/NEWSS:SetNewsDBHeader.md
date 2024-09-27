+++
title = 'NEWSS:SetNewsDBHeader'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060042\] |
| 1          | Size                       |
| 2          | (Size\<\<4) \| 12          |
| 3          | Buffer ptr                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This copies the input buffer to the header at the start of the news.db
save-file in news-module memory, then writes the updated news.db to
savedata. The max size is 0x10-bytes.