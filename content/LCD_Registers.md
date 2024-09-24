+++
title = 'LCD Registers'
+++

Other registers that used to be documented on this page are now at [GPU](categories/GPU "wikilink").

# Registers

| NAME                                                             | PHYSICAL ADDRESS | PROCESS VIRTUAL ADDRESS | KERNEL VIRTUAL ADDRESS | WIDTH |
|------------------------------------------------------------------|------------------|-------------------------|------------------------|-------|
| Parallax barrier enable                                          | 0x10202000       | 0x1ED02000              | 0xFFFD6000             | 0x4   |
| Parallax barrier PWM                                             | 0x10202004       | 0x1ED02004              | 0xFFFD6004             | 0x4   |
| LCD status                                                       | 0x10202008       | 0x1ED02008              | 0xFFFD6008             | 0x4   |
| LCD clock disable                                                | 0x1020200C       | 0x1ED0200C              | 0xFFFD600C             | 0x4   |
| ?                                                                | 0x10202010       | 0x1ED02010              | 0xFFFD6010             | 0x4   |
| LCD reset                                                        | 0x10202014       | 0x1ED02014              | 0xFFFD6014             | 0x4   |
| Top Screen [LCD Configuration](#lcd_configuration "wikilink")    | 0x10202200       | 0x1ED02200              | 0xFFFD6200             | 0x600 |
| Bottom Screen [LCD Configuration](#lcd_configuration "wikilink") | 0x10202A00       | 0x1ED02A00              | 0xFFFD6A00             | 0x600 |
| ?                                                                | 0x10203200       | 0x1ED03200              | 0xFFFD7200             | 0x40  |

On screen-init (error screen), Boot11 sets 0x10202004 to 0xA390A39.

## LCD Configuration

| Offset | Size  | Description                                                                                                                             |
|--------|-------|-----------------------------------------------------------------------------------------------------------------------------------------|
| 0x00   | 0x4   | [Flags](#flags "wikilink")                                                                                                              |
| 0x04   | 0x4   | [Fill Color](#fill_color "wikilink")                                                                                                    |
| 0x10   | 0x10  | [ABL Area](#abl_area "wikilink")                                                                                                        |
| 0x20   | 0x4   | GTH Ratio                                                                                                                               |
| 0x24   | 0x4   | Min GTH                                                                                                                                 |
| 0x28   | 0x4   | MinMax                                                                                                                                  |
| 0x2C   | 0x4   | ExMax                                                                                                                                   |
| 0x30   | 0x4   | Inertia                                                                                                                                 |
| 0x38   | 0x4   | MinRS                                                                                                                                   |
| 0x3C   | 0x4   | MaxRS                                                                                                                                   |
| 0x40   | 0x4   | [Backlight Level](#backlight_level "wikilink")                                                                                          |
| 0x44   | 0x4   | [Backlight Interval](#backlight_interval "wikilink")                                                                                    |
| 0x60   | 0x20  | Dither                                                                                                                                  |
| 0x80   | 0x24  | LutListRS                                                                                                                               |
| 0xF0   | 0x0C  | ?                                                                                                                                       |
| 0x100  | 0x100 | LCD calibration data, pulled from nand:/ro/sys/HWCAL0.dat offset 0x77C. N3DS only. This area on old3DS is zero-filled and not writable. |
| 0x200  | 0x400 | ?                                                                                                                                       |

### Flags

| Bit | Description |
|-----|-------------|
| 0   | ABL on      |
| 8   | ?           |
| 9   | ?           |

Bits 8 and 9 control dither.

### Fill Color

| Bit   | Description               |
|-------|---------------------------|
| 7-0   | Red component intensity   |
| 15-8  | Green component intensity |
| 23-16 | Blue component intensity  |
| 24    | Enable                    |

When the enable bit is set, the specified solid color is displayed on
the LCD instead of the framebuffer.

### ABL Area

| Offset | Description |
|--------|-------------|
| 0x00   | X begin     |
| 0x04   | X end       |
| 0x08   | Y begin     |
| 0x0C   | Y end       |

The values refer to 90° clockwise rotated screens.

### Backlight Level

| Bit | Description                     |
|-----|---------------------------------|
| 9-0 | Backlight PWM duty on (0 = off) |

### Backlight Interval

| Bit | Description                             |
|-----|-----------------------------------------|
| 9-0 | Backlight PWM Interval, minus 1         |
| 16  | Enable LCD (0 = disabled, 1 = enabled). |
| 17  | RS on (?)                               |
| 18  | ?                                       |

On old 2DS, disabling the top LCD does nothing, disabling the bottom LCD
affects both screens. Setting bit 18 makes the screen darker.