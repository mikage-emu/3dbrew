+++
title = 'FS:GetArchiveResource'
+++

# Request

| Index Word | Description                                                         |
|------------|---------------------------------------------------------------------|
| 0          | Header code \[0x08490040\]                                          |
| 1          | [System Media Type](Filesystem_services#systemmediatype "wikilink") |

# Response

| Index Word | Description                                                        |
|------------|--------------------------------------------------------------------|
| 0          | Header code                                                        |
| 1          | Result code                                                        |
| 2-5        | [Archive Resource](Filesystem_services#archiveresource "wikilink") |
