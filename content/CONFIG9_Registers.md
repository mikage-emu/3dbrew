+++
title = 'CONFIG9 Registers'
+++

# Registers

| Old3DS | Name                                             | Address    | Width | Used by                      |
|--------|--------------------------------------------------|------------|-------|------------------------------|
| Yes    | [CFG9_SYSPROT9](#cfg9_sysprot9 "wikilink")       | 0x10000000 | 1     | Boot9                        |
| Yes    | [CFG9_SYSPROT11](#cfg9_sysprot11 "wikilink")     | 0x10000001 | 1     | Boot9                        |
| Yes    | [CFG9_RST11](#cfg9_rst11 "wikilink")             | 0x10000002 | 1     | Boot9                        |
| Yes    | CFG9_DEBUGCTL                                    | 0x10000004 | 4     |                              |
| Yes    | [CFG9_XDMA_CNT](#cfg9_xdma_cnt "wikilink")       | 0x10000008 | 1     | Boot9, Process9, TwlProcess9 |
| Yes    | [CFG9_CARDCTL](#cfg9_cardctl "wikilink")         | 0x1000000C | 2     | Process9                     |
| Yes    | [CFG9_CARDSTATUS](#cfg9_cardstatus "wikilink")   | 0x10000010 | 1     | Process9                     |
| Yes    | CFG9_CARDCYCLES0                                 | 0x10000012 | 2     | Boot9, Process9              |
| Yes    | CFG9_CARDCYCLES1                                 | 0x10000014 | 2     | Boot9, Process9              |
| Yes    | [CFG9_SDMMCCTL](#cfg9_sdmmcctl "wikilink")       | 0x10000020 | 2     | Process9                     |
| Yes    | ?                                                | 0x10000100 | 2     |                              |
| No     | [CFG9_EXTMEMCNT9](#cfg9_extmemcnt9 "wikilink")   | 0x10000200 | 1     | NewKernel9                   |
| Yes    | [CFG9_MPCORECFG](#cfg9_mpcorecfg "wikilink")     | 0x10000FFC | 4     |                              |
| Yes    | [CFG9_BOOTENV](#cfg9_bootenv "wikilink")         | 0x10010000 | 4     |                              |
| Yes    | [CFG9_UNITINFO](#cfg9_unitinfo "wikilink")       | 0x10010010 | 1     | Process9                     |
| Yes    | [CFG9_TWLUNITINFO](#cfg9_twlunitinfo "wikilink") | 0x10010014 | 1     | Process9                     |

## CFG9_SYSPROT9

CFG9_SYSPROT9 is used to permanently disable certain security-sensitive
ARM9 memory areas until the next hard reset.

| Bit  | Description                                                                                                                                                              | Used by                    |
|------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------|
| 0    | Disables ARM9 [bootrom](Memory_layout "wikilink")(+0x8000) when set to 1, and enables access to [FCRAM](Memory_layout "wikilink"). Cannot be cleared to 0 once set to 1. | Boot9                      |
| 1    | Disables [OTP area](OTP_Registers "wikilink") when set to 1. Cannot be cleared to 0 once set to 1.                                                                       | NewKernel9Loader, Process9 |
| 31-2 | Not used                                                                                                                                                                 |                            |

On Old 3DS, NATIVE_FIRM reads CFG9_SYSPROT9 to know whether it has
previously initialized the TWL console-unique keys using the OTP data.
After setting the TWL console-unique keys, NATIVE_FIRM sets
CFG9_SYSPROT9 bit 1 to disable the OTP area. In subsequent FIRM launches
prior to the next reset, NATIVE_FIRM will see that the OTP area is
disabled, and skip this step.

On New 3DS, the above is instead done by the [Kernel9
loader](FIRM#new_3ds_firm "wikilink"). In addition to using the OTP data
for initializing the TWL console-unique keys, the Kernel9 loader will
generate the decryption key for NATIVE_FIRM. The final keyslot for
NATIVE_FIRM is preserved, so that at a non-reset FIRM launch, the
keyslot can be reused, since the OTP would then be inaccessible.

## CFG9_SYSPROT11

| Bit  | Description                                                                                                                                                               | Used by |
|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------|
| 0    | Disables ARM11 [bootrom](Memory_layout "wikilink")(+0x8000) when set to 1, and enables access to [FCRAM](Memory_layout "wikilink"). Cannot be cleared to 0 once set to 1. | Boot9   |
| 31-1 | Not used                                                                                                                                                                  |         |

## CFG9_RST11

| Bit  | Description                                                                       | Used by |
|------|-----------------------------------------------------------------------------------|---------|
| 0    | Presumably takes ARM11 out of reset. Cannot be set to 1 once it has been cleared. | Boot9   |
| 31-1 | Not used                                                                          |         |

## CFG9_XDMA_CNT

Write 1 to enable XDMA for the device, 0 to disable. Always enabled for
CTRCARD (ids 0 and 1), NTRCARD (id 8), and SHA (id 6 for infifo and 7
for outfifo).

| Bit  | Description                                                     | Used by                      |
|------|-----------------------------------------------------------------|------------------------------|
| 0    | SDIO controller 1 (eMMC and usually SD card; XDMA device ID: 2) |                              |
| 1    | SDIO controller 3 (SD card if configured so; ID: 3)             |                              |
| 2    | AES Input FIFO (ID: 4)                                          | Boot9, Process9, TwlProcess9 |
| 3    | AES Output FIFO (ID: 5)                                         | Boot9, Process9, TwlProcess9 |
| 31-4 | Reserved                                                        |                              |

## CFG9_CARDCTL

| Bit | Description                                                                  | Used by  |
|-----|------------------------------------------------------------------------------|----------|
| 1-0 | Gamecard active controller select (0=NTRCARD, 1=?, 2=CTRCARD0, 3=CTRCARD1)   | Process9 |
| 8   | 1 = Switch to [SPICARD](SPICARD_Registers "wikilink") interface (savegames). | Process9 |

Depending on the gamecard controller that has been selected, one of the
following gamecard registers will become active:

- Selecting NTRCARD will activate the register space at
  [0x10164000](NTRCARD "wikilink").
- Selecting CTRCARD0 will activate the register space at
  [0x10004000](CTRCARD "wikilink").
- Selecting CTRCARD1 will activate the register space at
  [0x10005000](CTRCARD "wikilink").

## CFG9_CARDSTATUS

| Bit | Description                                                                                           | Used by  |
|-----|-------------------------------------------------------------------------------------------------------|----------|
| 0   | Cartridge-slot empty (0=inserted, 1=empty)                                                            | Process9 |
| 3-2 | Cartridge-slot power supply (0=off, 1=prepare power regulator, 2=enable output, 3=request power down) | Process9 |

When the power supply is in the "request power down" state, the power
bits will be reset to 0=off after some time.

## CFG9_SDMMCCTL

This register controls power of multiple ports/controllers and allows to
map controller 3 to ARM9 or ARM11. The SD card can be accessed on ARM11
by setting bit 8 and clearing bit 9.

| Bit   | Description                                                       | Used by  |
|-------|-------------------------------------------------------------------|----------|
| 0     | Controller 1/3 port 0 power (SD card) (1=off)                     | Process9 |
| 1     | Controller 1 port 1 power (eMMC) (1=off)                          | Process9 |
| 2     | Controller 2 port 0 power (WiFi SDIO) (1=off)                     | Process9 |
| 3     | Controller 3 port 1 power? Set at cold boot.                      | \-       |
| 4-5   | Unused.                                                           | \-       |
| 6     | Wifi port related? Pull up? Set at cold boot.                     | \-       |
| 8     | Controller 3 mapping (0=ARM9 0x10007000, 1=ARM11 0x10100000)      | Process9 |
| 9     | SD card controller select (0=0x10007000/0x10100000, 1=0x10006000) | Process9 |
| 10-15 | Unused.                                                           | \-       |

## CFG9_EXTMEMCNT9

This register is New3DS-only.

| Bit  | Description                                   | Used by          |
|------|-----------------------------------------------|------------------|
| 0    | Hide extended ARM9 memory (0=hidden, 1=shown) | Kernel9 (New3DS) |
| 31-1 | Reserved                                      |                  |

## CFG9_MPCORECFG

Identical to [PDN_MPCORE_CFG](PDN#pdn_mpcore_cfg "wikilink").

## CFG9_BOOTENV

This register is used to determine what the previous running FIRM was.
Its value is kept following an MCU reboot. Its initial value (on a cold
boot) is 0. NATIVE_FIRM [sets it to
1](Development_Services_PXI "wikilink") on shutdown/FIRM launch. [LGY
FIRM](Legacy_FIRM_PXI "wikilink") writes value 3 here when launching a
TWL title, and writes value 7 when launching an AGB title.

NATIVE_FIRM will only launch titles if this is not value 0, and will
only save the [AGB_FIRM savegame](Flash_Filesystem "wikilink") to SD if
this is value 7.

## CFG9_UNITINFO

This 8-bit register is value zero for retail, non-zero for dev/debug
units.

## CFG9_TWLUNITINFO

In the console-unique TWL key-init/etc function the ARM9 copies the u8
value from REG_UNITINFO to this register.

This is also used by TWL_FIRM Process9.
