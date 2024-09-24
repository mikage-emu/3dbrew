# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x081A0042\]     |
| 1          | Buffer Length (should be 0x10) |
| 2          | (bufferLength \<\< 4) \| 0xC   |
| 3          | void\* Buffer                  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |