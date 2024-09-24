+++
title = 'GFCP'
+++

**GFCP** is a container for compression.

## File Format

### Header

| Offset | Size | Type      | Description                                                    |
|--------|------|-----------|----------------------------------------------------------------|
| 0x00   | 4    | char\[4\] | Magic Word 'GFCP'                                              |
| 0x04   | 4    | uint32    | Always 1                                                       |
| 0x08   | 4    | uint32    | Compression type/algorithm which was used to compress the data |
| 0x0C   | 4    | uint32    | Raw/Uncompressed data size                                     |
| 0x10   | 4    | uint32    | Compressed data size                                           |

The remaining data is the compressed data. It should have the same size
as stated in the *Compressed data size* field of the header.

### Algorithms

| ID  | Algorithm                                                             |
|-----|-----------------------------------------------------------------------|
| 1   | byte pair encoding                                                    |
| 2   | LZ77                                                                  |
| 3   | [LZ77](https://wiibrew.org/wiki/LZ77) Version 0x10 but without header |