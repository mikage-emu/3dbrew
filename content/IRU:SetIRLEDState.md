+++
title = 'IRU:SetIRLEDState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x000B0040\] |
| 1          | u32 value                  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

Value 1 enables the IR LED, while value 0 disables it. Note that the IR
LED will automatically turn off after a certain amount of time if left
on this way, however to turn it back on the state has to be set to value
zero first. This is set via a GPIO service command, the GPIO module then
does the following: it writes 0x10 to 0x10147020 (0x1EC47020 in process
space) to enable the LED, and clears that bit to disable it.
