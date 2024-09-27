# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00150082\] |
| 1          | SSL context handle         |
| 2          | Size                       |
| 3          | (Size\<\<4) \| 12          |
| 4          | Pointer to output data     |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Result code         |
| 2          | Total received data |

# Description

This receives data from the SSL connection into the specified output
buffer.