# Request

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code \[0x000D0146\]        |
| 1          | HTTP context handle               |
| 2          | Proxy Length                      |
| 3          | u16, Port                         |
| 4          | Username Length                   |
| 5          | Password Length                   |
| 6          | (proxyLength \<\< 14) \| 0x2      |
| 7          | char\* Proxy                      |
| 8          | (usernameLength \<\< 14) \| 0x402 |
| 9          | char\* Username                   |
| 10         | (passwordLength \<\< 14) \| 0x802 |
| 11         | char\* Password                   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |