+++
title = 'NIMS:GetProgress'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030000\] |

# Response

| Index Word | Description                                                                     |
|------------|---------------------------------------------------------------------------------|
| 0          | Header code                                                                     |
| 1          | Result code                                                                     |
| 2-7        | [Title Download Progress](NIM_Services#titledownloadprogress "wikilink") struct |

# Description

Gets information about the current [NIM](NIM_Services "wikilink")
download, which was started with
[NIMS:StartDownload](NIMS:StartDownload "wikilink") or
[NIMS:StartDownloadSimple](NIMS:StartDownloadSimple "wikilink").
