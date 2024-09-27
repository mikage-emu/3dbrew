+++
title = 'AM:GetPersonalizedTicketInfoList'
+++

# Request

| Index Word | Description                                                                       |
|------------|-----------------------------------------------------------------------------------|
| 0          | Header code \[0x00210042\]                                                        |
| 1          | Ticket Count                                                                      |
| 2          | ((Ticket Count \* 0x18) \<\< 4) \| 0xC                                            |
| 3          | [Ticket Infos](Application_Manager_Services#ticketinfo "wikilink") Output Pointer |

# Response

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code                 |
| 1          | Result code                 |
| 2          | Number of Read Ticket Infos |

# Description

Wraps
[AMPXI:GetPersonalizedTicketInfoList](AMPXI:GetPersonalizedTicketInfoList "wikilink").
