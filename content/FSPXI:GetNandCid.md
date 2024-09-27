# Request

| Index Word | Description                                        |
|------------|----------------------------------------------------|
| 0          | Header code \[0x001F0042\]                         |
| 1          | Output CID size (always 0x10)                      |
| 2          | Always 0x00001004, for 0x10 size: (size\<\<8) \| 4 |
| 3          | Output 0x10-byte CID pointer                       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |