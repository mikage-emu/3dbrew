+++
title = 'AM:IsDLCTitleInUse'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x100900C0\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description  |
|------------|--------------|
| 0          | Header code  |
| 1          | Result code  |
| 2          | bool, In Use |

# Description

Returns whether or not the given DLC title is currently open for access at least once.
