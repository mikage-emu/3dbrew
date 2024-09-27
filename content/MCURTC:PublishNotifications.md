+++
title = 'MCURTC:PublishNotifications'
+++

# Request

| Index Word | Description                                            |
|------------|--------------------------------------------------------|
| 0          | Header code \[0x004E0040\]                             |
| 1          | [Interrupt bitmask](I2C_Registers#device_3 "wikilink") |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This triggers a software MCU interrupt in the mcu sysmodule. Depending
on the bitmask, the mcu sysmodule can publish srv notifications (using
[PublishToSubscriber](SRV:PublishToSubscriber "wikilink")).

If value 0xFFFFFFFF (-1) is passed, mcu sysmodule will instead read the
[MCU interrupt field](I2C_Registers#device_3 "wikilink").
