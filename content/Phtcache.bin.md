+++
title = 'Phtcache.bin'
+++

## File Header

| Offset | Size                       | Description                                                                                                                   |
|--------|----------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x8                        | Always "1UJQ00_1"                                                                                                             |
| 0x8    | 0x4                        | Number of Pictures + 1                                                                                                        |
| 0xC    | 0x2                        | Total number of photo entries(including unused entries) stored here, this is normally value 3000 (500 on NAND).               |
| 0xE    | 0x2                        | This u16 must be \< 2, this is normally value 1 (0 for NAND).                                                                 |
| 0x10   | 0x2                        | Unknown, normally value zero.                                                                                                 |
| 0x12   | 0x2                        | Total number of photos(used entries), excluding 2D dups.                                                                      |
| 0x14   | 0x2                        | CRC16 over the entire file with this CRC field set to zero when calculating the CRC, with initialval=0 and polynomial=0xA001. |
| 0x16   | 0x2                        | Size of this header, must be \>=0x18(this is always value 0x18).                                                              |
| 0x18   | 0x98 \* Number of Pictures | Pictures Property, index refereed by 3DS Camera                                                                               |

The phtcache.bin actual filesize must be at least the following size:
hdrsizefield + totalstoredentries\*0x98.

## Pictures Property

| Offset | Size    | Description                                                         |
|--------|---------|---------------------------------------------------------------------|
| 0x0    | 0x04    | Null-terminated file extension: MPO, JPG, or AVI.                   |
| 0x4    | 0x8     | Image file name, without the extension.                             |
| 0xC    | 0x8     | Directory name under the DCIM directory.                            |
| 0x14   | 0x4     | Time taken based on "DS epoch" (start of 1/1/2000) (UNIX+946684800) |
| 0x1C   | 0x4     | Time last viewed?                                                   |
| 0x24   | 0x4     | ?                                                                   |
| 0x28   | 0x4     | ?                                                                   |
| 0x2C   | 0x4     | ?                                                                   |
| 0x30   | 0x4     | ?                                                                   |
| 0x34   | 0x4     | ?                                                                   |
| 0x38   | 0x4     | ?                                                                   |
| 0x3C   | 0x4     | ?                                                                   |
| 0x40   | 0x4     | File size                                                           |
| 0x50   | 0x18\*4 | 4 blocks, where each block is 0x18-bytes.                           |