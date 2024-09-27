+++
title = 'IRQ Registers'
+++

# Registers

| Old3DS | Name                         | Address    | Width | Used by        |
|--------|------------------------------|------------|-------|----------------|
| Yes    | [IRQ_IE](#IRQ_IE "wikilink") | 0x10001000 | 4     | Boot9, Kernel9 |
| Yes    | [IRQ_IF](#IRQ_IF "wikilink") | 0x10001004 | 4     | Boot9, Kernel9 |

## IRQ_IE

Bitfield with enabled interrupts. See below for the IRQ\<-\>bit mapping.

## IRQ_IF

Bitfield with pending interrupts. See below for the IRQ\<-\>bit mapping.

Returns the pending interrupt bits on read, clears them on write
(writing 0-bits has no effect).

## Interrupts

| IRQ bit | Description           |
|---------|-----------------------|
| 0       | DMAC_1_0              |
| 1       | DMAC_1_1              |
| 2       | DMAC_1_2              |
| 3       | DMAC_1_3              |
| 4       | DMAC_1_4              |
| 5       | DMAC_1_5              |
| 6       | DMAC_1_6              |
| 7       | DMAC_1_7              |
| 8       | TIMER_0               |
| 9       | TIMER_1               |
| 10      | TIMER_2               |
| 11      | TIMER_3               |
| 12      | PXI_SYNC              |
| 13      | PXI_NOT_FULL          |
| 14      | PXI_NOT_EMPTY         |
| 15      | AES                   |
| 16      | SDIO_1                |
| 17      | SDIO_1_ASYNC          |
| 18      | SDIO_3                |
| 19      | SDIO_3_ASYNC          |
| 20      | DEBUG_RECV            |
| 21      | DEBUG_SEND            |
| 22      | [RSA](RSA "wikilink") |
| 23      | CTR_CARD_1            |
| 24      | CTR_CARD_2            |
| 25      | CGC                   |
| 26      | CGC_DET               |
| 27      | DS_CARD               |
| 28      | DMAC_2                |
| 29      | DMAC_2_ABORT          |