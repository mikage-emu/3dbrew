+++
title = 'AMPXI:IsImportDatabaseInitialized'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x003F0040\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x003F0080\] |
| 1          | Result code                |
| 2          | u8, isInitialized?         |

# Description

This checks whether /dbs/import.db exists (or is initialized) on the
media indicated by the specified [Media
Type](Filesystem_services#MediaType "wikilink").

The output u8 remains 0 if import.db exists.

[Media Type](Filesystem_services#MediaType "wikilink") must be either SD
or NAND. If Game Card is specified, this will always return 0xD8C0801E
and set the output u8 to 2 (not supported).

Additionally, 0xE0A046DF is returned if import.db does not exist on the
media.
