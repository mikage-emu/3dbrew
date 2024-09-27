+++
title = 'AMPXI:GetNumTicketsOfProgram'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x005F0080\] |
| 1-2        | u64, Title ID              |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x005F0080\] |
| 1          | Result code                |
| 2          | Number of Tickets          |