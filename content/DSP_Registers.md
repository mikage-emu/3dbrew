+++
title = 'DSP Registers'
+++

# Registers

| Old3DS | Name                                 | Physical Address | Width | Used by |
|--------|--------------------------------------|------------------|-------|---------|
| Yes    | [DSP_PDATA](#dsp_pdata "wikilink")   | 0x10203000       | 2     |         |
| Yes    | [DSP_PADR](#dsp_padr "wikilink")     | 0x10203004       | 2     |         |
| Yes    | [DSP_PCFG](#dsp_pcfg "wikilink")     | 0x10203008       | 2     |         |
| Yes    | [DSP_PSTS](#dsp_psts "wikilink")     | 0x1020300C       | 2     |         |
| Yes    | [DSP_PSEM](#dsp_psem "wikilink")     | 0x10203010       | 2     |         |
| Yes    | [DSP_PMASK](#dsp_pmask "wikilink")   | 0x10203014       | 2     |         |
| Yes    | [DSP_PCLEAR](#dsp_pclear "wikilink") | 0x10203018       | 2     |         |
| Yes    | [DSP_SEM](#dsp_sem "wikilink")       | 0x1020301C       | 2     |         |
| Yes    | [DSP_CMD0](#dsp_cmd0 "wikilink")     | 0x10203020       | 2     |         |
| Yes    | [DSP_REP0](#dsp_rep0 "wikilink")     | 0x10203024       | 2     |         |
| Yes    | [DSP_CMD1](#dsp_cmd1 "wikilink")     | 0x10203028       | 2     |         |
| Yes    | [DSP_REP1](#dsp_rep1 "wikilink")     | 0x1020302C       | 2     |         |
| Yes    | [DSP_CMD2](#dsp_cmd2 "wikilink")     | 0x10203030       | 2     |         |
| Yes    | [DSP_REP2](#dsp_rep2 "wikilink")     | 0x10203034       | 2     |         |

## DSP_PDATA

Data (one stage of the 16-stage Read FIFO).

## DSP_PADR

Lower 16bit of Address in DSP Memory. Note: The upper 16bit of Address
must be configued in the DMA register (inside of the DSP).

## DSP_PCFG - DSP Configuration (R/W) (16bit)

| Bits  | Description                                                            |
|-------|------------------------------------------------------------------------|
| 0     | DSP Reset (0=Release, 1=Reset) ;should be held "1" for 8 DSP clks      |
| 1     | Address Auto-Increment (0=Off, 1=On)                                   |
| 2-3   | DSP Read Data Length (0=1 word, 1=8 words, 2=16 words, 3=Free-Run)     |
| 4     | DSP Read Start Flag (mem transfer via Read FIFO) (1=Start)             |
| 5     | Interrupt Enable Read FIFO Full (0=Off, 1=On)                          |
| 6     | Interrupt Enable Read FIFO Not-Empty (0=Off, 1=On)                     |
| 7     | Interrupt Enable Write FIFO Full (0=Off, 1=On)                         |
| 8     | Interrupt Enable Write FIFO Empty (0=Off, 1=On)                        |
| 9     | Interrupt Enable Reply Register 0 (0=Off, 1=On)                        |
| 10    | Interrupt Enable Reply Register 1 (0=Off, 1=On)                        |
| 11    | Interrupt Enable Reply Register 2 (0=Off, 1=On)                        |
| 12-15 | DSP Memory Transfer (0=Data Memory, 1=MMIO Register, 5=Program Memory) |

## DSP_PSTS

| Bits | Description                                                      |
|------|------------------------------------------------------------------|
| 0    | Read Transfer Underway Flag (0=No, 1=Yes/From DSP Memory)        |
| 1    | Write Transfer Underway Flag (0=No, 1=Yes/To DSP Memory)         |
| 2    | Peripheral Reset Flag (0=No/Ready, 1=Reset/Busy)                 |
| 3-4  | Unused                                                           |
| 5    | Read FIFO Full Flag (0=No, 1=Yes)                                |
| 6    | Read FIFO Not-Empty Flag (0=No, 1=Yes) ;ARM11 may read DSP_PDATA |
| 7    | Write FIFO Full Flag (0=No, 1=Yes)                               |
| 8    | Write FIFO Empty Flag (0=No, 1=Yes)                              |
| 9    | Semaphore IRQ Flag (0=None, 1=IRQ)                               |
| 10   | Reply Register 0 Update Flag (0=Was Written by DSP, 1=No)        |
| 11   | Reply Register 1 Update Flag (0=Was Written by DSP, 1=No)        |
| 12   | Reply Register 2 Update Flag (0=Was Written by DSP, 1=No)        |
| 13   | Command Register 0 Read Flag (0=Was Read by DSP, 1=No)           |
| 14   | Command Register 1 Read Flag (0=Was Read by DSP, 1=No)           |
| 15   | Command Register 2 Read Flag (0=Was Read by DSP, 1=No)           |

Unknown if/when bit10-15 get reset... maybe after reading the status?

## DSP_PSEM

DSP-to-ARM11 Semaphore 0..15 Flags (0=Off, 1=On). Reportedly these flags
are sent in ARM11-to-DSP direction. Confusingly, the other DSP_Pxxx
registers are for opposite direction?

## DSP_PMASK

DSP-to-ARM11 Semaphore 0..15 Interrupt Disable (0=Enable, 1=Disable)

## DSP_PCLEAR

DSP-to-ARM11 Semaphore 0..15 Clear (0=No Change, 1=Clear). Reportedly
clears bits in DSP_PSEM. \[that's probably nonsense, clearing bits in
DSP_SEM would make more sense\]

## DSP_SEM

DSP-to-ARM11 Semaphore 0..15 Flags (0=Off, 1=On). Reportedly these flags
are received in DSP-to-ARM11 direction.

## DSP_CMDX

Command/Data to DSP.

## DSP_REPX

Reply/Data from DSP.
