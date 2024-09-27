+++
title = 'AM:InitializeTitleDatabase'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00180080\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2          | bool, Overwrite                                        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is abstraction for
[AMPXI:InitializeTitleDatabase](AMPXI:InitializeTitleDatabase "wikilink").
