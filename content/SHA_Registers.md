# Registers

| Old3DS | Name                                 | Address    | Width | Used by         |
|--------|--------------------------------------|------------|-------|-----------------|
| Yes    | [SHA_CNT](#SHA_CNT "wikilink")       | 0x1000A000 | 4     | Boot9, Process9 |
| Yes    | [SHA_BLKCNT](#SHA_BLKCNT "wikilink") | 0x1000A004 | 4     | Process9        |
| Yes    | [SHA_HASH](#SHA_HASH "wikilink")     | 0x1000A040 | 0x20  | Process9        |
| Yes    | [SHA_FIFO](#SHA_FIFO "wikilink")     | 0x1000A080 | 0x40  | Boot9, Process9 |

## SHA_CNT

| Bits | Description                                                                                 |
|------|---------------------------------------------------------------------------------------------|
| 0    | Start (1=enable/busy, 0=idle)                                                               |
| 1    | Final round (1=enable/busy, 0=normal)                                                       |
| 2    | Input DMA enable (1= enable, 0=disable)                                                     |
| 3    | Output Endianess (0=little, 1=big)                                                          |
| 4-5  | Mode (0=SHA256, 1=SHA224, 2=3=SHA1)                                                         |
| 6    | ?                                                                                           |
| 7    | ?                                                                                           |
| 8    | Clear FIFO? When set, the \*entire\* ARM9 hangs/crashes when attempting to read SHA_INFIFO. |
| 9    | Enable FIFO (1=fifo, 0=write-only)                                                          |
| 10   | Output DMA enable (1= enable, 0=disable)                                                    |
| 16   | ?                                                                                           |
| 17   | ?                                                                                           |

Bit 8 is used when boot9 chains eMMC reads with AES and SHA to to load,
decrypt and verify FIRM partitions.

## SHA_BLKCNT

This reg contains the total size of the data written to REG_SHA_IN, this
field is updated when performing hash-function final-round.

## SHA_HASH

This reg contains the SHA\* hash after the final round, and the internal
state during normal rounds. It is possible to write the internal state
using this register.

## SHA_FIFO

The data to be hashed must be written here. It does not matter what
offset is written to.