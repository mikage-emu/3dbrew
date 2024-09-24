+++
title = 'SPI Registers'
+++

# Registers

| Old3DS | Name                                        | Address    | Width | Used by |
|--------|---------------------------------------------|------------|-------|---------|
| Yes    | [SPI_CNT](#spi_cnt "wikilink")1             | 0x10142000 | 2     |         |
| Yes    | SPI_DATA1                                   | 0x10142002 | 1     |         |
| Yes    | [NSPI_CNT](#nspi_cnt "wikilink")1           | 0x10142800 | 4     |         |
| Yes    | [NSPI_DONE](#nspi_done "wikilink")1         | 0x10142804 | 4     |         |
| Yes    | [NSPI_BLKLEN](#nspi_blklen "wikilink")1     | 0x10142808 | 4     |         |
| Yes    | [NSPI_FIFO](#nspi_fifo "wikilink")1         | 0x1014280C | 4     |         |
| Yes    | [NSPI_STATUS](#nspi_status "wikilink")1     | 0x10142810 | 4     |         |
| Yes    | [NSPI_AUTOPOLL](#nspi_autopoll "wikilink")1 | 0x10142814 | 4     | \-      |
| Yes    | [NSPI_INT_MASK](#nspi_int_mask "wikilink")1 | 0x10142818 | 4     | \-      |
| Yes    | [NSPI_INT_STAT](#nspi_int_stat "wikilink")1 | 0x1014281C | 4     | \-      |
|        |                                             |            |       |         |
| Yes    | [SPI_CNT](#spi_cnt "wikilink")2             | 0x10143000 | 2     |         |
| Yes    | SPI_DATA2                                   | 0x10143002 | 1     |         |
| Yes    | [NSPI_CNT](#nspi_cnt "wikilink")2           | 0x10143800 | 4     |         |
| Yes    | [NSPI_DONE](#nspi_done "wikilink")2         | 0x10143804 | 4     |         |
| Yes    | [NSPI_BLKLEN](#nspi_blklen "wikilink")2     | 0x10143808 | 4     |         |
| Yes    | [NSPI_FIFO](#nspi_fifo "wikilink")2         | 0x1014380C | 4     |         |
| Yes    | [NSPI_STATUS](#nspi_status "wikilink")2     | 0x10143810 | 4     |         |
| Yes    | [NSPI_AUTOPOLL](#nspi_autopoll "wikilink")2 | 0x10143814 | 4     | \-      |
| Yes    | [NSPI_INT_MASK](#nspi_int_mask "wikilink")2 | 0x10143818 | 4     | \-      |
| Yes    | [NSPI_INT_STAT](#nspi_int_stat "wikilink")2 | 0x1014381C | 4     | \-      |
| Yes    | [SPI_CNT](#spi_cnt "wikilink")3             | 0x10160000 | 2     |         |
| Yes    | SPI_DATA3                                   | 0x10160002 | 1     |         |
| Yes    | [NSPI_CNT](#nspi_cnt "wikilink")3           | 0x10160800 | 4     |         |
| Yes    | [NSPI_DONE](#nspi_done "wikilink")3         | 0x10160804 | 4     |         |
| Yes    | [NSPI_BLKLEN](#nspi_blklen "wikilink")3     | 0x10160808 | 4     |         |
| Yes    | [NSPI_FIFO](#nspi_fifo "wikilink")3         | 0x1016080C | 4     |         |
| Yes    | [NSPI_STATUS](#nspi_status "wikilink")3     | 0x10160810 | 4     |         |
| Yes    | [NSPI_AUTOPOLL](#nspi_autopoll "wikilink")3 | 0x10160814 | 4     | \-      |
| Yes    | [NSPI_INT_MASK](#nspi_int_mask "wikilink")3 | 0x10160818 | 4     | \-      |
| Yes    | [NSPI_INT_STAT](#nspi_int_stat "wikilink")3 | 0x1016081C | 4     | \-      |

There are two register interfaces: the old NDS/DSi one and an
alternative faster interface introduced with the 3DS.

To toggle between those interfaces, use the
[CFG11_SPI_CNT](CONFIG11_Registers#CFG11_SPI_CNT "wikilink") register.

## SPI_CNT

This is the old NDS/DSi SPI interface.

| Bits  | Name                                                         |
|-------|--------------------------------------------------------------|
| 0-1   | Baudrate (0=4MHz, 1=2MHz, 2=1MHz, 3=512KHz)                  |
| 2-6   | This was added with 3DS.                                     |
| 7     | Busy Flag (0=Ready, 1=Busy) (presumably Read-only)           |
| 8-9   | Device Select (0=Powerman., 1=Firmware, 2=Touchscreen)       |
| 10    | Transfer Size (0=8bit/Normal, 1=16bit/Bugged)                |
| 11    | Chipselect Hold (0=Deselect after transfer, 1=Keep selected) |
| 12-13 | Not used (Zero)                                              |
| 14    | Interrupt Request (0=Disable, 1=Enable)                      |
| 15    | SPI Bus Enable (0=Disable, 1=Enable)                         |

## NSPI_CNT

This is an alternative faster interface introduced with the 3DS.

| Bits | Name                                     |
|------|------------------------------------------|
| 0-2  | Clock                                    |
| 6-7  | Device select                            |
| 12   | Bus mode (0 = 1 bit, 1 = 4 bit)          |
| 13   | Transfer direction (0 = read, 1 = write) |
| 15   | 1 = Busy/enable                          |

| Device id | Bus | Device select | Clock |
|-----------|-----|---------------|-------|
| 0         | 3   | 0             | 2     |
| 1, 2      | 3   | 1, 2          | ?, ?  |
| 3         | 1   | 0             | 5     |
| 4, 5      | 1   | 1, 2          | ?, ?  |
| 6         | 2   | 0             | ?     |

## NSPI_DONE

| BIT  | DESCRIPTION |
|------|-------------|
| 0    | Chip select |
| 1-31 | Unused      |

Contains 1 when the SPI slave is selected. A 0 is written here on
transfer end to deselect the slave.

## NSPI_BLKLEN

| BIT   | DESCRIPTION   |
|-------|---------------|
| 0-20  | Transfer size |
| 21-31 | Unused        |

The number of bytes to be sent/read is written to this register.

## NSPI_FIFO

| BIT  | DESCRIPTION |
|------|-------------|
| 0-31 | Data        |

32-bit FIFO for reading/writing the SPI payload. This FIFO is one way
(half-duplex).

## NSPI_STATUS

| BIT  | DESCRIPTION                        |
|------|------------------------------------|
| 0    | FIFO full (0 = not full, 1 = full) |
| 1-31 | Unused                             |

At transfer start and every 32 bytes the FIFO becomes busy.

## NSPI_AUTOPOLL

| BIT   | DESCRIPTION                                                                     |
|-------|---------------------------------------------------------------------------------|
| 0-7   | Command                                                                         |
| 16-19 | Timeout (Tries = 31\<\<Clock (from [NSPI_CNT](#nspi_cnt "wikilink")) + Timeout) |
| 24-26 | Bit offset (0-7)                                                                |
| 30    | Poll for a set or unset bit                                                     |
| 31    | 1 = Enable/Busy                                                                 |

This automatically sends a command to the device and compares the
specified bit in the response with bit 30 until it matches or a timeout
occurs.

## NSPI_INT_MASK

| BIT | DESCRIPTION                      |
|-----|----------------------------------|
| 0   | Transfer finished (1 = disabled) |
| 1   | Autopoll success (1 = disabled)  |
| 2   | Autopoll timeout (1 = disabled)  |

## NSPI_INT_STAT

| BIT | DESCRIPTION                                          |
|-----|------------------------------------------------------|
| 0   | Transfer finished (also fires on each autopoll try?) |
| 1   | Autopoll success                                     |
| 2   | Autopoll timeout                                     |

[Interrupt](ARM11_Interrupts#Hardware_Interrupts "wikilink") ID 0x24,
0x56 or 0x57 (depending on the bus) is fired when any of the bits change
to 1 except for interrupts masked in
[NSPI_INT_MASK](#nspi_int_mask "wikilink"). Writing 1 to a bit in this
register aknowledges the interrupt.
