+++
title = 'MCURTC:GetRTCAlarm'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00140000\] |

# Response

| Index Word | Description    |
|------------|----------------|
| 0          | Header code    |
| 1          | Result code    |
| 2-3        | u8 \[5\] param |

# Description

This reads the RTC alarm registers from the MCU device.