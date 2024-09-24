+++
title = 'AM:DoCleanup'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00140040\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is about the same as
[AMNet:InstallTitlesFinish](AMNet:InstallTitlesFinish "wikilink"),
except the title ID list used here is every title which needs to have
installation finalized.

This is a wrapper for
[AMPXI:FinalizePendingTitles](AMPXI:FinalizePendingTitles "wikilink").
