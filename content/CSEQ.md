+++
title = 'CSEQ'
+++

## File Format

### Header

The header has almost the same format as CSAR files

| OFFSET | SIZE | DESCRIPTION                                                   |
|--------|------|---------------------------------------------------------------|
| 0x0    | 0x4  | Magic word "CSEQ"                                             |
| 0x4    | 0x2  | Byte order mark (0xFEFF = Big Endian, 0xFFFE = Little Endian) |
| 0x6    | 0x2  | Length of CSEQ header                                         |
| 0x8    | 0x4  | Version                                                       |
| 0xC    | 0x4  | Length of the entire CSEQ file (starting from 0x0)            |
| 0x10   | 0x4  | Amount of main partitions in the CSEQ (DATA + LABL = 2)       |
| 0x14   | 0x4  | DATA partition reference ID? (Always 0x5000)                  |
| 0x18   | 0x4  | Absolute offset of DATA partition                             |
| 0x1C   | 0x4  | Size of DATA partition                                        |
| 0x20   | 0x4  | LABL partition reference ID? (Always 0x5001)                  |
| 0x24   | 0x4  | Absolute offset of LABL partition                             |
| 0x28   | 0x4  | Size of LABL partition                                        |
| 0x2C   | 0x14 | Padding / Resevered for 2 more partitions                     |