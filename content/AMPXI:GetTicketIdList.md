+++
title = 'AMPXI:GetTicketIdList'
+++

# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x004A0102\]             |
| 1          | Ticket ID Count                        |
| 2-3        | u64, Ticket Title ID                   |
| 4          | bool, ?                                |
| 5          | ((Ticket ID Count \* 8) \<\< 8) \| 0x4 |
| 6          | Ticket IDs Output Pointer              |

# Response

| Index Word | Description               |
|------------|---------------------------|
| 0          | Header code               |
| 1          | Result code               |
| 2          | Number of Read Ticket IDs |
