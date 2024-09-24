+++
title = 'CRO0'
categories = ["File formats"]
+++

CRO with extension .cro is used for "DLLs". CRS with extension .crs is
in the same format of CRO but storing the symbol information of the
static module (the main application). The end of the file is aligned to
a 0x1000-byte boundary with 0xCC bytes.

The first hash-table entry hashes the 0x100-byte header following the
hash-table. The following hash-table entries hash the sections specified
in the header.

When the RO module loads the entire CRO into process memory(mapped in
the 0x00100000-0x04000000 region), it modifies the mapped CRO data. The
magic field is also changed to "FIXD" if fix level is not 0.

Upon loading, the RO module will look for export symbol
"nnroAeabiAtexit_" to patch it to its import symbol "__aeabi_atexit".

For dumping symbols and loading a CRO into IDA, see
[1](https://github.com/plutooo/ctr/) and
[2](https://github.com/wwylele/IDA_plugin_CRO).

| Offset | Size | Description                                                                                                                                |
|--------|------|--------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x80 | SHA-256 hash-table, verified by [CRR](CRR0 "wikilink")                                                                                     |
| 0x80   | 0x04 | Magic "CRO0"                                                                                                                               |
| 0x84   | 0x04 | Name offset                                                                                                                                |
| 0x88   | 0x04 | Next loaded CRO pointer, set by RO during loading (Usually zero when the CRO is being loaded)                                              |
| 0x8C   | 0x04 | Previous loaded CRO pointer, set by RO during loading                                                                                      |
| 0x90   | 0x04 | File size                                                                                                                                  |
| 0x94   | 0x04 | .bss size                                                                                                                                  |
| 0x98   | 0x04 | Unknown                                                                                                                                    |
| 0x9C   | 0x04 | Unknown                                                                                                                                    |
| 0xA0   | 0x04 | "Segment offset" that is always the same as export symbol "nnroControlObject_". 0xFFFFFFFF in CRS                                         |
| 0xA4   | 0x04 | "Segment offset" for "OnLoad" function, which will be called when the module is initialized. Set to 0xFFFFFFFF if not exists.              |
| 0xA8   | 0x04 | "Segment offset" for "OnExit" function, which will be called when the module is finalized. Set to 0xFFFFFFFF if not exists.                |
| 0xAC   | 0x04 | "Segment offset" for "OnUnresolved" function, which will be called when an unresolved function is called. Set to 0xFFFFFFFF if not exists. |
| 0xB0   | 0x04 | Code offset                                                                                                                                |
| 0xB4   | 0x04 | Code size                                                                                                                                  |
| 0xB8   | 0x04 | .data offset                                                                                                                               |
| 0xBC   | 0x04 | .data size                                                                                                                                 |
| 0xC0   | 0x04 | Module Name offset                                                                                                                         |
| 0xC4   | 0x04 | Module Name size                                                                                                                           |
| 0xC8   | 0x04 | Segment Table offset                                                                                                                       |
| 0xCC   | 0x04 | Segment Table num (size = num\*12)                                                                                                         |
| 0xD0   | 0x04 | Named Export Table offset                                                                                                                  |
| 0xD4   | 0x04 | Named Export Table num (size = num \* 8)                                                                                                   |
| 0xD8   | 0x04 | Indexed Export Table offset                                                                                                                |
| 0xDC   | 0x04 | Indexed Export Table num (size = num \* 4)                                                                                                 |
| 0xE0   | 0x04 | Export Strings offset                                                                                                                      |
| 0xE4   | 0x04 | Export Strings size                                                                                                                        |
| 0xE8   | 0x04 | Export Tree offset (fast lookups based on a trie-like structure)                                                                           |
| 0xEC   | 0x04 | Export Tree num (size = num \* 8)                                                                                                          |
| 0xF0   | 0x04 | Import Module Table offset                                                                                                                 |
| 0xF4   | 0x04 | Import Module Table num (size = num \* 20)                                                                                                 |
| 0xF8   | 0x04 | Import Patches offset                                                                                                                      |
| 0xFC   | 0x04 | Import Patches num (size = num \* 12)                                                                                                      |
| 0x100  | 0x04 | Named Import Table offset                                                                                                                  |
| 0x104  | 0x04 | Named Import Table num (size = num \* 8)                                                                                                   |
| 0x108  | 0x04 | Indexed Import Table offset                                                                                                                |
| 0x10C  | 0x04 | Indexed Import Table num (size = num \* 8)                                                                                                 |
| 0x110  | 0x04 | Anonymous Import Table offset                                                                                                              |
| 0x114  | 0x04 | Anonymous Import Table num (size = num \* 8)                                                                                               |
| 0x118  | 0x04 | Import Strings offset                                                                                                                      |
| 0x11C  | 0x04 | Import Strings size                                                                                                                        |
| 0x120  | 0x04 | unk8 offset                                                                                                                                |
| 0x124  | 0x04 | unk8 num                                                                                                                                   |
| 0x128  | 0x04 | Relocation Patches offset                                                                                                                  |
| 0x12C  | 0x04 | Relocation Patches num (size = num \* 12)                                                                                                  |
| 0x130  | 0x04 | unk9 offset                                                                                                                                |
| 0x134  | 0x04 | unk9 num                                                                                                                                   |

Segment offset (4 bytes)

| Bits | Description             |
|------|-------------------------|
| 0-3  | Segment index for table |
| 4-31 | Offset into segment     |

Segment Table entry (12 bytes)

| Offset | Size | Description                                              |
|--------|------|----------------------------------------------------------|
| 0x0    | 0x4  | Segment offset                                           |
| 0x4    | 0x4  | Segment size                                             |
| 0x8    | 0x4  | Segment id (0 = .text, 1 = .rodata, 2 = .data, 3 = .bss) |

Named Export Table entry (8 bytes)

| Offset | Size | Description                 |
|--------|------|-----------------------------|
| 0x0    | 0x4  | Name offset                 |
| 0x4    | 0x4  | "Segment offset" for export |

Indexed Export Table entry (4 bytes)

| Offset | Size | Description                 |
|--------|------|-----------------------------|
| 0x0    | 0x4  | "Segment offset" for export |

Named Import Table entry (8 bytes)

| Offset | Size | Description                                                                   |
|--------|------|-------------------------------------------------------------------------------|
| 0x0    | 0x4  | Name offset                                                                   |
| 0x4    | 0x4  | Offset of the head of a linear list that contains the patches for this import |

Indexed Import Table entry (8 bytes)

| Offset | Size | Description                                                                   |
|--------|------|-------------------------------------------------------------------------------|
| 0x0    | 0x4  | index of the export symbol                                                    |
| 0x4    | 0x4  | Offset of the head of a linear list that contains the patches for this import |

Anonymous Import Table entry (8 bytes)

| Offset | Size | Description                                                                   |
|--------|------|-------------------------------------------------------------------------------|
| 0x0    | 0x4  | "Segment offset" of the export symbol                                         |
| 0x4    | 0x4  | Offset of the head of a linear list that contains the patches for this import |

Import Module Table entry (20 bytes)

| Offset | Size | Description                                                |
|--------|------|------------------------------------------------------------|
| 0x0    | 0x4  | Module name offset                                         |
| 0x4    | 0x4  | Indexed import num                                         |
| 0x8    | 0x4  | Offset of the head of a sub list in Indexed Import Table   |
| 0xC    | 0x4  | Anonymous import num                                       |
| 0x10   | 0x4  | Offset of the head of a sub list in Anonymous Import Table |

Patch entry (12 bytes)

| Offset | Size | Description                                                                                                                                                                                                                                                                                                                 |
|--------|------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | "Segment offset" for output.                                                                                                                                                                                                                                                                                                |
| 0x4    | 0x1  | Patch type (0=nothing/ignore, 2=38=write u32 absolute (base+addend), 3=write u32 relative (base+addend-in_ptr), 10=THUMB branch, 28=ARM32 branch, 29=modify ARM32 branch offset, 42=write u32 relative (((signed int)base\*2)/2+addend-in_ptr), otherwise err) (This is apparently a subset of relocation type for ARM ELF) |
| 0x5    | 0x1  | For import patches, non-zero if last entry; for relocation patches, this is the referred segment index                                                                                                                                                                                                                      |
| 0x6    | 0x1  | For import patches, 1 is written to first entry if all symbols loaded successfully; unknown (padding?) for relocation patches                                                                                                                                                                                               |
| 0x7    | 0x1  | Unknown (padding?)                                                                                                                                                                                                                                                                                                          |
| 0x8    | 0x4  | addend                                                                                                                                                                                                                                                                                                                      |

ARM32 branch instruction is constructed as follows:

```
 If addend > 0x2000000 or addend < 0xFE000000, then skip.
 If (addend&1) == 1 then write "b +4" (nop).
 Else write as normal.
```

------------------------------------------------------------------------

[Category:File formats](Category:File_formats "wikilink")