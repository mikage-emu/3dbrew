+++
title = 'AMPXI:IsImportDatabaseInitialized'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x003F0040\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x003F0080\] |
| 1          | Result code                |
| 2          | u8, isInitialized?         |

# Description

Returns whether cleanup is required. In general, this checks the import.db for the specified media type. If any entries are found that are marked as fully installed (not pending), this returns true.

However, for NAND, this first checks whether a) `nand:/data` contains more than one file/directory, and b) whether `nand:/data/`<ID0> exists. If either of these conditions are met, this returns true without further checking the NAND import database.
