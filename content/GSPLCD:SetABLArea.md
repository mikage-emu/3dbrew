+++
title = 'GSPLCD:SetABLArea'
+++

# Request

| Index Word | Description                            |
|------------|----------------------------------------|
| 0          | Header code \[0x00050140\]             |
| 1          | Screen (1 = top, 2 = bottom, 3 = both) |
| 2          | X offset                               |
| 3          | Width                                  |
| 4          | Y offset                               |
| 5          | Height                                 |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Sets the area for ABL.
