+++
title = 'AM:GetNumImportContentContexts'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x000F00C0\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | Number of Import Content Contexts |

# Description

Wraps
[AMPXI:GetNumImportContentContexts](AMPXI:GetNumImportContentContexts "wikilink").