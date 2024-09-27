+++
title = 'AMPXI:GetItemRights'
+++

# Request

| Index Word | Description                                                             |
|------------|-------------------------------------------------------------------------|
| 0          | Header code \[0x006801C2\]                                              |
| 1          | Rights Size                                                             |
| 2          | Enum value (unknown, valid values range from 1 to 6, including 1 and 6) |
| 3-4        | u64, Ticket Title ID                                                    |
| 5-6        | u64, Ticket ID                                                          |
| 7          | Offset                                                                  |
| 8          | (Rights Size \<\< 8) \| 0x4                                             |
| 9          | Rights Output Buffer                                                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | ?           |
| 3          | ?           |
