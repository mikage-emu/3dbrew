+++
title = 'FS:Obsoleted 3 0 CreateSharedExtSaveData'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x08310180\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Save ID                                           |
| 4          | Number of Directories                                  |
| 5          | Number of Files                                        |
| 6          | Size Limit                                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This has been obsoleted. It now wraps around the new
[FS:CreateExtSaveData](FS:CreateExtSaveData "wikilink").
