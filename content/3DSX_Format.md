+++
title = '3DSX Format'
+++

The 3DSX format is an executable file-format designed for homebrew
applications on the 3DS.

The file is structured like this:

- Header
- Extended Header, if the header size field is greater than 32.
- Code relocation table header
- Rodata relocation table header
- Data relocation table header
- Code segment
- Rodata segment
- Data segment
- Code relocation table
- Rodata relocation table
- Data relocation table
- [SMDH](SMDH "wikilink") data, if there is an extended header.
- [RomFS](RomFS "wikilink") data, if there is an extended header.

## Header

| Offset | Size | Description                       |
|--------|------|-----------------------------------|
| 0x0    | 4    | Magic (3DSX)                      |
| 0x4    | 2    | Header size                       |
| 0x6    | 2    | Relocation Header size            |
| 0x8    | 4    | Format version                    |
| 0xC    | 4    | Flags                             |
| 0x10   | 4    | Code segment size                 |
| 0x14   | 4    | Rodata segment size               |
| 0x18   | 4    | Data segment size (including bss) |
| 0x1C   | 4    | Bss segment size                  |

## Extended Header

| Offset | Size | Description                      |
|--------|------|----------------------------------|
| 0x0    | 4    | [SMDH](SMDH "wikilink") offset   |
| 0x4    | 4    | [SMDH](SMDH "wikilink") size     |
| 0x8    | 4    | [RomFS](RomFS "wikilink") offset |

## Relocation Header

| Offset | Size | Description                    |
|--------|------|--------------------------------|
| 0x0    | 4    | Number of absolute relocations |
| 0x4    | 4    | Number of relative relocations |

## Relocation

| Offset | Size | Description              |
|--------|------|--------------------------|
| 0x0    | 2    | Number of words to skip  |
| 0x2    | 2    | Number of words to patch |
