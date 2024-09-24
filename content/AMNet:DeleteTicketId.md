+++
title = 'AMNet:DeleteTicketId'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x081C0100\] |
| 1-2        | u64, Ticket Title ID       |
| 3-4        | u64, Ticket ID             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wraps [AMPXI:DeleteTicketId](AMPXI:DeleteTicketId "wikilink").
