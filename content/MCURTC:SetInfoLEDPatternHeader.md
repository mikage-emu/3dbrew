+++
title = 'MCURTC:SetInfoLEDPatternHeader'
+++

# Request

| Index Word | Description                                                |
|------------|------------------------------------------------------------|
| 0          | Header code \[0x003C0040\]                                 |
| 1          | [Animation](MCURTC:SetInfoLEDPattern#Animation "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is used for controlling the notification LED. This uses
[I2CMCU](I2C_Services "wikilink") service command 0x000B00C2 to write
the input 4-byte data to [I2C](I2C "wikilink") MCU register 0x2D.