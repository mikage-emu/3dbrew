+++
title = 'IRRST:GetHandles'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00010000\] |

# Response

| Index Word | Description                                                    |
|------------|----------------------------------------------------------------|
| 0          | Header code \[0x00010043\]                                     |
| 1          | Result code                                                    |
| 2          | 0x4000000, translate-header used by ARM11-kernel.              |
| 3          | Output [shared-memory](IRRST_Shared_Memory "wikilink") handle. |
| 4          | Output event handle.                                           |