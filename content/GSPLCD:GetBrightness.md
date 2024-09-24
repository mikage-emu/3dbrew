+++
title = 'GSPLCD:GetBrightness'
+++

# Request

| Index Word | Description                        |
|------------|------------------------------------|
| 0          | Header code \[0x00150040\]         |
| 1          | Screen index (top = 1, bottom = 2) |

# Response

| Index Word | Description       |
|------------|-------------------|
| 0          | Header code       |
| 1          | Result code       |
| 2          | Screen brightness |

# Description

Gets the current brightness of the given screen. Screen brightness
values can range between 0x10 and 0xAC, inclusively.
