# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001E0042\] |
| 1          | TaskID buffer size         |
| 2          | (Size \<\< 4) \| 0xA       |
| 3          | TaskID data pointer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |