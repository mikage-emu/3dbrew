+++
title = 'NIMU:RegisterTask'
+++

# Request

| Index Word | Description                                                        |
|------------|--------------------------------------------------------------------|
| 0          | Header code \[0x00290246\]                                         |
| 1-6        | [TitleDownloadConfig](NIM_Services#TitleDownloadConfig "wikilink") |
| 7          | Unused?                                                            |
| 8          | Unused?                                                            |
| 9          | ? (Clamped to 0x9F and later added to 0x60?)                       |
| 10         | Process ID Header                                                  |
| 11         | Process ID (Auto-Filled by Kernel)                                 |
| 12         | Static Buffer Header (Size = 0x90)                                 |
| 13         | Title Name UTF-16 String Pointer                                   |
| 14         | Static Buffer Header (Size = 0x48)                                 |
| 15         | Developer Name UTF-16 String Pointer                               |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00290040\] |
| 1          | Result code                |

# Description

Registers a background title download task. An icon will be shown on the
HOME menu with the download progress.
