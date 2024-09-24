+++
title = 'NIMU:GetTitleDownloadProgress'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00280000\] |

# Response

| Index Word | Description                                                            |
|------------|------------------------------------------------------------------------|
| 0          | Header code \[0x00280240\]                                             |
| 1          | Result code                                                            |
| 2-7        | [TitleDownloadProgress](NIM_Services#TitleDownloadProgress "wikilink") |
| 8          | Unused?                                                                |
| 9          | Unused?                                                                |

# Description

Gets the current progress of an ongoing title download.
