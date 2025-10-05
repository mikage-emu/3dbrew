+++
title = 'AM:GetProgramInfoFromCia'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x04080042\]                             |
| 1          | [Media Type](Filesystem_services#mediatype "wikilink") |
| 2          | 0x0 (Send-handle translate header)                     |
| 3          | File Handle                                            |

# Response

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code                               |
| 1          | Result code                               |
| 2-7        | [Title Info](AMNet:ListTitles "wikilink") |

# Description

This reads title information from a CIA file opened with [fs:USER](Filesystem_services "wikilink"). Depending on the media type, this will return different title sizes. Official applications use double the title size.
