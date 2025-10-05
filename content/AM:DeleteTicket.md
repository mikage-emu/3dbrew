+++
title = 'AM:DeleteTicket'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070080\] |
| 1-2        | u64, Ticket Title ID       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Deletes all tickets for a specific title.
