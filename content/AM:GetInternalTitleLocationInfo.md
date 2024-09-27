+++
title = 'AM:GetInternalTitleLocationInfo'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x041600C0\]                             |
| 1          | [Media Type](Filesystem_services#MediaType "wikilink") |
| 2-3        | u64, Title ID                                          |

# Response

| Index Word | Description                  |
|------------|------------------------------|
| 0          | Header code                  |
| 1          | Result code                  |
| 2-9        | Internal Title Location Info |

# Description

Wraps
[AMPXI:GetInternalTitleLocationInfo](AMPXI:GetInternalTitleLocationInfo "wikilink").