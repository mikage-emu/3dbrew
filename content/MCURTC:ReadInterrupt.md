+++
title = 'MCURTC:ReadInterrupt'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x004D0000\] |

# Response

| Index Word | Description                                         |
|------------|-----------------------------------------------------|
| 0          | Header code                                         |
| 1          | Result code                                         |
| 2          | [Interrupt mask](I2C_Registers#Device_3 "wikilink") |

# Description

This reads the interrupt field from the MCU device.

Use EnterExclusiveInterruptMode
([mcu::RTC](MCU_Services#MCU_service_.22mcu::RTC.22 "wikilink")
0x004C0000) to stop the internal event loop and gain exclusive access to
the interrupt field. Please use
[TriggerInterrupt](MCURTC:PublishNotifications "wikilink") to deliver
the interrupt mask to the mcu sysmodule unless you wanna filter MCU
interrupts, otherwise things like HOME or Power button won't function.
After you no longer need exclusive access and/or exiting the program,
use ExitExclusiveInterruptMode
([mcu::RTC](MCU_Services#MCU_service_.22mcu::RTC.22 "wikilink")
0x004B0000) to unfreeze the internal event loop.

Use [svcBindInterrupt](SVC "wikilink") with [InterruptID
0x71](ARM11_Interrupts "wikilink") to create a handle on which you can
wait for an MCU interrupt.