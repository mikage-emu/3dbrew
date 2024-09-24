+++
title = 'NDMA Registers'
+++

3DS NDMA has 8 channels. The first 0x100-bytes of this IO mem is
mirrored at 0x10002100, repeated every 0x100-bytes until the end of the
0x1000-byte IO mem. NDMA can access the Arm9 bootrom, including the
protected part before it is locked out.

# Registers

| Old3DS | Name                                                  | Address                | Width | Used by        |
|--------|-------------------------------------------------------|------------------------|-------|----------------|
| Yes    | [NDMA_GLOBAL_CNT](#NDMA_GLOBAL_CNT "wikilink")        | 0x10002000             | 4     | Boot9, Kernel9 |
| Yes    | [NDMA_SRC_ADDR](#NDMA_SRC_ADDR "wikilink")(n)         | 0x10002004 + (n\*0x1c) | 4     | Boot9, Kernel9 |
| Yes    | [NDMA_DST_ADDR](#NDMA_DST_ADDR "wikilink")(n)         | 0x10002008 + (n\*0x1c) | 4     | Boot9, Kernel9 |
| Yes    | [NDMA_TRANSFER_CNT](#NDMA_TRANSFER_CNT "wikilink")(n) | 0x1000200c + (n\*0x1c) | 4     | Boot9, Kernel9 |
| Yes    | [NDMA_WRITE_CNT](#NDMA_WRITE_CNT "wikilink")(n)       | 0x10002010 + (n\*0x1c) | 4     | Boot9, Kernel9 |
| Yes    | [NDMA_BLOCK_CNT](#NDMA_BLOCK_CNT "wikilink")(n)       | 0x10002014 + (n\*0x1c) | 4     | Boot9, Kernel9 |
| Yes    | [NDMA_FILL_DATA](#NDMA_FILL_DATA "wikilink")(n)       | 0x10002018 + (n\*0x1c) | 4     | Boot9, Kernel9 |
| Yes    | [NDMA_CNT](#NDMA_CNT "wikilink")(n)                   | 0x1000201C + (n\*0x1c) | 4     | Boot9, Kernel9 |

## NDMA_GLOBAL_CNT

| Bit   | Description                                           |
|-------|-------------------------------------------------------|
| 0     | Global enable?                                        |
| 19-16 | Cycle selection.                                      |
| 31    | DMA arbitration method. 0=Fixed method, 1=Round robin |

## NDMA_SRC_ADDR

| Bit  | Description                                 |
|------|---------------------------------------------|
| 31-0 | Source data address. Must be multiple of 4. |

Like old DMA, NDMA_SRC_ADDR is copied to internal registers when written
to.

## NDMA_DST_ADDR

| BIT  | DESCRIPTION                                      |
|------|--------------------------------------------------|
| 31-0 | Destination data address. Must be multiple of 4. |

Like old DMA, NDMA_DST_ADDR is copied to internal registers when written
to.

## NDMA_TRANSFER_CNT

| Bit  | Description                        |
|------|------------------------------------|
| 27-0 | Total number of words transferred. |

## NDMA_WRITE_CNT

| Bit  | Description                  |
|------|------------------------------|
| 23-0 | Number of words to transfer. |

## NDMA_BLOCK_CNT

| Bit   | Description                                                           |
|-------|-----------------------------------------------------------------------|
| 15-0  | Interval timer.                                                       |
| 17-16 | Prescaler. 0=System freq, 1=1/4th freq, 2=1/16th freq, 3=1/64th freq. |

## NDMA_FILL_DATA

| Bit  | Description |
|------|-------------|
| 31-0 | Fill data.  |

## NDMA_CNT

| Bit   | Description                                                                                 |
|-------|---------------------------------------------------------------------------------------------|
| 4-0   | Device to device startup mode                                                               |
| 11-10 | Destination address update method. 0=Increment, 1=Decrement, 2=Fixed.                       |
| 12    | Destination address reload flag.                                                            |
| 14-13 | Source address update method. 0=Increment, 1=Decrement, 2=Fixed, 3=No address (for filling) |
| 15    | Source address reload flag.                                                                 |
| 19-16 | Block transfer word count = (1\<\<x) words.                                                 |
| 27-24 | Startup mode.                                                                               |
| 28    | Immediate mode.                                                                             |
| 29    | Repeating mode.                                                                             |
| 30    | IRQ enable                                                                                  |
| 31    | Enable/busy flag.                                                                           |

## Startup modes (4-0)

| Value | Description                                                                      |
|-------|----------------------------------------------------------------------------------|
| 0     | TIMER0                                                                           |
| 1     | TIMER1                                                                           |
| 2     | TIMER2                                                                           |
| 3     | TIMER3                                                                           |
| 4     | CTRCARD0                                                                         |
| 5     | CTRCARD1                                                                         |
| 6     | SDIO1                                                                            |
| 7     | SDIO3                                                                            |
| 8     | AES in ([WRFIFO](AES_Registers#AES_WRFIFO.2FAES_RDFIFO "wikilink"))              |
| 9     | AES out ([RDFIFO](AES_Registers#AES_WRFIFO.2FAES_RDFIFO "wikilink"))             |
| 10    | SHA in ([INFIFO](SHA_Registers#SHA_FIFO "wikilink"))                             |
| 11    | SHA out ([INFIFO](SHA_Registers#SHA_FIFO "wikilink"), source data readback mode) |
| 12    | NTRCARD                                                                          |
| 13    | ?                                                                                |
| 14    | ?                                                                                |
| 15    | Device to device (subclassed by bits 4-0)                                        |

## Device to device startup modes (4-0)

| Value | Description      |
|-------|------------------|
| 0     | CTRCARD0 -\> AES |
| 1     | CTRCARD1 -\> AES |
| 2     | AES -\> CTRCARD0 |
| 3     | AES -\> CTRCARD1 |
| 4     | CTRCARD0 -\> SHA |
| 5     | CTRCARD1 -\> SHA |
| 6     | SHA -\> CTRCARD0 |
| 7     | SHA -\> CTRCARD1 |
| 8     | SDIO1 -\> AES    |
| 9     | SDIO3 -\> AES    |
| 10    | AES -\> SDIO1    |
| 11    | AES -\> SDIO3    |
| 12    | SDIO1 -\> SHA    |
| 13    | SDIO3 -\> SHA    |
| 14    | SHA -\> SDIO1    |
| 15    | SHA -\> SDIO3    |
| 16    | AES -\> SHA      |
| 17    | SHA -\> AES      |

## Block transfers

First, a word is always 32 bits. Second, the block transfer specified in
NDMA_CNT is the smallest atom of data that will be transferred in a
burst. The bus is monopolized until this block is transferred, without
splitting up.

The next block transfer will happen after the specified time in the
NDMA_BLOCK_CNT interval timer, until done.

## Immediate mode

Transfers the words specified in NDMA_WRITE_CNT immediately following
block transfer rules. NDMA_TRANSFER_CNT and repeating mode are ignored.

## Repeating mode

Transfers the words specified in NDMA_WRITE_CNT following the startup
mode event. NDMA_TRANSFER_CNT is ignored.

## No immediate and no repeating mode

Transfers the words specified in NDMA_WRITE_CNT for each startup event,
and gets disabled when the total number of words in NDMA_TRANSFER_CNT
are transferred.