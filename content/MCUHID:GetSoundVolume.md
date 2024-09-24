+++
title = 'MCUHID:GetSoundVolume'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000E0000\] |

# Response

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code                       |
| 1          | Result code                       |
| 2          | u8 output [value](I2C "wikilink") |

# Description

This reads the u8 value from [I2C](I2C "wikilink") MCU register 0x09,
via [I2CMCU](I2C_Services "wikilink") service command 0x000D00C0.
