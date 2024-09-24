+++
title = 'IRU:StartSendTransfer'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00030042\] |
| 1          | Data size                  |
| 2          | (Size\<\<8) \| 10          |
| 3          | Data Pointer               |

# Response

| Index Word | Description       |
|------------|-------------------|
| 0          | Header code       |
| 1          | Result code       |
| 2          | (Size\<\<8) \| 10 |
| 3          | Data Pointer      |

# Description

This starts an IR send transfer, this command is non-blocking.