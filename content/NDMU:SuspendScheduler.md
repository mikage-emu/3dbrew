+++
title = 'NDMU:SuspendScheduler'
+++

# Request

| Index Word | Description                                        |
|------------|----------------------------------------------------|
| 0          | Header code \[0x00080040\]                         |
| 1          | 0 = Wait for completion, 1 = Perform in background |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
