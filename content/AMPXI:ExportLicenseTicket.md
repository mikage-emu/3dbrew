+++
title = 'AMPXI:ExportLicenseTicket'
+++

TID high value must be 0x0004000D, otherwise this will return
0xE0E0803C.

# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x00610142\]       |
| 1          | Ticket Data Size                 |
| 2-3        | u64, Ticket Title ID             |
| 4-5        | u64, Ticket ID                   |
| 6          | (Ticket Data Size \<\< 8) \| 0x4 |
| 7          | Ticket Data Output Pointer       |

# Response

| Index Word | Description             |
|------------|-------------------------|
| 0          | Header code             |
| 1          | Result code             |
| 2          | Actual Ticket Data Size |