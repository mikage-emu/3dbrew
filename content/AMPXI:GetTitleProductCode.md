+++
title = 'AMPXI:GetTitleProductCode'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x000500C0\]                            |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                         |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00050140\] |
| 1          | Result code                |
| 2-5        | Product code               |
