# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00170082\] |
| 1          | SSL context handle         |
| 2          | Size                       |
| 3          | (Size\<\<4) \| 10          |
| 4          | Pointer to input data      |

# Response

| Index Word | Description     |
|------------|-----------------|
| 0          | Header code     |
| 1          | Result code     |
| 2          | Total sent data |

# Description

This sends the specified data over the SSL connection.