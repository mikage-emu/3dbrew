# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x00170044\]  |
| 1          | Buffer Size                 |
| 2          | 0x10                        |
| 3          | Handle                      |
| 4          | (Buffer Size \<\< 4) \| 0xC |
| 5          | Buffer Pointer              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |