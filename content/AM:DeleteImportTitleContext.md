+++
title = 'AM:DeleteImportTitleContext'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x000E00C0\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E0040\] |
| 1          | Result code                |