+++
title = 'AMPXI:IsDataTitleInUse'
+++

# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x006900C0\]                            |
| 1          | [MediaType](Filesystem_services#mediatype "wikilink") |
| 2-3        | u64, Title ID                                         |

# Response

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x00690080\]              |
| 1          | Result code                             |
| 2          | u8, In use (0 = not in use, 1 = in use) |

# Description

Returns whether or not the given title is currently opened for access at least once.
