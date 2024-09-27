# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000C0082\] |
| 1          | TaskID buffer size         |
| 2          | ?                          |
| 3          | (Size \<\< 4) \| 0xA       |
| 4          | TaskID data pointer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |