+++
title = 'NEWSS:WriteNewsDBSavedata'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00130000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |

# Description

This writes the news.db data stored in news-module memory to the
save-file. This is done automatically when using any commands which
write to the news.db data in memory.
