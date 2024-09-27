+++
title = 'ARM7 Registers'
+++

The 3DS utilizes an onboard ARM7 core to handle `TWL_FIRM` and
`AGB_FIRM`'s ARM7 requirements. This is due to the fact that much of the
hardware used by both ARM7 and ARM9 is (evidently) not physically hooked
up to ARM11. Thus, ARM11 cannot simply emulate ARM7.

ARM7 has the GBA BIOS implemented in hardware. The BIOS is completely
identical to the original GBA BIOS. The system is booted silently by
calling `SWI 0x1` (a.k.a. `RegisterRamReset`), followed by jumping to
the code that does `SWI 0x0` (a.k.a. `SoftReset`) to finish booting. The
boot splash is still in BIOS, however, and can be seen by calling or
replacing one of the previous interrupts with `SWI 0x26` (a.k.a.
`HardReset`).

## Registers

ARM9 interfaces with the ARM7 through the following registers:

| Type  | Address      | Name                                  | Size (bytes) |
|-------|--------------|---------------------------------------|--------------|
| `u8`  | `0x10018000` | `ARM7_CNT`                            | 1            |
| Code  | `0x10018080` | `ARM7_CODE`                           | 32           |
| `u16` | `0x10018100` | `ARM7_SAVE_MODE`                      | 2            |
| `u16` | `0x10018104` | `ARM7_SAVE_MEMORY_CNT`                | 2            |
| `u16` | `0x10018108` | `ARM7_RTC_CNT`                        | 2            |
| `u32` | `0x10018110` | `ARM7_RTC_VAL_DATE`                   | 4            |
| `u32` | `0x10018114` | `ARM7_RTC_VAL_TIME`                   | 4            |
| `u32` | `0x10018118` | `ARM7_RTC_VAL_SETTINGS`               | 4            |
| `u32` | `0x1001811C` | `ARM7_RTC_VAL_ADJUST`                 | 4            |
| `u32` | `0x10018120` | `ARM7_SAVE_FLASH_CHIP_ERASE_CYCLES`   | 4            |
| `u32` | `0x10018124` | `ARM7_SAVE_FLASH_SECTOR_ERASE_CYCLES` | 4            |
| `u32` | `0x10018128` | `ARM7_SAVE_FLASH_PROGRAM_CYCLES`      | 4            |
| `u32` | `0x1001812C` | `ARM7_SAVE_EEPROM_WRITE_CYCLES`       | 4            |

### ARM7_CNT

This seems to control the mode of the ARM7. 1 = TWL, 2 = GBA.

### ARM7_CODE

