+++
title = 'FS:GetSpecialContentIndex'
+++

# Request

| Index Word | Description                                                               |
|------------|---------------------------------------------------------------------------|
| 0          | Header code \[0x083A0100\]                                                |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink")                    |
| 2-3        | u64, Program ID                                                           |
| 4          | [Special Content Type](Filesystem_services#SpecialContentType "wikilink") |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code                |
| 1          | Result code                |
| 2          | u16, Special Content Index |