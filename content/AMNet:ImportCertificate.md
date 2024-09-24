# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x081A0042\]       |
| 1          | Certificate Size                 |
| 2          | (Certificate Size \<\< 4) \| 0xA |
| 3          | Certificate Input Pointer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |