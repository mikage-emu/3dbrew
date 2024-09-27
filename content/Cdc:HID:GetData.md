# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010000\] |

# Response

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x000100C0\]                      |
| 1          | Result code \[0xD8603BEF if no data available\] |
| 2          | Touchscreen data                                |
| 3          | Circle pad data                                 |