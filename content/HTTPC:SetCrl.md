# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x003B0082\] |
| 1          | HTTP context handle        |
| 2          | Crl buffer size            |
| 4          | (Size\<\<4) \| 10          |
| 5          | Pointer to Crl data        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |