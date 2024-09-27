+++
title = 'SARC'
categories = ["File formats"]
+++

# SARC File Format

.sarc files are similar to the [ARC](ARC "wikilink") format with a
slightly different structure.

## File Format

### SARC Header

| Offset | Size | Description                                       |
|--------|------|---------------------------------------------------|
| 0x00   | 0x04 | Magic Bytes "SARC"                                |
| 0x04   | 0x02 | Header Length                                     |
| 0x06   | 0x02 | Byte-order marker (0xFEFF = big, 0xFFFE = little) |
| 0x08   | 0x04 | File Length                                       |
| 0x0C   | 0x04 | Data Offset (absolute)                            |
| 0x10   | 0x04 | Unknown (always 0x00000100)                       |

### SFAT Header

| Offset | Size | Description                             |
|--------|------|-----------------------------------------|
| 0x00   | 0x04 | Magic bytes "SFAT"                      |
| 0x04   | 0x02 | Header Length                           |
| 0x06   | 0x02 | Node Count                              |
| 0x08   | 0x04 | Filename Hash Multiplier (usually 0x65) |

### SFAT Node

| Offset | Size | Description                                          |
|--------|------|------------------------------------------------------|
| 0x00   | 0x04 | Name Hash                                            |
| 0x04   | 0x04 | SFNT Filename Offset (relative to SFNT data section) |
| 0x08   | 0x04 | File Data Start (relative to SARC data start)        |
| 0x0C   | 0x04 | File Data End (relative to SARC data end)            |

#### Node hashing function

The node hash is calculated via:

Python:

`def calc_hash(name, hash_multiplier):`
`    result = 0`
`    `
`    for c in name:`
`        result = ord(c) + (result * hash_multiplier)`
`        # ensure the result is a 32-bit value`
`        result &= 0xFFFFFFFF`
`    `
`    return result`

C:

`uint32_t calc_hash(char *name, int hash_multiplier) {`
`    uint32_t result = 0;`
`    `
`    for(int i = 0; i < strlen(name); i++) {`
`        result = name[i] + (result * hash_multiplier)`
`    }`
`    `
`    return result;`
`}`

### SFNT Header

| Offset | Size | Description        |
|--------|------|--------------------|
| 0x00   | 0x04 | Magic bytes "SFNT" |
| 0x04   | 0x02 | Header Length      |
| 0x06   | 0x02 | Unknown (padding?) |

### SFNT Data

SFNT data immediately follows the SFNT header and consists of
NULL-terminated ASCII strings.

### File Data

File data begins after SFNT with 0x100 (256) byte alignment with all
subsequent files aligned to 0x80 bytes.

## File Sort Order

Files are sorted by their hash in the SFAT table, games require this
sorting as they use a binary search algorithm
[1](https://en.wikipedia.org/wiki/Binary_search_algorithm).

# Tools

[2](https://github.com/ObsidianX/3dstools) - SARC Extractor/Creator with
TAR-like command line flags. Can decompress a .zlib SARC file (4-byte
size header + ZLIB data).

[Category:File formats](Category:File_formats "wikilink")