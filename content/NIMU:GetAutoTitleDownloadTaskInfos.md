+++
title = 'NIMU:GetAutoTitleDownloadTaskInfos'
+++

# Request

| Index Word | Description                                                                                       |
|------------|---------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00170042\]                                                                        |
| 1          | Maximum Number of [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") |
| 2          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC)                                                  |
| 3          | [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") Output Pointer    |

# Response

| Index Word | Description                                                                                    |
|------------|------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00170082\]                                                                     |
| 1          | Result code                                                                                    |
| 2          | Number of [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") Read |
| 3          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC)                                               |
| 4          | [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") Output Pointer |

# Description

Retrieves all stored auto title download tasks.
