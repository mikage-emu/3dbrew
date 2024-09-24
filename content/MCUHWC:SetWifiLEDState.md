+++
title = 'MCUHWC:SetWifiLEDState'
+++

# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x00070040\]  |
| 1          | LED state (0 = off, 1 = on) |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is used for controlling the WiFi LED.
