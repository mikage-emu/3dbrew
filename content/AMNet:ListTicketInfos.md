+++
title = 'AMNet:ListTicketInfos'
+++

# Request

| Index Word | Description                                                                       |
|------------|-----------------------------------------------------------------------------------|
| 0          | Header code \[0x08200102\]                                                        |
| 1          | Ticket Count                                                                      |
| 2-3        | u64, Title ID                                                                     |
| 4          | Offset                                                                            |
| 5          | ((Ticket Count \* 0x18) \<\< 4) \| 0xC                                            |
| 6          | [Ticket Infos](Application_Manager_Services#ticketinfo "wikilink") Output Pointer |

# Response

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code                 |
| 1          | Result code                 |
| 2          | Number of Read Ticket Infos |
