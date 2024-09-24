# Request

| Index Word | Description                                                                                       |
|------------|---------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x001C0042\]                                                                        |
| 1          | Maximum Number of [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") |
| 2          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC)                                                  |
| 3          | [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") Output Pointer    |

# Response

| Index Word | Description                                                                                    |
|------------|------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x001C0082\]                                                                     |
| 1          | Result code                                                                                    |
| 2          | Number of [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") Read |
| 2          | Mapped Output Buffer Header (Size \<\< 4 \| 0xC)                                               |
| 3          | [AutoTitleDownloadTaskInfos](NIM_Services#AutoTitleDownloadTaskInfo "wikilink") Output Pointer |

# Description

Retrieves the contents of dbgtasks.dat from the NIM save data. Each
entry should be of size 0x138.