+++
title = 'SPICARD Registers'
+++

# Registers

| Old3DS | Name                                       | Address    | Width | RW  | Used by |
|--------|--------------------------------------------|------------|-------|-----|---------|
| Yes    | [NSPI_CNT](#NSPI_CNT "wikilink")           | 0x1000D800 | 4     | RW  |         |
| Yes    | [NSPI_DONE](#NSPI_DONE "wikilink")         | 0x1000D804 | 4     | RW  |         |
| Yes    | [NSPI_BLKLEN](#NSPI_BLKLEN "wikilink")     | 0x1000D808 | 4     | RW  |         |
| Yes    | [NSPI_FIFO](#NSPI_FIFO "wikilink")         | 0x1000D80C | 4     | RW  |         |
| Yes    | [NSPI_STATUS](#NSPI_STATUS "wikilink")     | 0x1000D810 | 4     | R   |         |
| Yes    | [NSPI_AUTOPOLL](#NSPI_AUTOPOLL "wikilink") | 0x1000D814 | 4     | RW  |         |
| Yes    | [NSPI_INT_MASK](#NSPI_INT_MASK "wikilink") | 0x1000D818 | 4     | W?  |         |
| Yes    | [NSPI_INT_STAT](#NSPI_INT_STAT "wikilink") | 0x1000D81C | 4     | RW  |         |

## NSPI_CNT

| BIT | DESCRIPTION                                                 |
|-----|-------------------------------------------------------------|
| 0-2 | [Baud Rate](Filesystem_services#CardSpiBaudRate "wikilink") |
| 6-7 | Unused device select.                                       |
| 12  | [Bus Mode](Filesystem_services#CardSpiBusMode "wikilink")   |
| 13  | Transfer Mode (0 = read, 1 = write)                         |
| 15  | Trigger (0 = idle, 1 = busy)                                |

This register seems to have a bug where the lower 8 bits are shifted up
by 16 when reading this register.

## NSPI_DONE

Contains 1 when the SPI slave is selected. A 0 is written here on
transfer end to deselect the slave.

## NSPI_BLKLEN

| BIT   | DESCRIPTION   |
|-------|---------------|
| 0-20  | Transfer size |
| 21-31 | Unused        |

## NSPI_FIFO

| BIT  | DESCRIPTION |
|------|-------------|
| 0-31 | Data        |

This FIFO is one way (half-duplex).

## NSPI_STATUS

| BIT | DESCRIPTION                        |
|-----|------------------------------------|
| 0   | FIFO Full (0 = not full, 1 = full) |

## NSPI_AUTOPOLL

| BIT   | DESCRIPTION                                                |
|-------|------------------------------------------------------------|
| 0-7   | Command                                                    |
| 16-19 | Timeout (Tries = 31\<\<Baudrate (from NSPI_CNT) + Timeout) |
| 24-26 | Bit offset (0-7)                                           |
| 30    | Poll for a set or unset bit                                |
| 31    | 1 = Enable/Busy                                            |

This automatically sends a command to the device and compares the
specified bit in the response with bit 30 until it matches or a timeout
occurs. Nintendo uses a timeout of 10 which roughly equals 1 second.
This is used in Process9 to poll the gamecard SPI flash status register
for write operation finished or write enable.

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

[Interrupt](IRQ_Registers "wikilink") ID 23 is fired when any of the
bits change to 1 except for interrupts masked in
[NSPI_INT_MASK](#NSPI_INT_MASK "wikilink"). Writing 1 to a bit in this
register aknowledges the interrupt.