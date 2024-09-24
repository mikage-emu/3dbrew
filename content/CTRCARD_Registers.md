# Registers

| Old3DS | Name                                         | Address    | Width | Used by  |
|--------|----------------------------------------------|------------|-------|----------|
| Yes    | [CTRCARD_CNT](#CTRCARD_CNT "wikilink")       | 0x10004000 | 4     | Process9 |
| Yes    | [CTRCARD_BLKCNT](#CTRCARD_BLKCNT "wikilink") | 0x10004004 | 4     | Process9 |
| Yes    | [CTRCARD_SECCNT](#CTRCARD_SECCNT "wikilink") | 0x10004008 | 4     | Process9 |
| Yes    | CTRCARD_SECSEED                              | 0x10004010 | 4     | Process9 |
| Yes    | [CTRCARD_CMD](#CTRCARD_CMD "wikilink")       | 0x10004020 | 16    | Process9 |
| Yes    | CTRCARD_FIFO                                 | 0x10004030 | 4     | Process9 |

## CTRCARD_CNT

| Bit   | Description                                                                                           |
|-------|-------------------------------------------------------------------------------------------------------|
| 3-0   | ?                                                                                                     |
| 4     | CRC status (1=Error, 0=OK)?                                                                           |
| 15-5  | ?                                                                                                     |
| 19-16 | Transfer size (0=0 bytes, 1=4 bytes, 2=0x10 bytes, 0x40, 0x200, 0x400, 0x800, 0x1000, 8=0x4000 bytes) |
| 23-20 | ?                                                                                                     |
| 26-24 | Clock delay (0..5)                                                                                    |
| 27    | Data ready (1=Ready, 0=Busy)                                                                          |
| 28    | Reset (1=High, 0=Low)                                                                                 |
| 29    | Transfer mode (1=Write, 0=Read)                                                                       |
| 30    | Interrupt enable (1=Enable, 0=Disable)                                                                |
| 31    | Start (1=Busy, 0=Idle)                                                                                |

### Remarks

Once reset is set high, it cannot be changed until controller is reset.

## CTRCARD_BLKCNT

| Bit   | Description                             |
|-------|-----------------------------------------|
| 15-0  | Total data blocks to read from FIFO - 1 |
| 31-16 | Total data blocks to write to FIFO - 1  |

## CTRCARD_SECCNT

| Bit | Description     |
|-----|-----------------|
| 2   | Latch key index |
| 9-8 | Key index       |
| 15  | Latch seed      |

## CTRCARD_CMD

Specifies the 16-byte command to send. The command is split into 32-bit
words, and stored as least significant word first, with each word itself
in big-endian format.