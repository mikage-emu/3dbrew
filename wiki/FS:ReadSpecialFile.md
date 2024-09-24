# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x084F0102\] |
| 1          | Must be 0x0.               |
| 2-3        | u64, File Offset           |
| 4          | Size                       |
| 5          | (Size \<\< 4) \| 0xC       |
| 6          | Data Pointer               |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | Total Read Data |