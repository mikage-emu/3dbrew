+++
title = 'MCUHWC:SetPowerLEDPattern'
+++

# Request

| Index Word | Description                                                                                                                                          |
|------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00060040\]                                                                                                                           |
| 1          | LED state (0 = auto mode, 1 = forced default "on" mode, 2 = sleep mode, 3 = off, 4 = forced red, 5 = foreced blue, 6 = blinking "battery empty" red) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is used for controlling the power LED. Please note, that modes 2,
4, and 5 aren't affected by LED dimming, and will be at full brightness.
Modes 0 and 1 are affected by LED dimming. Mode 3 isn't affected, since
the LED is powered off regardless of any other setting.