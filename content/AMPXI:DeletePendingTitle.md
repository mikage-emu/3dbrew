+++
title = 'AMPXI:DeletePendingTitle'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x002000C0\]                            |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                         |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00200040\] |
| 1          | Result code                |