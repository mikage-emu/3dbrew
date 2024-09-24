TID high value must be 0x0004008C (DLC) or 0x0004000D (License),
otherwise 0xE0E0803C is returned.

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x10060080\] |
| 1-2        | u64, Title ID              |

# Response

| Index Word | Description                   |
|------------|-------------------------------|
| 0          | Header code                   |
| 1          | Result code                   |
| 2          | Number of DLC/License Tickets |