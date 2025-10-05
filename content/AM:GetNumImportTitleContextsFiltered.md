+++
title = 'AM:GetNumImportTitleContextsFiltered'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x00230080\] |
| 1 | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2 | Filter (bit0 = include user titles, bit1 = include system titles) |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code                     |
| 1          | Result code                     |
| 2          | Number of Import Title Contexts |
