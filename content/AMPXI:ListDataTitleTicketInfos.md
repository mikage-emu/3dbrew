+++
title = 'AMPXI:ListDataTitleTicketInfos'
+++

# Request

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code \[0x00600102\]        |
| 1          | Ticket count                      |
| 2-3        | u64, Title ID                     |
| 4          | Start Index?                      |
| 5          | (TicketCount \* 24) \<\< 8 \| 0x4 |
| 6          | Ticket Infos pointer              |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x00600080\]      |
| 1          | Result code                     |
| 2          | Number of ticket infos returned |

# Ticket Info

Size: 0x18