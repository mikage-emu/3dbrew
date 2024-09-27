# Request

| Index Word | Description                                          |
|------------|------------------------------------------------------|
| 0          | Header code \[0x001100C4\]                           |
| 1          | HTTP context handle                                  |
| 2          | Header name buffer size, including null-terminator.  |
| 3          | Header value buffer size, including null-terminator. |
| 4          | (HeaderNameSize\<\<14) \| 0xC02                      |
| 5          | Header name data pointer                             |
| 6          | (HeaderValueSize\<\<4) \| 10                         |
| 7          | Header value data pointer                            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |