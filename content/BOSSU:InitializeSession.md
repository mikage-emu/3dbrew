+++
title = 'BOSSU:InitializeSession'
+++

# Request

| Index Word | Description                                                                                                                    |
|------------|--------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00010082\]                                                                                                     |
| 1-2        | programID, normally zero for using the programID determined from the below input PID. Only used with BOSSP, unused with BOSSU. |
| 3          | 0x20, ARM11-kernel processID translate-header.                                                                                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
