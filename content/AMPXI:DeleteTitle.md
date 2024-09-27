+++
title = 'AMPXI:DeleteTitle'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x000400C0\]                            |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                         |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00040040\] |
| 1          | Result code                |

# Description

This deletes the directory under /title for the specified title. Nothing
under [/dbs](Title_Database "wikilink") is deleted for the the title,
except for the data stored in import.db for the title possibly.