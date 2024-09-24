+++
title = 'EMMC Registers'
+++

These registers are used to access the system
[NAND](Flash_Filesystem "wikilink") and the inserted SD card. Both
devices use the same interface. HCLK of the SDMMC controller is
67.027964 MHz (double of the DSi HCLK).

# Registers

| Old3DS | Name                                     | Address    | Width | Used by                               |
|--------|------------------------------------------|------------|-------|---------------------------------------|
| Yes    | EMMC_CMD                                 | 0x10006000 | 2     | Boot9, NewKernel9Loader, Process9     |
| Yes    | EMMC_PORTSEL                             | 0x10006002 | 2     | Port selection, 0 = SD card, 1 = NAND |
| Yes    | EMMC_CMDARG0                             | 0x10006004 | 2     |                                       |
| Yes    | EMMC_CMDARG1                             | 0x10006006 | 2     |                                       |
| Yes    | EMMC_STOP                                | 0x10006008 | 2     |                                       |
| Yes    | EMMC_BLKCOUNT                            | 0x1000600a | 2     |                                       |
| Yes    | EMMC_RESP0-7                             | 0x1000600c | 2\*8  |                                       |
| Yes    | [EMMC_STATUS0](#emmc_status0 "wikilink") | 0x1000601c | 2     |                                       |
| Yes    | EMMC_STATUS1                             | 0x1000601e | 2     |                                       |
| Yes    | ?                                        | 0x10006020 | 2     |                                       |
| Yes    | ?                                        | 0x10006022 | 2     |                                       |
| Yes    | EMMC_CLKCTL                              | 0x10006024 | 2     |                                       |
| Yes    | EMMC_BLKLEN                              | 0x10006026 | 2     |                                       |
| Yes    | EMMC_OPT                                 | 0x10006028 | 2     |                                       |
| Yes    | EMMC_FIFO                                | 0x10006030 | 2     |                                       |
| Yes    | EMMC_RESET                               | 0x100060E0 | 2     |                                       |
|        |                                          |            |       |                                       |

The IO interface for SDMC/NAND seems to be very similar to the DSi; see
libnds for [sample
code](https://github.com/devkitPro/libnds/blob/master/source/arm7/sdmmc.twl.c)
and
[documentation](https://github.com/devkitPro/libnds/blob/master/include/nds/arm7/sdmmc.h),
and GBATEK for [better
documentation](http://problemkaputt.de/gbatek.htm#dsisdmmcioportscommandparamresponsedata).

3DS SDMC/NAND IO registers are located at 0x10006000 and apparently
mirrored at 0x10007000. It seems the 0x10007000 mirror is never used on
retail units.

## EMMC_STATUS0

| Bit | Description                                                |
|-----|------------------------------------------------------------|
| 3   | SD card removal flag (Set to 1 when SD card is removed)    |
| 4   | SD card insertion flag (Set to 1 when SD card is inserted) |
| 5   | SD card insertion status (0 = missing, 1 = inserted)       |
|     |                                                            |

### SD card insertion status

Assertion happens around 250 ms after SD card insertion and/or enabling
the EMMC hardware (delay could possibly be due to an SD bus timeout?).
