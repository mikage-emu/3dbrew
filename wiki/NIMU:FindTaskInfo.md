# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E0080\] |
| 1-2        | Title ID                   |

# Response

| Index Word | Description                                                                                        |
|------------|----------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x000E0042\]                                                                         |
| 1          | Result code                                                                                        |
| 2          | Static Buffer Header (Size = 0x120)                                                                |
| 3          | [BackgroundTitleDownloadTaskInfo](NIM_Services#BackgroundTitleDownloadTaskInfo "wikilink") Pointer |

# Description

Retrieves information about the registered background download task for
the given title.