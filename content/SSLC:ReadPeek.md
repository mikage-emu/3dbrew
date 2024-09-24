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

Same as [SSLC:Read](SSLC:Read "wikilink"), except with the equivalent of
the recv() MSG_PEEK flag.