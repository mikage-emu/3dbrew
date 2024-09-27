+++
title = 'AMPXI:InstallTitleBeginForOverwrite'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x006C00C0\]                            |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                         |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x006C0040\] |
| 1          | Result code                |
