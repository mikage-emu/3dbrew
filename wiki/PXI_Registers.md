# Registers

| Old3DS | Name                               | Address    | Width | Used by         |
|--------|------------------------------------|------------|-------|-----------------|
| Yes    | [PXI_SYNC](#PXI_SYNC "wikilink")9  | 0x10008000 | 4     | Boot9, Process9 |
| Yes    | [PXI_CNT](#PXI_CNT "wikilink")9    | 0x10008004 | 2     | Boot9, Process9 |
| Yes    | PXI_SEND9                          | 0x10008008 | 4     |                 |
| Yes    | PXI_RECV9                          | 0x1000800C | 4     |                 |
| Yes    | [PXI_SYNC](#PXI_SYNC "wikilink")11 | 0x10163000 | 4     | Boot11          |
| Yes    | [PXI_CNT](#PXI_CNT "wikilink")11   | 0x10163004 | 2     | Boot11          |
| Yes    | PXI_SEND11                         | 0x10163008 | 4     |                 |
| Yes    | PXI_RECV11                         | 0x1016300C | 4     |                 |

The PXI registers are similar to those on DS.

## PXI_SYNC

| Bit  | RW  | Description                                                        |
|------|-----|--------------------------------------------------------------------|
| 0-7  | R   | Data received from remote bits 8-15 (unrelated to SEND/RECV FIFOs) |
| 8-15 | R/W | Data sent to remote bits 0-7                                       |
| 23   | ?   | ?                                                                  |
| 29   | W?  | Trigger PXI_SYNC11 IRQ (if enabled)                                |
| 30   | W?  | Trigger PXI_SYNC9 IRQ (if enabled)                                 |
| 31   | RW  | PXI_SYNC IRQ enable (for local processor)                          |

This can also be accessed as 4 u8 registers.

## PXI_CNT

| Bit | RW  | Description                                                   |
|-----|-----|---------------------------------------------------------------|
| 0   | R   | Send Fifo Empty Status (0=Not Empty, 1=Empty)                 |
| 1   | R   | Send Fifo Full Status (0=Not Full, 1=Full)                    |
| 2   | R/W | Send Fifo Empty IRQ (0=Disable, 1=Enable)                     |
| 3   | W   | Send Fifo Clear (0=Nothing, 1=Flush Send Fifo)                |
| 8   | R   | Receive Fifo Empty (0=Not Empty, 1=Empty)                     |
| 9   | R   | Receive Fifo Full (0=Not Full, 1=Full)                        |
| 10  | R/W | Receive Fifo Not Empty IRQ (0=Disable, 1=Enable)              |
| 14  | R/W | Error, Read Empty/Send Full (0=No Error, 1=Error/Acknowledge) |
| 15  | R/W | Enable Send/Receive Fifo (0=Disable, 1=Enable)                |