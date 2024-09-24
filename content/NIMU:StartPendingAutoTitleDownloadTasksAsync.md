+++
title = 'NIMU:StartPendingAutoTitleDownloadTasksAsync'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00120000\] |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x00120042\]      |
| 1          | Result code                     |
| 2          | Copy Handle Header (0x04000000) |
| 3          | Completion Event Handle         |

# Description

Registers and prepares every pending auto title download task for
download, then signals the completion event.