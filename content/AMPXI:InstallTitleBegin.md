+++
title = 'AMPXI:InstallTitleBegin'
+++

# Request

| Index Word | Description                                                              |
|------------|--------------------------------------------------------------------------|
| 0          | Header code \[0x00100100\]                                               |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink")                    |
| 2-3        | u64, Title ID                                                            |
| 4          | (u8) [Database](Title_Database "wikilink") type, 0 = TitleDB, 1 = TempDB |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00100040\] |
| 1          | Result code                |
