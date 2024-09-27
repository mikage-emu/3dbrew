# Request

| Index Word | Description                                                            |
|------------|------------------------------------------------------------------------|
| 0          | Header code \[0x08040100\]                                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink")                 |
| 2-3        | u64, Title ID                                                          |
| 4          | u8, [Database](Title_Database "wikilink") (0 = title.db, 1 = tmp\*.db) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |