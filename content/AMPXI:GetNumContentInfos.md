+++
title = 'AMPXI:GetNumContentInfos'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x005800C0\]                            |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                         |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00580080\] |
| 1          | Result code                |
| 2          | Content count              |
