+++
title = 'MCURTC:SetBatteryEmptyLEDPattern'
+++

# Request

| Index Word | Description                                                                                                                                                                                                                                                                   |
|------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00420040\]                                                                                                                                                                                                                                                    |
| 1          | 4 bytes of animation sequence. Read in the order they were sent, but their bits are read backwards to create the sequence (said sequence is read both on the power LED and the notification LED). 1 = On, 0 = Off, there is no way to change the color with this service call |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is used for controlling the notification LED when the power is
below 5%. The changes made with this service call are immediate (doesn't
need a console reboot, the new sequence will be read after the current
sequence finishes a loop) and "permanent" (they will stay upon reboot,
but they can be changed again with another call) To reset to default,
you can send the byte 0x55 4 times (corresponds to the following bits :
01010101, which read backwards makes a simple blinking LED sequence)