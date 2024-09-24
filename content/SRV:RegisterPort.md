# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000600C2\] |
| 1-2        | 8-byte UTF-8 port name     |
| 3          | Name length                |
| 4          | 0x0                        |
| 5          | Client port handle         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |