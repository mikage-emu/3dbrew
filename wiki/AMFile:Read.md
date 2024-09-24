# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x080200C2\] |
| 1          | File offset lower word     |
| 2          | File offset upper word     |
| 3          | Size                       |
| 4          | (Size\<\<4) \| 12          |
| 5          | Data ptr                   |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Resultcode      |
| 2          | Total read data |