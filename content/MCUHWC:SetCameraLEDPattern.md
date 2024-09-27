+++
title = 'MCUHWC:SetCameraLEDPattern'
+++

# Request

| Index Word | Description                                                                                                   |
|------------|---------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00080040\]                                                                                    |
| 1          | LED state (0 = off, 1 = slowly blinking, 2 = on, 3 = "TWL" mode, 4 = flash once, 5 = delay before turning on) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is used for controlling the camera LED.