# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00020000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This cancels downloading the current [NIM](NIM_Services "wikilink")
download, which was started with
[NIMS:StartDownload](NIMS:StartDownload "wikilink") or
[NIMS:StartDownloadSimple](NIMS:StartDownloadSimple "wikilink").