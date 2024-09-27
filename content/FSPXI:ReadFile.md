# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090142\] |
| 1          | File handle lower word     |
| 2          | File handle upper word     |
| 3          | Offset lower word          |
| 4          | Offset upper word          |
| 5          | Size                       |
| 6          | (size \<\< 8) \| 4         |
| 7          | Output buffer              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | Size read   |
| 3          | 4           |