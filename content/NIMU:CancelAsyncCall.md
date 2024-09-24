+++
title = 'NIMU:CancelAsyncCall'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00140000\] |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00140040\] |
| 1          | Result code                |

# Description

Cancels the current async call.

Calls this is relevant to are:

- [UpdateAutoTitleDownloadTasksAsync](NIMU:UpdateAutoTitleDownloadTasksAsync "wikilink")
- [StartPendingAutoTitleDownloadTasksAsync](NIMU:StartPendingAutoTitleDownloadTasksAsync "wikilink")
- [DownloadTitleSeedAsync](NIMU:DownloadTitleSeedAsync "wikilink")
- [DownloadMissingTitleSeedsAsync](NIMU:DownloadMissingTitleSeedsAsync "wikilink")