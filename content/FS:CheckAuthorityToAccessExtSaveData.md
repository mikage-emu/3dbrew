+++
title = 'FS:CheckAuthorityToAccessExtSaveData'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x083D0100\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Save ID                                           |
| 4          | Process ID                                             |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | u8, 0 = no access, 1 = has access |
