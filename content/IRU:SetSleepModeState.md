+++
title = 'IRU:SetSleepModeState'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00120040\] |
| 1          | u32 value                  |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

For input value 1, the I2C-IR IOState register bit0 is set to value 1,
and sleep-mode is enabling by setting IER register bit4(same register
pokes done when a data transfer ends). For input value 0, those register
bits are set to value 0 instead of 1(same register pokes done when a
data transfer starts). These register pokes are only done automatically
for data-transfer start/end when the value for
[IRU:SetSleepModeActive](IRU:SetSleepModeActive "wikilink") is value 1.