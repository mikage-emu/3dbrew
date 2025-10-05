+++
title = 'AMPXI:DeleteAllExpiredUserPrograms'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00520040\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Deletes all non-system titles (whether CTR or TWL) for which there are currently no tickets installed.
