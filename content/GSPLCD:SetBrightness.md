+++
title = 'GSPLCD:SetBrightness'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x000B0080\]         |
| 1          | Screen index (top = 1, bottom = 2) |
| 2          | Brightness level (1 - 5)           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Sets the brightness of the given screen. The function will automatically
cap the brightness level between 1 and 5, inclusive. This function
behaves exactly like the brightness selector in the Home Menu, except
that the brightness switch on the Home Menu remains at the same position
regardless of the actual brightness level.