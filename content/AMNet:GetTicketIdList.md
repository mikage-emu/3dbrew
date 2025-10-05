+++
title = 'AMNet:GetTicketIdList'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x081E0102\] |
| 1 | Ticket ID Count |
| 2-3 | u64, Ticket Title ID |
| 4 | bool, whether or not to verify the tickets as they're being read |
| 5 | ((Ticket ID Count \* 8) \<\< 4) \| 0xC |
| 6 | Ticket IDs Output Pointer |

# Response

| Index Word | Description               |
|------------|---------------------------|
| 0          | Header code               |
| 1          | Result code               |
| 2          | Number of Read Ticket IDs |

Wraps [AMPXI:GetTicketIdList](AMPXI:GetTicketIdList "wikilink").
