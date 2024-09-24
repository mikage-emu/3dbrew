+++
title = 'IRU:SetBitRate'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00090040\] |
| 1          | u8 bitrate value           |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Bitrate Values

| Value | Converted divisor value | Bits-per-second / description       |
|-------|-------------------------|-------------------------------------|
| 3     | 10                      | 115200                              |
| 4     | 12                      | 96000                               |
| 5     | 16                      | 72000                               |
| 6     | 24                      | 48000 (This is the default for IRU) |
| 7     | 32                      | 36000                               |
| 8     | 48                      | 24000                               |
| 9     | 64                      | 18000                               |
| 10    | 96                      | 12000                               |
| 11    | 120                     | 9600                                |
| 12    | 192                     | 6000                                |
| 13    | 384                     | 3000                                |
|       |                         |                                     |
| 14    | 20                      | 57600                               |
| 15    | 30                      | 38400                               |
| 16    | 60                      | 19200                               |
| 17    | 160                     | 7200                                |
| 18    | 240                     | 4800                                |

The bps listed above is from code in IR module which converts the input
value into actual bps, that function is only used with delay code
however.

The converted value is the following(from a datasheet): "16-bit divisor
for generation of the baud clock in the baud rate generator". The
baud/bit rate is calculated with the following, where clk is 1152000:
bitrate = clk / divisor.

# Description

This sets the current bitrate. Error 0xE0E10FED is returned when the
input value is outside of the above range. Error 0xF9610C02 is returned
when the I2C code returns an error.