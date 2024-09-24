# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0042\] |
| 1          | Size                       |
| 2          | (Size \<\< 8) \| 0x6       |
| 3          | Data pointer               |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0040\] |
| 1          | Result code                |