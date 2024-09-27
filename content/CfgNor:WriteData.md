# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00060082\] |
| 1          | Offset                     |
| 2          | Size                       |
| 3          | (Size\<\<4) \| 10          |
| 4          | Input buffer ptr           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |