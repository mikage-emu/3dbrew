# Request

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | Header code \[0x00090082\]          |
| 1          | Ticket Count                        |
| 2          | Number of Tickets to Skip           |
| 3          | ((Ticket Count \* 8) \<\< 4) \| 0xC |
| 4          | Ticket Title IDs Output Pointer     |

# Response

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code                     |
| 1          | Result code                     |
| 2          | Number of Read Ticket Title IDs |