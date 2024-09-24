# Request

| Index Word | Description                                |
|------------|--------------------------------------------|
| 0          | Header code \[0x080D0042\]                 |
| 1          | Content Index Count                        |
| 2          | ((Content Index Count \* 2) \<\< 4) \| 0xA |
| 3          | u16\*, Content Indices Input Buffer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |