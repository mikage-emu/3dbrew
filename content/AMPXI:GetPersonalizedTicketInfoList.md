+++
title = 'AMPXI:GetPersonalizedTicketInfoList'
+++

# Request

| Index Word | Description |
|----|----|
| 0 | Header code \[0x004C0042\] |
| 1 | Ticket Count |
| 2 | ((Ticket Count \* 0x18) \<\< 8) \| 0x4 |
| 3 | [Ticket Infos](Application_Manager_Services#ticketinfo "wikilink") Output Pointer |

# Response

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code                 |
| 1          | Result code                 |
| 2          | Number of Read Ticket Infos |

# Description

Returns [Ticket Info](Application_Manager_Services#ticketinfo "wikilink") structures for user titles (excluding CTR or TWL system titles, and also DLP child titles). In addition, the ticket console ID is checked and tickets with a console ID = 0 (meaning Common ETickets, for system titles, or preinstalls) are skipped.
