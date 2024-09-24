+++
title = 'Legacy FIRM PXI'
+++

This page describes the PXI commands for TWL_FIRM/AGB_FIRM.

| Command Header          | Available since system version | Description                                                                                                                                                                                                                                                                                                        |
|-------------------------|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0001....              | [1.0.0-0](1.0.0-0 "wikilink")  | Shuts down LgyP9, puts ARM9 into a `while(1) svcSleepThread(1*1000*1000);` loop at the end of `main()`                                                                                                                                                                                                             |
| 0x00020080              | [1.0.0-0](1.0.0-0 "wikilink")  | PrepareArm9ForTwl(u64 application_titleID) This launches the specified TWL title.                                                                                                                                                                                                                                  |
| 0x00030080              | [1.0.0-0](1.0.0-0 "wikilink")  | PrepareArm9ForAgb(u64 application_titleID) This launches the specified GBA VC title. On success, returns u64 GBA VC title exeFS .code length in cmdbuf\[2\].                                                                                                                                                       |
| 0x00040080 / 0x00040000 | [1.0.0-0](1.0.0-0 "wikilink")  | Process9 will eventually wait for the ARM11 to send this command after PrepareArm9ForTwl/PrepareArm9ForAgb is called, see [here](FIRM "wikilink"). The input parameters should be 0 and 0x00040000 as this is a nested message of which the ITCM code consumes the first half. Returns 0 after going into AGB mode |
| 0x00050040              | [1.0.0-0](1.0.0-0 "wikilink")  | (u8 unk) Does some lowlevel sd/emmc register setting (different for unk=0 and unk=1). If unk=1, sets a flag, code ran during the pxi main-func loop detects this and calls `svcKernelSetState(2,0)`.                                                                                                               |
| 0x0006....              | [1.0.0-0](1.0.0-0 "wikilink")  | (DateTime datetimetoset,u8 shouldRead) - Sets the P9 date/time (calling the same function used by cmd 0xA for this), then reads (if shouldRead is not 0) or writes (if shouldRead is 0) ARM7_RTC_LO/HI registers to or from agbsave_in_ram+0x60. AgbBg doesn't appear to use this command at all.                  |
| 0x0007....              | [1.0.0-0](1.0.0-0 "wikilink")  | Returns u8, IsSdCardInserted maybe?                                                                                                                                                                                                                                                                                |
| 0x0008....              | [1.0.0-0](1.0.0-0 "wikilink")  | Stubbed, returns 0xE0C0EC03...                                                                                                                                                                                                                                                                                     |
| 0x0009....              | [1.0.0-0](1.0.0-0 "wikilink")  | Stubbed, returns 0xE0C0EC03...                                                                                                                                                                                                                                                                                     |
| 0x000A....              | [1.0.0-0](1.0.0-0 "wikilink")  | Sets Process9's internal date/time, see below.                                                                                                                                                                                                                                                                     |
| 0x000B0240              | [1.0.0-0](1.0.0-0 "wikilink")  | This is used for TWL initialization, prior to using command 0x00020080. Arguments: u8 \<2 if card, else 3\>, u8 \<bit 1 from firmlaunchparams+0x460\>, u64 tid, u8 bannerHmac\[0x14\]                                                                                                                              |
| 0x000C0800              | [1.0.0-0](1.0.0-0 "wikilink")  | This writes the input 0x80-byte ASCII data to [nand:/rw/sys/lgy.log](Flash_Filesystem "wikilink").                                                                                                                                                                                                                 |

This PXI service seems to be based on [Development Services
PXI](Development_Services_PXI "wikilink"). Commands 0x8 and 0x9 in both
are stubbed with the same function (returns 0xE0C0EC03), commands that
seem useless under NATIVE_FIRM have a purpose on legacy FIRMs (command
0xC does some "unnecessary copying to stack" on NATIVE_FIRM, but this
same copy (0x80-bytes) is used to write to lgy.log on legacy FIRMs), and
commands that are essential (and only useful) on legacy FIRMs (0x2 and
0x3) are stubbed completely on NATIVE_FIRM.

# Command 0x2

This does the following:

- Waits for an u8 state field to become non-zero.
- Clears DSi memory, etc.
- Loads the DS(i) application specified by the command request titleID.
  If this fails, it immediately returns the error for this.
- Initializes the DSi memory at 0x02fe7000 and 0x02fffc00.
- Loads the TWL launcher located at physical address
  [0x27C00000](Memory_layout "wikilink"), which was written there by the
  TwlBg ARM11 process.
- Loads the TWL bootloader, see [here](FIRM "wikilink").
- Initializes DSi memory/keys, [0x10018000](IO_Registers "wikilink")
  registers, etc.
- Writes value 0x3 to [REG_BOOTENV](CONFIG_Registers "wikilink"), and
  value 0x1 to an u8 state field.
- Uses [svcSignalEvent](SVC "wikilink"), then returns.

# Command 0xA

This takes 3 arguments, which are the following structure packed into 12
bytes (no padding):

```
s32 year;
s8 month;
s8 day;
s8 day_of_week; // Sunday = 0, up to Saturday = 6
s8 hour;
s8 minute;
s8 second;
s16 ms;
```

This should be the current date/time (AgbBg seems to get it from MCU);
it's converted from this structure into milliseconds, and saved into
.data. Another .data variable is set from svcGetSystemTick by this
command, and another function in (LGY) P9 essentially does
```
return date_time_set_from_this_command + ticks_to_ms(svcGetSystemTick() - systemtick_from_this_command);
```
to get the current date&time.
