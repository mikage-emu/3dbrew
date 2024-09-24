+++
title = 'DSP:GetPhysicalAddress'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00180040\] |
| 1          | Virtual address            |

# Response

| Index Word | Description      |
|------------|------------------|
| 0          | Header code      |
| 1          | Result code      |
| 2          | Physical address |