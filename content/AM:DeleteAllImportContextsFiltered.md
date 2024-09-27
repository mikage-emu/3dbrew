+++
title = 'AM:DeleteAllImportContextsFiltered'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x00220080\]                              |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink")  |
| 2          | Filter (bit0 = non-system titles, bit1 = system titles) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
