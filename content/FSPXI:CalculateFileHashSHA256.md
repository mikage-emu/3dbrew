# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090142\] |
| 1          | File handle lower word     |
| 2          | File handle upper word     |
| 3          | Size                       |
| 4          | (size \<\< 8) \| 4         |
| 5          | Output buffer              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | 4           |