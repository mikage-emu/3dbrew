+++
title = 'NIMU:SetDbgTasks'
+++

# Request

| Index Word | Description                                                                                   |
|------------|-----------------------------------------------------------------------------------------------|
| 0          | Header code \[0x001B0042\]                                                                    |
| 1          | Number of [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink")     |
| 2          | Mapped Input Buffer Header (Size \<\< 4 \| 0xA)                                               |
| 3          | [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") Input Pointer |

# Response

| Index Word | Description                                                                                   |
|------------|-----------------------------------------------------------------------------------------------|
| 0          | Header code \[0x001B0042\]                                                                    |
| 1          | Result code                                                                                   |
| 2          | Mapped Input Buffer Header (Size \<\< 4 \| 0xA)                                               |
| 3          | [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") Input Pointer |

# Description

Sets the contents of dbgtasks.dat in the NIM save data to the provided
entries. Each entry should be of size 0x138.
