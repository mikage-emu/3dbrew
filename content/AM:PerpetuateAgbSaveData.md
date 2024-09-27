+++
title = 'AM:PerpetuateAgbSaveData'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x041700C0\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is abstraction for
[AMPXI:MigrateAGBtoSAV](AMPXI:MigrateAGBtoSAV "wikilink").

This is called by [NS](NS "wikilink") when
[PREV_FIRM](Configuration_Memory "wikilink") (derived from
[CFG_BOOTENV](CONFIG_Registers#cfg_bootenv "wikilink")) is AGB.
