+++
title = 'DSP:WriteReg0x10'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00070040\] |
| 1          | towrite (hword)            |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Resultcode  |