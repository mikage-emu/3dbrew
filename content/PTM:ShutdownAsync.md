# Request

| Index Word | Description                      |
|------------|----------------------------------|
| 0          | Header code \[0x040700C0\]       |
| 1          | 0 ?                              |
| 2-3        | u64 timeout value in nanoseconds |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |