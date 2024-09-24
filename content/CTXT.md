+++
title = 'CTXT'
+++

This page describes the structure of the .ctx files located at
[nand:/title/<titlepath>/00000000.ctx](Title_Data_Structure "wikilink").

# Structure

| Offset | Size  | Description                                 |
|--------|-------|---------------------------------------------|
| 0x0    | 0x10  | AESMAC over SHA256 of bytes 0x10..0x30      |
| 0x10   | 0x4   | Magic "CTXT"                                |
| 0x14   | 0x4   | Value 0 usually?                            |
| 0x18   | 0x4   | Value 1 usually?                            |
| 0x1C   | 0x4   | Value 0 usually?                            |
| 0x20   | 0x8   | TitleID                                     |
| 0x28   | 0x4   | Unknown u32                                 |
| 0x2C   | 0x1D4 | All-zero                                    |
| 0x200  | 0x10  | AES-MAC?                                    |
| 0x210  | 0x8   | TitleID                                     |
| 0x218  | 0x4   | contentID for contentindex0                 |
| 0x21C  | 0x4   | Unknown u32 for contentindex0               |
| 0x220  | 0x8   | content-size for contentindex0              |
| 0x228  | 0x8   | Usually zero?                               |
| 0x230  | 0x3CC | Usually 0xFF?                               |
| 0x5FC  | 0x4   | This has the same value as the u32 at 0x28. |
