+++
title = 'BOSSU:StartTaskImmediate'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x001D0042\] |
| 1          | TaskID buffer size         |
| 2          | (Size \<\< 4) \| 0xA       |
| 3          | TaskID data pointer        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Doesn't seem to really "start" the specified task immediately, with
"normal" tasks at least.
