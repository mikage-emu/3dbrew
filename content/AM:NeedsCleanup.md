+++
title = 'AM:NeedsCleanup'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00130040\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2          | bool, Needs Cleanup |
