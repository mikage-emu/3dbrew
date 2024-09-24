+++
title = 'GSPGPU:SetLcdForceBlack'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0040\] |
| 1          | u8 Black color fill flag   |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

When the input flag is non-zero, [REG_LCDCOLORFILL](LCD "wikilink") for
both LCDs is enabled with color black, otherwise when this flag is zero
this color fill is disabled.