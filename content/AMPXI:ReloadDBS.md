+++
title = 'AMPXI:ReloadDBS'
+++

# Request

| Index Word | Description                                                        |
|------------|--------------------------------------------------------------------|
| 0          | Header code \[0x00480040\]                                         |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink") (must be SD) |

# Response

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[0x00480080\]                        |
| 1          | Result code                                       |
| 2          | u8, Availability (0 = unavailable, 1 = available) |

# Description

This reloads the /[dbs](Title_Database "wikilink") .db images into
memory, specifically the SD card title.db and import.db.
