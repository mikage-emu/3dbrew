# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00080000\] |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |
| 2          | bool flag   |

# Description

See
[MCUNWM:SetWirelessDisabledFlag](MCUNWM:SetWirelessDisabledFlag "wikilink").

This returns whether the WirelessDisabled bit is set, in the MCU
system-state buffer.