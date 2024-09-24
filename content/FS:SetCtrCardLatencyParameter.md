+++
title = 'FS:SetCtrCardLatencyParameter'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x085C00C0\]                             |
| 1-2        | u64, Latency (milliseconds)                            |
| 3          | u8, 0 = don't emulate endurance, 1 = emulate endurance |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |