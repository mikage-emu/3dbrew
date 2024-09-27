+++
title = 'Swapdoodle'
+++

**Swapdoodle** is the successor of the [Swapnote](Swapnote "wikilink")
application that allows you to send doodles to friends using SpotPass.

*Credits for Miles (with the BPK1 structures) and MrNbaYoh (with the
custom CRC32 checksum) for providing information!*

## [SpotPass](SpotPass "wikilink") usage

Currently, only these SpotPass endpoints are known to exist:

- https://npdl.cdn.nintendowifi.net/p01/nsa/\<regionID\>/RNG_LS1/dstsetting
  LZ10 compressed BPK1 structure
- https://npdl.cdn.nintendowifi.net/p01/nsa/\<regionID\>/RNG_EC1/x.dlp
  BPK1 structure with all game lessons (x = 1, 2 or 3)
- https://npdl.cdn.nintendowifi.net/p01/nsa/\<regionID\>/RNG_MD1/dstdatList.bin
  BPK1 structure with game metadata
- https://npdl.cdn.nintendowifi.net/p01/nsa/\<regionID\>/RNG_NTX/\<language\>/ntx
  For game notifications (x = 1 or 2)

Where regionID goes the value from the below table.

| Region | ID               |
|--------|------------------|
| USA    | 0hFlOFo7pNTU2dyE |
| EUR    | 3vveLadT8H6xKkQH |

Also, the game uses
Hpp[1](https://github.com/kinnay/NintendoClients/wiki/Hpp-Server)
servers for posting doodles and making status updates.

## BPK1

The BPK1 structure is used in almost all game data files. Some of the
files that use this structure are LZ10 compressed (like the ones used
for doodles and stationery).

The structure starts with a BPK1 header, followed by all of its block
headers, which can share names between each other. The headers are the
followed by each block's data, which can hold any data (including
another BPK1 structure).

All of the structure entries are stored as little-endian data.

| Offset | Size | Description              |
|--------|------|--------------------------|
| 0x0    | 0x44 | BPK1 header              |
| 0x44   |      | Block header             |
|        |      | Additional block headers |
|        |      | Block data               |
|        |      | Additional blocks data   |

### BPK1 header

| Offset | Size | Description               |
|--------|------|---------------------------|
| 0x0    | 0x4  | Header magic (BPK1)       |
| 0x4    | 0x4  | Number of blocks          |
| 0x8    | 0x4  | Maximum block name length |
| 0xC    | 0x4  | Structure length          |
| 0x10   | 0x4  | Header length             |
| 0x14   | 0x2C | Padding                   |
| 0x40   | 0x4  | Header length             |

### Block header

| Offset | Size | Description                                                  |
|--------|------|--------------------------------------------------------------|
| 0x0    | 0x4  | Block size                                                   |
| 0x4    | 0x4  | Checksum of block data                                       |
| 0x8    |      | Block name (null terminated)                                 |
|        | 0x4  | Size of BPK1 header and previous blocks (including this one) |

### Block checksum

The checksum of each block is calculated as a custom CRC-32 checksum of
the block's data:

- Polynomial: 4C11DB7
- Initial value: 4C11DB7
- Output XOR: 0

## Stationery blocks

The following blocks are used in the stationery files.

### STAHED1

This block holds the stationery file name and 0x79 byte padding.

### THUMB2

This block holds the thumbnail of the stationery as a JPEG image.

### STBARD1

There are two of these blocks. The first one holds a JPEG of the 2D part
of the stationery, and the second one holds the 3D part.

### STMASK1

This block holds a 256x256 L4 data of the 3D part of the stationery.