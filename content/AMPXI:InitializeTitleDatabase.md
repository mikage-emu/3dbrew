+++
title = 'AMPXI:InitializeTitleDatabase'
+++

# Request

| Index Word | Description                                                        |
|------------|--------------------------------------------------------------------|
| 0          | Header code \[0x00470080\]                                         |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink") (must be SD) |
| 2          | u8, Overwrite (0 = don't overwrite, 1 = overwrite)                 |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00470040\] |
| 1          | Result code                |

# Description

This creates the /[dbs](Title_Database "wikilink") title.db and
import.db images, only media type "SD" is allowed.