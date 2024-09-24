# Request

| Index Word | Description                                                                                                   |
|------------|---------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00420240\]                                                                                    |
| 1-6        | [Title Download Config](NIM_Services#TitleDownloadConfig "wikilink")                                          |
| 7-8        | Unknown, not written by the system [eShop](eShop "wikilink") application service command code \*at\* \*all\*. |
| 9          | [Installation Mode](NIM_Services#InstallationMode "wikilink")                                                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This starts downloading the specified eShop title in the given mode.

[NIMS:GetProgress](NIMS:GetProgress "wikilink") may be used to monitor
the progress of installation. To abort the current download, see
[NIMS:CancelDownload](NIMS:CancelDownload "wikilink").