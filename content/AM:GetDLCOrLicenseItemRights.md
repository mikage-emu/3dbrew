+++
title = 'AM:GetDLCOrLicenseItemRights'
+++

TID high value must be 0x0004008C (DLC) or 0x0004000D (License), otherwise 0xE0E0803C is returned.

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x100801C2\] |
| 1 | Rights Size |
| 2 | Rights type (valid values range from 1 to 6, including 1 and 6) |
| 3-4 | u64, Ticket Title ID |
| 5-6 | u64, Ticket ID |
| 7 | Offset |
| 8 | (Rights Size \<\< 4) \| 0xC |
| 9 | Rights Output Buffer |

# Response

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code                    |
| 1          | Result code                    |
| 2          | Total number of rights records |
| 3          | Next right records offset      |

# Description

Wraps [AMPXI:GetItemRights](AMPXI:GetItemRights "wikilink").
