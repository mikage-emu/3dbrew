+++
title = 'MCURTC:SetRTCAlarm'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00130080\] |
| 1-2        | u8 \[5\] param             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This sets the RTC alarm register on the MCU device.