+++
title = 'PTM:GetStepHistory'
+++

# Request

| Index Word | Description                             |
|------------|-----------------------------------------|
| 0          | Header code \[0x000B00C2\]              |
| 1          | Number of hours                         |
| 2-3        | DateTime start of (3ds date from 2000y) |
| 4          | Translated size of output buffer        |
| 5          | short\* buffer for number of hours      |