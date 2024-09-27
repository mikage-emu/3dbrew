+++
title = 'NIMU:GetTaskInfos'
+++

# Request

| Index Word | Description                                                                                                   |
|------------|---------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000F0042\]                                                                                    |
| 1          | Maximum Number of [BackgroundTitleDownloadTaskInfos](NIM_Services#BackgroundTitleDownloadTaskInfo "wikilink") |
| 2          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC)                                                              |
| 3          | [BackgroundTitleDownloadTaskInfos](NIM_Services#BackgroundTitleDownloadTaskInfo "wikilink") Output Pointer    |

# Response

| Index Word | Description                                                                                                |
|------------|------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000F0082\]                                                                                 |
| 1          | Result code                                                                                                |
| 2          | Number of [BackgroundTitleDownloadTaskInfos](NIM_Services#BackgroundTitleDownloadTaskInfo "wikilink") Read |
| 3          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC)                                                           |
| 4          | [BackgroundTitleDownloadTaskInfos](NIM_Services#BackgroundTitleDownloadTaskInfo "wikilink") Output Pointer |

# Description

Retrieves all registered background title download tasks.