+++
title = 'AMPXI:GetTicketLimitInfos'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x00620044\]              |
| 1          | Ticket Count                            |
| 2          | ((Ticket Count \* 8) \<\< 8) \| 0x4     |
| 3          | Ticket Title IDs Input Pointer          |
| 4          | ((Ticket Count \* 0x10) \<\< 8) \| 0x14 |
| 5          | Ticket Limit Infos Output Pointer       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
