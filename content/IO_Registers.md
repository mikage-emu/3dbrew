+++
title = 'IO Registers'
+++

# Overview

| Old3DS | A9/A11 | Category | Physaddr | Used by | Comments |
|----|----|----|----|----|----|
| Yes | A9 | [CONFIG9 Registers](CONFIG9_Registers "wikilink") | 0x10000000 | Boot9, Process9 |  |
| Yes | A9 | [IRQ Registers](IRQ_Registers "wikilink") | 0x10001000 | Boot9, Process9, Kernel9 | ARM9 Interrupt Masking |
| Yes | A9 | [NDMA Registers](NDMA_Registers "wikilink") | 0x10002000 | Boot9, Process9 | AHB DMA Engine |
| Yes | A9 | [TIMER Registers](TIMER_Registers "wikilink") | 0x10003000 | Boot9, Process9 |  |
| Yes | A9 | [CTRCARD Registers](CTRCARD_Registers "wikilink") | 0x10004000 / 0x10005000 | Process9 |  |
| Yes | A9 | [EMMC Registers](EMMC_Registers "wikilink") | 0x10006000 / 0x10007000 | Boot9, Process9, NewKernel9Loader | SD(IO) controller 1 and 3. 3 is normally mapped to ARM11. |
| Yes | A9 | [PXI Registers](PXI_Registers "wikilink") | 0x10008000 | Boot9, Process9 |  |
| Yes | A9 | [AES Registers](AES_Registers "wikilink") | 0x10009000 | Boot9, Process9, NewKernel9Loader |  |
| Yes | A9 | [SHA Registers](SHA_Registers "wikilink") | 0x1000A000 | Boot9, Process9, NewKernel9Loader |  |
| Yes | A9 | [RSA Registers](RSA_Registers "wikilink") | 0x1000B000 | Boot9, Process9 |  |
| Yes | A9 | [XDMA Registers](Corelink_DMA_Engines "wikilink") | 0x1000C000 | Boot9, Kernel9 | [CoreLink™ DMA-330 r0p0](http://infocenter.arm.com/help/topic/com.arm.doc.subset.primecell.system/index.html) (AXI busmaster, two channels, uses 32-bit bus width instead of 64). |
| Yes | A9 | [SPICARD Registers](SPICARD_Registers "wikilink") | 0x1000D800 | Process9 |  |
| Yes | A9 | [CONFIG Registers](CONFIG_Registers "wikilink") | 0x10010000 | Process9 |  |
| Yes | A9 | PRNG Registers | 0x10011000 | Boot9, Process9 | Used as entropy-source for seeding random number generators. |
| Yes | A9 | [OTP Registers](OTP_Registers "wikilink") | 0x10012000 | Boot9, Kernel9, NewKernel9Loader | Top secret. |
| Yes | A9 | [ARM7 Registers](ARM7 "wikilink") | 0x10018000 | TwlProcess9 | Used to setup the ARM7 core for AGB/TWL |
| Yes | A11/A9 | TMIO SD(IO) controller 3 | 0x10100000 |  | NWM references this controller but doesn't have access to it. |
| Yes | A11/A9 | [HASH Registers](HASH_Registers "wikilink") | 0x10101000 | [Filesystem services](Filesystem_services "wikilink") | These registers function the same as the [SHA Registers](SHA_Registers "wikilink"), with the exception of the FIFO being located at 0x10301000. |
| Yes | A11/A9 | [Y2R Registers](Y2R_Registers "wikilink") | 0x10102000 | [Camera Services](Camera_Services "wikilink") | y2r |
| Yes | A11/A9 | [CSND Registers](CSND_Registers "wikilink") | 0x10103000 | TwlBg, [Codec Services](Codec_Services "wikilink"), [CSND Services](CSND_Services "wikilink"), [DSP Services](DSP_Services "wikilink") | Sound hardware. |
| Yes | A11/A9 | [LgyFb bottom screen](MTX_Registers "wikilink") | 0x10110000 | TwlBg | IO registers used to access legacy output framebuffer, as well as configure the upscaling filter. |
| Yes | A11/A9 | [LgyFb top screen](MTX_Registers "wikilink") | 0x10111000 | TwlBg | IO registers used to access legacy output framebuffer, as well as configure the upscaling filter. |
| Yes | A11/A9 | [Camera Registers](Camera_Registers "wikilink") | 0x10120000 | [Camera Services](Camera_Services "wikilink") |  |
| Yes | A11/A9 | [Camera Registers](Camera_Registers "wikilink") | 0x10121000 | [Camera Services](Camera_Services "wikilink") | Mirror of 0x10120000? |
| Yes | A11/A9 | [WIFI Registers](WIFI_Registers "wikilink") | 0x10122000 | [NWM Services](NWM_Services "wikilink") | WIFI SDIO bus registers |
| Yes | A11/A9 | ? | 0x10123000 | [NWM Services](NWM_Services "wikilink") | WIFI? |
| No | A11/A9 | [MVD Registers](MVD_Registers "wikilink") | 0x10130000 | [MVD Services](MVD_Services "wikilink") |  |
| No | A11/A9 | [MVD Registers](MVD_Registers "wikilink") | 0x10131000 | [MVD Services](MVD_Services "wikilink") |  |
| No | A11/A9 | [MVD Registers](MVD_Registers "wikilink") | 0x10132000 | [MVD Services](MVD_Services "wikilink") |  |
| Yes | A11/A9 | [CONFIG11 Registers](CONFIG11_Registers "wikilink") | 0x10140000 | Process9, Boot11, Kernel11, TwlBg, [DSP Services](DSP_Services "wikilink"), [SPI Services](SPI_Services "wikilink"), [NWM Services](NWM_Services "wikilink") (until [11.4.X](11.4.0-37#nwm-sysmodule "wikilink")) | System configuration. |
| Yes | A11/A9 | [PDN Registers](PDN_Registers "wikilink") | 0x10141000 | Process9, Boot11, Kernel11, TwlBg, [Codec Services](Codec_Services "wikilink"), [NWM Services](NWM_Services "wikilink"), [SPI Services](SPI_Services "wikilink"), [PDN Services](PDN_Services "wikilink") | Power management |
| Yes | A11/A9 | [SPI Registers](SPI_Registers "wikilink") | 0x10142000 | TwlBg, [SPI Services](SPI_Services "wikilink") |  |
| Yes | A11/A9 | [SPI Registers](SPI_Registers "wikilink") | 0x10143000 | TwlBg, dmnt Module | Debugger related? |
| Yes | A11/A9 | [I2C Registers](I2C_Registers "wikilink") | 0x10144000 | Boot11, Kernel11, TwlBg, [I2C Services](I2C_Services "wikilink") | 3DS I2C interface (MCU + Cameras + LCD) |
| Yes | A11/A9 | [I2S Registers](I2S_Registers "wikilink") | 0x10145000 | TwlBg, AgbBg, [Codec Services](Codec_Services "wikilink") | Sound input/output lines |
| Yes | A11/A9 | [HID Registers](HID_Registers "wikilink") | 0x10146000 | Boot9, Boot11, Kernel11, TwlBg, [HID Services](HID_Services "wikilink"), dlp Services | See [PAD](PAD "wikilink"). |
| Yes | A11/A9 | [GPIO Registers](GPIO_Registers "wikilink") | 0x10147000 | Boot11, TwlBg, [GPIO Services](GPIO_Services "wikilink"), [DSP Services](DSP_Services "wikilink")(v0) |  |
| Yes | A11/A9 | [I2C Registers](I2C_Registers "wikilink") | 0x10148000 | TwlBg, [I2C Services](I2C_Services "wikilink") | 3DS I2C interface (Gyro + IR) |
| Yes | A11/A9 | [SPI Registers](SPI_Registers "wikilink") | 0x10160000 | Boot9, TwlBg, [SPI Services](SPI_Services "wikilink") |  |
| Yes | A11/A9 | [I2C Registers](I2C_Registers "wikilink") | 0x10161000 | Boot11, TwlBg, [I2C Services](I2C_Services "wikilink") | TWL I2C interface (MCU + Cameras) |
| Yes | A11/A9 | [MIC Registers](MIC_Registers "wikilink") | 0x10162000 | [MIC Services](MIC_Services "wikilink") |  |
| Yes | A11/A9 | [PXI Registers](PXI_Registers "wikilink") | 0x10163000 | Boot11, Kernel11, TwlBg, [PXI Services](PXI_Services "wikilink") |  |
| Yes | A11/A9 | [NTRCARD Registers](NTRCARD_Registers "wikilink") | 0x10164000 | Boot9, Process9 |  |
| Yes | A11/A9 | [MP Registers](MP_Registers "wikilink") | 0x10165000 | [MP Services](MP_Services "wikilink") |  |
| Yes | A11/A9 | [MP Registers](MP_Registers "wikilink") | 0x10170000 | [MP Services](MP_Services "wikilink") | NTR WIFI Registers, see [GBATek](http://problemkaputt.de/gbatek.htm#dswirelesscommunications). |
| Yes | A11/A9 | [MP Registers](MP_Registers "wikilink") | 0x10171000 | [MP Services](MP_Services "wikilink") | NTR WIFI Registers (mirror) |
| Yes | A11/A9 | ? | 0x10172000 | ? | NTR WIFI Unused? |
| Yes | A11/A9 | ? | 0x10173000 | ? | NTR WIFI Unused? |
| Yes | A11/A9 | [MP Registers](MP_Registers "wikilink") | 0x10174000 | [MP Services](MP_Services "wikilink") | NTR WIFI RAM |
| Yes | A11/A9 | [MP Registers](MP_Registers "wikilink") | 0x10175000 | ? | NTR WIFI RAM |
| Yes | A11/A9 | [MP Registers](MP_Registers "wikilink") | 0x10176000 | ? | NTR WIFI Registers (mirror) |
| Yes | A11/A9 | [MP Registers](MP_Registers "wikilink") | 0x10177000 | ? | NTR WIFI Registers (mirror) |
| Yes | A11/A9 | [MP Registers](MP_Registers "wikilink") | 0x10178000 - 0x10180000 | [MP Services](MP_Services "wikilink") | NTR WIFI WS1 Region |
| Yes | A11 | [CDMA](Corelink_DMA_Engines "wikilink") | 0x10200000 | Boot11, Kernel11 | [CoreLink™ DMA-330 r0p0](http://infocenter.arm.com/help/topic/com.arm.doc.subset.primecell.system/index.html) (eight channels). Only used by bootrom on New3DS. |
| Yes | A11 | FCRAM configuration | 0x10201000 | TwlBg, Kernel11 (dead code) |  |
| Yes | A11 | [LCD Registers](LCD_Registers "wikilink") | 0x10202000 | TwlBg, Kernel11, [GSP Services](GSP_Services "wikilink") |  |
| Yes | A11 | [DSP Registers](DSP_Registers "wikilink") | 0x10203000 | [DSP Services](DSP_Services "wikilink") | see the "DSi XpertTeak" section in [no\$gba](http://problemkaputt.de/gba.htm) help. |
| No | A11 | ? | 0x10204000 | ? |  |
| No | A11 | [CDMA](Corelink_DMA_Engines "wikilink") | 0x10206000 | NewKernel11 | [CoreLink™ DMA-330 r1p2](http://infocenter.arm.com/help/topic/com.arm.doc.ddi0424d/index.html) (eight channels). This is the DMA engine actually being used by the New3DS ARM11 kernel. |
| No | A11 | [MVD Registers](MVD_Registers "wikilink") | 0x10207000 | [MVD Services](MVD_Services "wikilink") | New 3DS only? |
| Yes | A11 | AXI | 0x1020F000 | TwlBg, [GSP Services](GSP_Services "wikilink") | [CoreLink™ NIC-301 r1p2](https://developer.arm.com/documentation/ddi0422/d/programmers-model/register-summary). |
| Yes | A11 | AHB (or AXI?) FIFOs region | 0x10300000-0x10340000 |  | Pages present in this region correspond to the same respective devices in the 0x10100000-0x10140000 region but don't hold the same registers. They hold the FIFOs instead: the HASH FIFO register is located at 0x10301000. The LgyFb scaler data FIFO are located at 0x10310000 (top) and 0x10311000 (bot), etc. Needed for DMA. |
| Yes | A11 | [GPU Registers](GPU/External_Registers "wikilink") | 0x10400000 | Boot11, Kernel11, [GSP Services](GSP_Services "wikilink") |  |

IO registers starting at physical address 0x10200000 are not accessible from the ARM9 (which includes all LCD/GPU registers). It seems IO registers below physical address 0x10100000 are not accessible from the ARM11 bus.

ARM11 kernel virtual address mappings for these registers varies for different builds. For ARM11 user mode applications you have:

```
physaddr = virtaddr - 0x1EC00000 + 0x10100000
```
