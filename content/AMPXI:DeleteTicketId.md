+++
title = 'AMPXI:DeleteTicketId'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x004B0100\] |
| 1-2        | u64, Ticket Title ID       |
| 3-4        | u64, Ticket ID             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is similar to [AMPXI:DeleteTicket](AMPXI:DeleteTicket "wikilink") except that this variant targets a specific ticket ID, rather than all tickets.
