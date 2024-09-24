# Request

| Index Word | Description                                                            |
|------------|------------------------------------------------------------------------|
| 0          | Header code \[0x040E00C2\]                                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink")                 |
| 2          | Title count                                                            |
| 3          | u8, [Database](Title_Database "wikilink") (0 = title.db, 1 = tmp\*.db) |
| 4          | ((Title Count \* 8) \<\< 4) \| 0xA                                     |
| 5          | Title IDs Pointer                                                      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is the same as
[AMNet:CommitImportTitlesAndUpdateFirmwareAuto](AMNet:CommitImportTitlesAndUpdateFirmwareAuto "wikilink").