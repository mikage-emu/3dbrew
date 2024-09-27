+++
title = 'MCURTC:GetSoftwareClosedFlag'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00520000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | bool flag   |

# Description

See
[MCURTC:SetSoftwareClosedFlag](MCURTC:SetSoftwareClosedFlag "wikilink").

This returns whether the SoftwareClosed bit is set, in the MCU
system-state buffer.