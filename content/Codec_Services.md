+++
title = 'Codec Services'
+++

# HID Codec "cdc:HID"

| Command Header | Description                           |
|----------------|---------------------------------------|
| 0x00010042     | [GetData](Cdc:HID:GetData "wikilink") |
| 0x00020042     | Initialize                            |
| 0x00030000     | Finalize                              |

## Touchscreen

The touchscreen is the SPI [device number
3](SPI_Registers#SPI_NEW_CNT "wikilink"), so it uses the
[0x10142XXX](SPI_Services "wikilink") SPI registers. It is initialized
by issuing the following SPI commands:

```
spi_select_reg(3, 0x67);
spi_offset_mask(3, 0x26, 0x80, 0x80);
spi_select_reg(3, 0x67);
spi_offset_mask(3, 0x24, 0, 0x80);
spi_select_reg(3, 0x67);
spi_offset_mask(3, 0x25, 0x10, 0x3C);
```

Once the touchscreen is initialized, you can start polling touch data:

```
u8 raw_touchdata[0x40];
spi_select_reg(3, 0x67);
spi_read_offset(3, 0x26); //The return value of this is checked against "& 2"
spi_select_reg(3, 0xFB);
spi_read_offset_array(3, 1, raw_touchdata, 0x34);
```

This is the format of the touchdata report:

| Offset | Width | Description                                                              |
|--------|-------|--------------------------------------------------------------------------|
| 0x00   | 2\*5  | Five Touchscreen X Coordinates (big-endian MSB,LSB each. 12 bits number) |
| 0x0A   | 2\*5  | Five Touchscreen Y Coordinates (big-endian MSB,LSB each. 12 bits number) |
| 0x20   | ??    | ??                                                                       |

When the touchscreen is not touched, all the coordinates report 0xFFFF,
and since touch coordinates have only 12 bits, you can check if the
touchscreen is pressed by checking the 4th bit of the MSB. For example:
pendown = !(raw_touchdata\[0\] & BIT(4))

# MIC Codec "cdc:MIC"

| Command Header | Description     |
|----------------|-----------------|
| 0x00010040     | SetGain         |
| 0x00020080     | GetGain         |
| 0x00030040     | SetPower        |
| 0x00040080     | GetPower        |
| 0x00050042     | SetIirFilterMic |

# CSN Codec "cdc:CSN"

| Command Header | Description |
|----------------|-------------|
| 0x00010040     | ?           |
| 0x00020040     | ?           |
| 0x00030040     | ?           |
| 0x00040080     | ?           |
| 0x00050040     | ?           |
| 0x00060080     | ?           |
| 0x00070040     | ?           |
| 0x00080080     | ?           |
| 0x00090040     | ?           |

# DSP Codec "cdc:DSP"

| Command Header | Description |
|----------------|-------------|
| 0x00010042     | ?           |
| 0x00020042     | ?           |
| 0x00030082     | ?           |
| 0x00040042     | ?           |
| 0x000500C2     | ?           |
| 0x00060080     | ?           |
| 0x00070040     | ?           |
| 0x00080040     | ?           |

# Legacy Codec "cdc:LGY"

| Command Header | Description                                                               |
|----------------|---------------------------------------------------------------------------|
| 0x00010040     | Powers on microphone ADC and clears bank3:idx3, then clears bank0xFF:idx5 |
| 0x00020040     | Sets unknown CONFIG11 CODEC bits, writes 0x40 to bank0x67:idx0x25         |
| 0x00030040     | Modifies bit5 in bank0x65:idx0x33                                         |

# CHK Codec "cdc:CHK"

| Command Header | Description                            |
|----------------|----------------------------------------|
| 0x000100C0     | [ReadSPI](CDCCHK:ReadSPI "wikilink")   |
| 0x000200C0     |                                        |
| 0x000300C2     | [WriteSPI](CDCCHK:WriteSPI "wikilink") |
| 0x000400C2     |                                        |
