+++
title = 'AM:GetTicketLimitInfos'
+++

# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x00260044\]             |
| 1          | Ticket Count                           |
| 2          | ((Ticket Count \* 8) \<\< 4) \| 0xA    |
| 3          | Ticket Title IDs Input Pointer         |
| 4          | ((Ticket Count \* 0x10) \<\< 4) \| 0xC |
| 5          | Ticket Limit Infos Output Pointer      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Wraps [AMPXI:GetTicketLimitInfos](AMPXI:GetTicketLimitInfos "wikilink").
