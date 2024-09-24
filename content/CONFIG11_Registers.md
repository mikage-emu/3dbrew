+++
title = 'CONFIG11 Registers'
+++

# Registers

| Old3DS | Name                                                                      | Address    | Width | Used by                                                   |
|--------|---------------------------------------------------------------------------|------------|-------|-----------------------------------------------------------|
| Yes    | [CFG11_SHAREDWRAM_32K_CODE](#cfg11_sharedwram_32k_code "wikilink")\<0-7\> | 0x10140000 | 1\*8  | boot11, process9, [dsp services](dsp_services "wikilink") |
| Yes    | [CFG11_SHAREDWRAM_32K_DATA](#cfg11_sharedwram_32k_data "wikilink")\<0-7\> | 0x10140008 | 1\*8  | boot11, process9, [dsp services](dsp_services "wikilink") |
| Yes    | [CFG11_NULLPAGE_CNT](#cfg11_nullpage_cnt "wikilink")                      | 0x10140100 | 4     |                                                           |
| Yes    | [CFG11_FIQ_MASK](#cfg11_fiq_mask "wikilink")                              | 0x10140104 | 1     | Kernel11.                                                 |
| Yes    | Debug related bitfield? Observed: 0b1100(N3DS)/0b0000(O3DS)               | 0x10140105 | 1     |                                                           |
| Yes    | [CFG_CDMA_CNT](#cfg11_cdma_cnt "wikilink")                                | 0x1014010C | 2     | TwlBg                                                     |
| Yes    | [CFG11_GPUPROT](#cfg11_gpuprot "wikilink")                                | 0x10140140 | 4     | Kernel11                                                  |
| Yes    | [CFG11_WIFICNT](#cfg11_wificnt "wikilink")                                | 0x10140180 | 1     | twlbg, [nwm services](nwm_services "wikilink")            |
| Yes    | [CFG11_SPI_CNT](#cfg11_spi_cnt "wikilink")                                | 0x101401c0 | 2     | [spi services](spi_services "wikilink"), TwlBg            |
| Yes    | ?                                                                         | 0x10140200 | 4     |                                                           |
| No     | [CFG11_GPU_N3DS_CNT](#cfg11_gpu_n3ds_cnt "wikilink")                      | 0x10140400 | 1     | NewKernel11                                               |
| No     | [CFG11_CDMA_PERIPHERALS](#cfg11_cdma_peripherals "wikilink")              | 0x10140410 | 4     | NewKernel11                                               |
| No     | [CFG11_BOOTROM_OVERLAY_CNT](#cfg11_bootrom_overlay_cnt "wikilink")        | 0x10140420 | 1     | NewKernel11                                               |
| No     | [CFG11_BOOTROM_OVERLAY_VAL](#cfg11_bootrom_overlay_val "wikilink")        | 0x10140424 | 4     | NewKernel11                                               |
| No     | ?                                                                         | 0x10140428 | 4     |                                                           |
| Yes    | [CFG11_SOCINFO](#cfg11_socinfo "wikilink")                                | 0x10140FFC | 2     | Boot11, Kernel11                                          |

## CFG11_SHAREDWRAM_32K_CODE

Used for mapping 32K chunks of shared WRAM for DSP data.

| Bits | Description                                                 |
|------|-------------------------------------------------------------|
| 0-1  | Master (0=ARM9?, 1=ARM11?, 2 or 3=DSP/code)                 |
| 2-4  | Offset (0..7) (slot 0..7) (LSB of address in 32Kbyte units) |
| 5-6  | Not used (0)                                                |
| 7    | Enable (0=Disable, 1=Enable)                                |

## CFG11_SHAREDWRAM_32K_DATA

Used for mapping 32K chunks of shared WRAM for DSP data.

| Bits | Description                                                 |
|------|-------------------------------------------------------------|
| 0-1  | Master (0=ARM9?, 1=ARM11?, 2 or 3=DSP/data)                 |
| 2-4  | Offset (0..7) (slot 0..7) (LSB of address in 32Kbyte units) |
| 5-6  | Not used (0)                                                |
| 7    | Enable (0=Disable, 1=Enable)                                |

## CFG11_NULLPAGE_CNT

| Bit | Description                                                    |
|-----|----------------------------------------------------------------|
| 0   | Trap all *data* accesses to physmem addresses 0x0000 to 0x1000 |
| 16  | Unknown                                                        |

The reset value of this register is 0x10000.

## CFG11_FIQ_MASK

Write bit N to mask FIQ interrutps on core N? (judging from what
Kernel11 does -- it only ever configures FIQ for core1)

Reset value: 0xF

## CFG11_CDMA_CNT

Write 1 to enable, to disable.

| Bits | Description                                  |
|------|----------------------------------------------|
| 0    | Enable Microphone DMA (CDMA 0x00)            |
| 1    | Enable NTRCARD DMA on Arm11 side (CDMA 0x01) |
| 2-4  | ?                                            |
| 5    | WiFi. Enabled during kernel init since 11.4. |

## CFG11_SPI_CNT

When the corresponding bit is 0, the bus has to be accessed using the DS
SPI registers. Otherwise it has to be accessed using the 3DS SPI
registers.

| Bit | Description                                                  |
|-----|--------------------------------------------------------------|
| 0   | Enable [SPI Registers](SPI_Registers "wikilink") 0x10160800. |
| 1   | Enable [SPI Registers](SPI_Registers "wikilink") 0x10142800. |
| 2   | Enable [SPI Registers](SPI_Registers "wikilink") 0x10143800. |

## CFG11_GPU_N3DS_CNT

| Bit | Description                                                            |
|-----|------------------------------------------------------------------------|
| 0   | Enable N3DS mode? (enables access to the extra N3DS FCRAM banks, etc.) |
| 1   | Texture related? (observing texture glitches when disabling this bit)  |

## CFG11_CDMA_PERIPHERALS

| Bit   | Description                                                            |
|-------|------------------------------------------------------------------------|
| 0-17  | CDMA Peripheral 0x00-0x11 data request target (0=Old CDMA, 1=New CDMA) |
| 18-31 | Unused                                                                 |

## CFG11_BOOTROM_OVERLAY_CNT

Bit0: Enable bootrom overlay functionality.

## CFG11_BOOTROM_OVERLAY_VAL

The 32-bit value to overlay data-reads to bootrom with. See
[PDN_LGR_CPU_CNT](PDN_Registers#PDN_LGR_CPU_CNT<0-3> "wikilink")\<0-3\>.

## CFG11_SOCINFO

Read-only register. Identifies the maximum mode-switching capabilities
of the SoC.

- CTR: O3DS
- LGR1: N3DS prototype, 4 cores (orginally 2), up to 535MHz, no L2C (see
  below)
- LGR2: retail N3DS, 4 cores, up to 804MHz, has L2C

Kernel code suggests that devices that support LGR1 but not LGR2 only
had 2 cores. All cores (the number of which can be read from MPCORE SCU
registers) are usable in LGR1 mode.

| Bits | Description                                                 | Used by  |
|------|-------------------------------------------------------------|----------|
| 0    | CTR mode (1 on all 3DSes)                                   | Boot11   |
| 1    | LGR1 (1 on all N3DSes, orginally 2 cores, and 2x clockrate) | Kernel11 |
| 2    | LGR2 (1 on all released N3DSes, 4 cores and 3x clockrate)   | Kernel11 |

## CFG11_GPUPROT

| Old3DS | Bits  | Description                                   |
|--------|-------|-----------------------------------------------|
| Yes    | 3-0   | Old FCRAM DMA cutoff size, 0 = no protection. |
| No     | 7-4   | New FCRAM DMA cutoff size, 0 = no protection. |
| Yes    | 8     | AXIWRAM protection, 0 = accessible.           |
| No     | 10-9  | QTM DMA cutoff size                           |
| Yes    | 31-11 | Zeroes                                        |

For the old FCRAM DMA cutoff, it protects starting from
0x28000000-(0x800000\*x) until end of FCRAM. There is no way to protect
the first 0x800000-bytes.

For the new FCRAM DMA cutoff, it protects starting from
0x30000000-(0x800000\*x) until end of FCRAM. When the old FCRAM cutoff
is set to non-zero, the first 0x800000-bytes bytes of new FCRAM are
protected.

On New3DS the old+new FCRAM cutoff can be used at the same time, however
this isn't done officially.

For the QTM DMA cutoff, it protects starting from
0x1F400000-(0x100000\*x) until end of QTM mem.

On cold boot this reg is set to 0.

When this register is set to value 0, the GPU can access the entire
FCRAM, AXIWRAM, and on New3DS all QTM-mem.

[Initialized](SVC "wikilink") during kernel boot, and used with
[SVC](SVC "wikilink") 0x59 which was implemented with
[v11.3](11.3.0-36 "wikilink").

## CFG11_WIFICNT

| Old3DS | Bits | Description           |
|--------|------|-----------------------|
| Yes    | 0    | Enable wifi subsystem |