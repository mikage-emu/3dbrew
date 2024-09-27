# Request

| Index Word | Description                         |
|------------|-------------------------------------|
| 0          | Header code \[0x00140082\]          |
| 1          | HTTP context handle                 |
| 2          | Length of raw data passed in buffer |
| 3          | (BufferLength\<\<14) \| 0xC02       |
| 4          | Raw data pointer                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Passes the raw data from the buffer into the body of the HTTP POST
request.