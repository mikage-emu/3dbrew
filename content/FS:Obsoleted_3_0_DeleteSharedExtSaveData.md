# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x08360080\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2          | Save ID Low                                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This has been obsoleted. It now wraps around the new
[FS:DeleteExtSaveData](FS:DeleteExtSaveData "wikilink"). The Save ID
High value is fixed to 0x00048000 (shared).