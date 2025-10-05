+++
title = 'AMPXI:DoCleanup'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x00400040\]                            |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink") |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00400040\] |
| 1          | Result code                |

# Description

Used by [AM:DoCleanup](AM:DoCleanup "wikilink").

This command checks the import.db on the specified media. All titles in the import.db that are not marked as pending (i.e. fully installed but not transferred to title.db) are deleted using the same internal code [AMPXI:DeleteTitle](AMPXI:DeleteTitle "wikilink") uses.

For NAND, in addition to the above, the first thing this command does is recursively removing all directories under `nand:/data` that don't match the system ID0 (that is, all directories that are not `nand:/data/`<ID0>. This deletion step, however, is not performed if a file exists at `nand:/data/disabled`.
