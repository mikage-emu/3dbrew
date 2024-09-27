+++
title = 'MCURTC:GetLegacyJumpProhibitedFlag'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x005A0000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | bool flag   |

# Description

See
[MCURTC:SetLegacyJumpProhibitedFlag](MCURTC:SetLegacyJumpProhibitedFlag "wikilink").

This returns whether the LegacyJumpProhibited bit is set, in the MCU
system-state buffer.