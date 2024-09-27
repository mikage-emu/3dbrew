# Registers

## GPIO

| Old3DS | Name                                     | Address    | Width |
|--------|------------------------------------------|------------|-------|
| Yes    | [GPIO1_DATA](#GPIOn_DATA "wikilink")     | 0x10147000 | 1     |
| Yes    | [GPIO2_DATA](#GPIOn_DATA "wikilink")     | 0x10147010 | 1     |
| Yes    | [GPIO2_DIR](#GPIOn_DIR "wikilink")       | 0x10147011 | 1     |
| Yes    | [GPIO2_INTCFG](#GPIOn_INTCFG "wikilink") | 0x10147012 | 1     |
| Yes    | [GPIO2_INTEN](#GPIOn_INTEN "wikilink")   | 0x10147013 | 1     |
| Yes    | [GPIO2_DATA2](#GPIOn_DATA2 "wikilink")   | 0x10147014 | 2     |
| Yes    | [GPIO3_DATA](#GPIOn_DATA "wikilink")     | 0x10147020 | 2     |
| Yes    | [GPIO3_DIR](#GPIOn_DIR "wikilink")       | 0x10147022 | 2     |
| Yes    | [GPIO3_INTCFG](#GPIOn_INTCFG "wikilink") | 0x10147024 | 2     |
| Yes    | [GPIO3_INTEN](#GPIOn_INTEN "wikilink")   | 0x10147026 | 2     |
| Yes    | [GPIO3_DATA2](#GPIOn_DATA2 "wikilink")   | 0x10147028 | 2     |
|        |                                          |            |       |

## Legacy RTC

| Name                                        | Address    | Width  | Description                                                                                                               |
|---------------------------------------------|------------|--------|---------------------------------------------------------------------------------------------------------------------------|
| [RTC_CNT](#RTC_CNT_(0x10147100) "wikilink") | 0x10147100 | 2      | Control register                                                                                                          |
| RTC_REG_STAT1                               | 0x10147110 | 1      | Rtc status register 1 (command 0). Bitswapped                                                                             |
| RTC_REG_STAT2                               | 0x10147111 | 1      | Rtc status register 2 (command 1). Bitswapped                                                                             |
| RTC_REG_CLKADJ                              | 0x10147112 | 1      | Rtc clock adjustment register (command 6). Bitswapped                                                                     |
| RTC_REG_FREE                                | 0x10147113 | 1      | The free general purpose rtc register (command 7). Bitswapped                                                             |
| RTC_REG_TIME1                               | 0x10147120 | 4      | Byte-wise bit-swapped (bit7 is bit0, etc.) BCD RTC (byte0 = seconds, byte1 = minutes, byte2 = hours, byte3 = day of week) |
| RTC_REG_TIME2                               | 0x10147124 | 4 (3?) | Day, month and year all byte-wise bit-swapped                                                                             |
| RTC_REG_ALRMTIM1                            | 0x10147130 | 4 (3?) | Rtc alarm time register 1 (command 4). Byte-wise bit-swapped                                                              |
| RTC_REG_ALRMTIM2                            | 0x10147134 | 4 (3?) | Rtc alarm time register 2 (command 5). Byte-wise bit-swapped                                                              |
| RTC_REG_COUNT                               | 0x10147140 | 4 (3?) | Rtc dsi counter register (ex command 0). Byte-wise bit-swapped                                                            |
| RTC_REG_FOUT1                               | 0x10147150 | 1      | Rtc dsi fout register 1 (ex command 1). Bitswapped                                                                        |
| RTC_REG_FOUT2                               | 0x10147151 | 1      | Rtc dsi fout register 2 (ex command 2). Bitswapped                                                                        |
| RTC_REG_ALRMDAT1                            | 0x10147160 | 4 (3?) | Rtc dsi alarm date register 1 (ex command 4). Byte-wise bit-swapped                                                       |
| RTC_REG_ALRMDAT2                            | 0x10147164 | 4 (3?) | Rtc dsi alarm date register 2 (ex command 5). Byte-wise bit-swapped                                                       |
|                                             |            |        |                                                                                                                           |

# Descriptions

## GPIO

### GPIO pins

Only GPIO2 and GPIO3 pins have their interrupts configurable. Active low
pins should be configured as "falling edge", and output ports shouldn't
have interrupts enabled at all.

[GPIO Services](GPIO_Services "wikilink") bitmasks use this table, in
that order:

| Bit     | IRQ ID                                 | Description                                        |
|---------|----------------------------------------|----------------------------------------------------|
| 0       | ?                                      | Debug button (?) (active-low)                      |
| 1       | 0x63 (falling edge)                    | Touch Screen (active low, 0 = screen pressed)      |
| 2       | 0x60 (falling edge) 0x62 (rising edge) | Shell closed                                       |
| 0       | 0x64                                   | Headphones inserted                                |
| 1       | 0x66                                   | TWL depop circuit (?) (active-low)                 |
| DATA2.0 | \-                                     | WiFi mode/freq. select (0 = CTR, 1 = MP (DS WiFi)) |
| 0       | 0x68                                   | C-stick interrupt                                  |
| 1       | 0x69                                   | IrDA interrupt (active-low)                        |
| 2       | 0x6A                                   | Gyro interrupt                                     |
| 3       | 0x6B                                   | C-stick "stop" (output)                            |
| 4       | 0x6C                                   | IrDA TX-RC (output)                                |
| 5       | 0x6D                                   | IrDA RXD (active-low)                              |
| 6       | 0x6E                                   | NFC output1 (?)                                    |
| 7       | 0x6F                                   | NFC output2 (?)                                    |
| 8       | 0x70                                   | Headphones button/half-inserted (active-low)       |
| 9       | 0x71                                   | MCU interrupt                                      |
| 10      | 0x72                                   | NFC interrupt (?)                                  |
| 11      | 0x73                                   | QTM output (?)                                     |
|         |                                        |                                                    |
| DATA2.0 | \-                                     | WiFi enable                                        |

### GPIOn_DATA

Pin values, one bit per pin.

### GPIOn_DIR

Pin directions for GPIO2 and GPIO3, one bit per pin.

| Value | Description |
|-------|-------------|
| 0     | Input       |
| 1     | Output      |

### GPIOn_INTCFG

Interrupt configuration for GPIO2 and GPIO3 pins (not the extra ones),
one bit per pin.

| Value | Description  |
|-------|--------------|
| 0     | Falling edge |
| 1     | Rising edge  |

### GPIOn_INTEN

Interrupt enable bits for GPIO2 and GPIO3 pins (not the extra ones), one
bit per pin.

| Value | Description        |
|-------|--------------------|
| 0     | Interrupt disabled |
| 1     | Interrupt enabled  |

### GPIOn_DATA2

Extra pins for GPIO2 and GPIO3 (one bit each). These two pins, in total,
are not bound to any IRQ and are not configurable.

### Default values

After bootrom initialization, these are the values of the registers:

| Address    | Value      |
|------------|------------|
| 0x10147000 | 0x0003     |
| 0x10147010 | 0x00000002 |
| 0x10147014 | 0x0000     |
| 0x10147020 | 0x00000DFB |
| 0x10147024 | 0x00000000 |
| 0x10147028 | 0x0000     |

## Legacy RTC

### RTC_CNT (0x10147100)

| Bit | Description                                              |
|-----|----------------------------------------------------------|
| 0   | Latch STAT1                                              |
| 1   | Latch STAT2                                              |
| 2   | Latch CLKADJ                                             |
| 3   | Latch FREE                                               |
| 4   | Latch TIME                                               |
| 5   | Latch ALRMTIM1                                           |
| 6   | Latch ALRMTIM2                                           |
| 7   | Latch COUNT                                              |
| 8   | Latch FOUT1                                              |
| 9   | Latch FOUT2                                              |
| 10  | Latch ALRMDAT1                                           |
| 11  | Latch ALRMDAT2                                           |
| 12  | ARM7 Busy? This may be chipselect                        |
| 13  | ARM7 write command received? (writing 1 clears it seems) |
| 14  | ARM7 read command recieved? (writing 1 clears it seems)  |
| 15  | DS SIO SI pin (rtc irq pin)                              |