# Request

| Index Word | Description                                                        |
|------------|--------------------------------------------------------------------|
| 0          | Header code \[0x00260180\]                                         |
| 1-6        | [TitleDownloadConfig](NIM_Services#TitleDownloadConfig "wikilink") |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00260040\] |
| 1          | Result code                |

# Description

Starts a download. Used by the HOME menu when choosing to perform an
in-progress background download now.