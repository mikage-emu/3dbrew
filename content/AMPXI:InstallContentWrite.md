+++
title = 'AMPXI:InstallContentWrite'
+++

# Request

| Index Word | Description                    |
|------------|--------------------------------|
| 0          | Header code \[0x00180042\]     |
| 1          | Content chunk size             |
| 2          | (ContentChunkSize \<\< 8) \| 6 |
| 3          | Chunk data input pointer       |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00180040\] |
| 1          | Result code                |

# Content Chunk Data

The content chunk data is the content downloaded from the Nintendo NUS
distribution server, in chunks of 16KB or less.