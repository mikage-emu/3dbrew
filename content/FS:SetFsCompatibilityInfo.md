+++
title = 'FS:SetFsCompatibilityInfo'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x085D01C0\]                             |
| 1-2        | u64, Title ID                                          |
| 3          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 4          | Unknown                                                |
| 5          | Unknown                                                |
| 6          | Unknown                                                |
| 7          | Unknown                                                |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