This region is an arm7 bootrom overlay, over the vector table at address
0. Once the ARM7 is taken out of reset by `TwlProcess9`, the reset
vector will be jumped to, beginning execution. `TwlProcess9` uses this
to put ARM7 in a loop (TWL), and to set the `POSTFLG` and branch to more
copied code (GBA). Execution is started by writing `0x8001` to
[LGY_MODE](PDN_Registers#lgy_mode "wikilink") after setting the mode via
`ARM7_CNT`. Later, this overlay is disabled by the ARM7 via the
"biosprot" register (0x04000308).

Reading uninitialized data in this 32-byte region leads to both screens
displaying solid green (exception), and the CPU locking up.

### ARM7_SAVE_MODE

This tells the save storage emulation hardware which device type to
emulate (64k EEPROM, a 512k Flash chip model, and SRAM are all that have
been used officially; several other 512k Flash chip models, two 1 Mbit
Flash chip models and 4k EEPROM are also supported). This comes directly
from the [ROM footer](3DS_Virtual_Console#footer "wikilink").

### ARM7_SAVE_MEMORY_CNT

This register controls whether the GBA save memory region located at
`0x08080000` is accessible to ARM9 or to the ARM7 (via the emulated save
chip). When it's set to 0x0 ARM7 has access, while ARM9 has access when
it's set to 0x1.

### ARM7_RTC_CNT

This register controls the emulated RTC hardware and access to some of
its registers. To set or read the data from ARM7_RTC_VAL_SETTINGS or
ARM7_RTC_VAL_ADJUST, first `ARM7_RTC_CNT`'s bit 15 is waited on. Next
`ARM7_RTC_CNT` is set to zero.

For a write: the two registers are written, a 1 is written to
`ARM7_RTC_CNT`, and it is waited on the same as before. Afterwards if
bit 14 is not set in `ARM7_RTC_CNT`, the value was set successfully.
This also starts the emulated RTC.

For a read: a 2 is written to `ARM7_RTC_CNT`, it's waited on again.
Afterwards, if bit 14 is not set, the aforementioned registers can be
read. Presumably the hardware can be re-enabled by writing a zero to
`ARM7_RTC_CNT` at this point, but `AGB_FIRM` does not.

### ARM7_RTC_VAL_DATE / ARM7_RTC_VAL_TIME

These registers are set to the current LgyP9 date+time before the other
RTC-related registers are used. They contain the following structure,
set up on the stack then both u32 registers are written one after the
other:

```
s8 year_since_2000_bcd;
s8 month_bcd;
s8 day_bcd;
s8 day_of_week;
s8 hour_bcd;
s8 minute_bcd;
s8 second_bcd;
```

### ARM7_RTC_VAL_SETTINGS

This register appears to contain the emulated RTC chip's configuration
(accessible via the "control" register on real hardware), containing
settings like 12/24-hour mode. Access is controlled by `ARM7_RTC_CNT`
(see above).

### ARM7_RTC_VAL_ADJUST

This register appears to contain the emulated RTC chip's time
difference, relative to `ARM7_RTC_VAL_DATE` / `ARM7_RTC_VAL TIME`, in
seconds. Access is controlled by `ARM7_RTC_CNT` (see above).

### ARM7_SAVE_FLASH_CHIP_ERASE_CYCLES

This register seems to configure the emulated Flash chip to take a
specified amount of time to complete a chip erase operation (relative to
the DS' ARM7/bus speed). Two variations exist in officially released
games, one meant for 512k Flash chips and one for 1 Mbit Flash chips. It
is copied from from rom footer + `0x10`.

### ARM7_SAVE_FLASH_SECTOR_ERASE_CYCLES

This register seems to configure the emulated Flash chip to take a
specified amount of time to complete a sector erase operation (relative
to the DS' ARM7/bus speed). Two variations exist in officially released
games, one meant for 512k Flash chips and one for 1 Mbit Flash chips. It
is copied from from rom footer + `0x14`.

### ARM7_SAVE_FLASH_PROGRAM_CYCLES

This register seems to configure the emulated Flash chip to take a
specified amount of time to complete a program operation (relative to
the DS' ARM7/bus speed). Two variations exist in officially released
games, one meant for 512k Flash chips and one for 1 Mbit Flash chips. It
is copied from from rom footer + `0x18`.

### ARM7_SAVE_EEPROM_WRITE_CYCLES

This register seems to configure the emulated EEPROM chip to take a
specified amount of time to complete a write operation (relative to the
DS' ARM7/bus speed). Two variations exist in officially released games,
one meant for 64k EEPROM chips and one for 4k EEPROM chips. It is copied
from from rom footer + `0x1C`.

## Memory map

The virtual memory mapping for the ARM7 is the same as for the [other
core](Memory_layout#twl_firm_userland_memory "wikilink"). However, it
has additional internal memory mapped to it. Interestingly enough, much
of this memory seems to lie within ARM9's own internal memory.

- `0x08060000` → `0x03800000`, ARM7 WRAM (64KiB)
- `0x080B0000` → `0x03000000`, GBA IWRAM (32KiB)
- `0x08080000` → EEPROM/SRAM/Flash 512k/Flash 1Mbit (the 2 512k banks
  are contiguous in memory). Access is controlled by
  `ARM7_SAVE_MEMORY_CNT` (see above). `0x080C0000` holds a mirror which
  is used by LgyP9 on boot to read the SD savedata before the mode
  switch, the data is then copied.
- `0x01FFC000` → `0x01000000`, ARM9 ITCM under TWL (16KiB)
