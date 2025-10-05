+++
title = 'AMPXI:GetNumExistingContentInfos'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x006A00C0\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code                      |
| 1          | Result code                      |
| 2          | Number of Existing Content Infos |

# Description

Reads the number of existing (installed) contents for a given title from the [content metadata (CMD)](Titles#data_structure "wikilink").
