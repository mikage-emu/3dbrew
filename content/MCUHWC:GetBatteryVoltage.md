+++
title = 'MCUHWC:GetBatteryVoltage'
+++

# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Description

Returns a number which can be used to calculate the voltage using
`Vref * (value / 256)` where `Vref` seems to be `5.0v`.

When the charger is plugged into a fully charged old3DS, the value will
be around 0xD1 (~4.1v)

Unplugging the charger will make the value go down to 0xCE (~4v)

The voltage at 5% battery percentage just after the LEDs start flashing
is 0xAF (~3.4v)

Plugging in the charger at this point will make the voltage go up to
0xB9 (~3.6v)