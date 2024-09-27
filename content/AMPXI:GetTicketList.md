+++
title = 'AMPXI:GetTicketList'
+++

# Request

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x000F0082\]      |
| 1          | Title count                     |
| 2          | Offset                          |
| 3          | (TitleCount \* 8) \<\< 8 \| 0x4 |
| 4          | Title IDs pointer               |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000F0080\] |
| 1          | Result code                |
| 2          | Total tickets retrieved    |
