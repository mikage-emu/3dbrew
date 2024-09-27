+++
title = 'FS:Obsoleted 3 0 GetExtDataBlockSize'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x083F00C0\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Save ID                                           |

# Response

| Index Word | Description           |
|------------|-----------------------|
| 0          | Header code           |
| 1          | Result code           |
| 2-3        | u64, Total Blocks     |
| 4-5        | u64, Remaining Blocks |
| 6          | Block Size            |

# Description

This has been obsoleted. It now wraps around the new
[FS:GetExtDataBlockSize](FS:GetExtDataBlockSize "wikilink").
