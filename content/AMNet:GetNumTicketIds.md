# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x081D0080\] |
| 1-2        | u64, Ticket Title ID       |

# Response

| Index Word | Description          |
|------------|----------------------|
| 0          | Header code          |
| 1          | Result code          |
| 2          | Number of Ticket IDs |

# Description

Wraps [AMPXI:GetNumTicketIds](AMPXI:GetNumTicketIds "wikilink").