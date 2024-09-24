+++
title = 'AMPXI:GetPendingTitleCount'
+++

# Request

| Index Word | Description                                                                   |
|------------|-------------------------------------------------------------------------------|
| 0          | Header code \[0x001D0080\]                                                    |
| 1          | [MediaType](Filesystem_services#MediaType "wikilink")                         |
| 2          | Status mask (bit0 = include installing, bit1 = include awaiting finalization) |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001D0080\] |
| 1          | Result code                |
| 2          | Pending title count        |

# Description

Gets the number of titles that are currently pending installation.
