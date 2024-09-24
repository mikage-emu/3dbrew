+++
title = 'DSP:SetSemaphore'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070040\] |
| 1          | u16, Semaphore value       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |