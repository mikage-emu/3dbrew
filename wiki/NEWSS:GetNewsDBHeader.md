# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000A0042\] |
| 1          | Size                       |
| 2          | (Size\<\<4) \| 12          |
| 3          | Output buffer ptr          |

# Response

| Index Word | Description         |
|------------|---------------------|
| 0          | Header code         |
| 1          | Resultcode          |
| 2          | Actual copied size. |

# Description

This copies the header from the start of the news.db save-file in
news-module memory, to the output buffer. The max size is 0x10-bytes.