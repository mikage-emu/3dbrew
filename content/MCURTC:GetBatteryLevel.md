+++
title = 'MCURTC:GetBatteryLevel'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x002D0000\] |

# Response

| Index Word | Description             |
|------------|-------------------------|
| 0          | Header code             |
| 1          | Result code             |
| 2          | u8 output battery level |

# Description

This reads the battery level from [I2C](I2C "wikilink") MCU register
0xB, via [I2CMCU](I2C_Services "wikilink") service command 0x000D00C0.
