+++
title = 'AM:GetStorageId'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x000600C0\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2-3        | u64, Storage ID |

# Description

This is an interface for
[AMPXI:GetTitleExtDataId](AMPXI:GetTitleExtDataId "wikilink").
