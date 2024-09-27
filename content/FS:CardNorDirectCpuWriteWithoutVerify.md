# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x082C0082\] |
| 1          | u32 address                |
| 2          | u32 Size                   |
| 3          | (Size\<\<6) \| 0xA         |
| 4          | Input buffer ptr           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |