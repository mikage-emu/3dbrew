# Request

| Index Word | Description                                                                                                   |
|------------|---------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00010200\]                                                                                    |
| 1-6        | [Title Download Config](NIM_Services#TitleDownloadConfig "wikilink")                                          |
| 7-8        | Unknown, not written by the system [eShop](eShop "wikilink") application service command code \*at\* \*all\*. |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This starts downloading the specified eShop title. The installation mode
for [NIMS:StartDownload](NIMS:StartDownload "wikilink") appears to be
automatically determined. See that page for further details.