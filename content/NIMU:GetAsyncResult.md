+++
title = 'NIMU:GetAsyncResult'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00130000\] |

# Response

| Index Word | Description                           |
|------------|---------------------------------------|
| 0          | Header code \[0x001300C0\]            |
| 1          | Result code                           |
| 2          | Async Operation Result Code           |
| 3          | Async Operation Customer Support Code |

# Description

Gets the result code and customer support code yielded by the last async
call.

Calls this is relevant to are:

- [UpdateAutoTitleDownloadTasksAsync](NIMU:UpdateAutoTitleDownloadTasksAsync "wikilink")
- [StartPendingAutoTitleDownloadTasksAsync](NIMU:StartPendingAutoTitleDownloadTasksAsync "wikilink")
- [DownloadTitleSeedAsync](NIMU:DownloadTitleSeedAsync "wikilink")
- [DownloadMissingTitleSeedsAsync](NIMU:DownloadMissingTitleSeedsAsync "wikilink")
