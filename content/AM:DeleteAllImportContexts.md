+++
title = 'AM:DeleteAllImportContexts'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x00150040\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This calls
[AM:DeleteAllImportContextsFiltered](AM:DeleteAllImportContextsFiltered "wikilink")
with filter 0xFFFFFFFF.