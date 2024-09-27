+++
title = 'AM:ListDLCOrLicenseTicketInfos'
+++

TID high value must be either 0x0004008C (DLC) or 0x0004000D (License),
otherwise error 0xE0E0803C is returned.

# Request

| Index Word | Description                                                                       |
|------------|-----------------------------------------------------------------------------------|
| 0          | Header code \[0x10070102\]                                                        |
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
| 2          | Number of Ticket Infos Read |
