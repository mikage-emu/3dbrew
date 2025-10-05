+++
title = 'CRO0'
categories = ["File formats"]
+++

CRO with extension .cro is used for "DLLs". CRS with extension .crs is in the same format of CRO but storing the symbol information of the static module (the main application). The end of the file is aligned to a 0x1000-byte boundary with 0xCC bytes.

The first hash-table entry hashes the 0x100-byte header following the hash-table. The following hash-table entries hash the sections specified in the header.

When the RO module loads the entire CRO into process memory(mapped in the 0x00100000-0x04000000 region), it modifies the mapped CRO data. The magic field is also changed to "FIXD" if fix level is not 0.

Upon loading, the RO module will look for export symbol "nnroAeabiAtexit\_" to patch it to its import symbol "\_\_aeabi_atexit".

For dumping symbols and loading a CRO into IDA, see [1](https://github.com/plutooo/ctr/) and [2](https://github.com/wwylele/IDA_plugin_CRO).

# Structure

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x80 | SHA-256 hash-table, verified by [CRR](CRR0 "wikilink") |
| 0x80 | 0x04 | Magic "CRO0" |
| 0x84 | 0x04 | Name offset |
| 0x88 | 0x04 | Next loaded CRO pointer, set by RO during loading (Usually zero when the CRO is being loaded) |
| 0x8C | 0x04 | Previous loaded CRO pointer, set by RO during loading |
| 0x90 | 0x04 | File size |
| 0x94 | 0x04 | .bss size |
| 0x98 | 0x04 | Unknown |
| 0x9C | 0x04 | Unknown |
| 0xA0 | 0x04 | [Segment offset](#segment_offset_(4_bytes) "wikilink") that is always the same as export symbol "nnroControlObject\_". 0xFFFFFFFF in CRS |
| 0xA4 | 0x04 | [Segment offset](#segment_offset_(4_bytes) "wikilink") for "OnLoad" function, which will be called when the module is initialized. Set to 0xFFFFFFFF if not exists. |
| 0xA8 | 0x04 | [Segment offset](#segment_offset_(4_bytes) "wikilink") for "OnExit" function, which will be called when the module is finalized. Set to 0xFFFFFFFF if not exists. |
| 0xAC | 0x04 | [Segment offset](#segment_offset_(4_bytes) "wikilink") for "OnUnresolved" function, which will be called when an unresolved function is called. Set to 0xFFFFFFFF if not exists. |
| 0xB0 | 0x04 | Code offset |
| 0xB4 | 0x04 | Code size |
| 0xB8 | 0x04 | .data offset |
| 0xBC | 0x04 | .data size |
| 0xC0 | 0x04 | Module Name offset |
| 0xC4 | 0x04 | Module Name size |
| 0xC8 | 0x04 | Segment Table offset |
| 0xCC | 0x04 | Segment Table num (size = num\*12) |
| 0xD0 | 0x04 | Named Export Table offset |
| 0xD4 | 0x04 | Named Export Table num (size = num \* 8) |
| 0xD8 | 0x04 | Indexed Export Table offset |
| 0xDC | 0x04 | Indexed Export Table num (size = num \* 4) |
| 0xE0 | 0x04 | Export Strings offset |
| 0xE4 | 0x04 | Export Strings size |
| 0xE8 | 0x04 | Export Tree offset (fast lookups based on a trie-like structure) |
| 0xEC | 0x04 | Export Tree num (size = num \* 8) |
| 0xF0 | 0x04 | Import Module Table offset |
| 0xF4 | 0x04 | Import Module Table num (size = num \* 20) |
| 0xF8 | 0x04 | Import Patches offset |
| 0xFC | 0x04 | Import Patches num (size = num \* 12) |
| 0x100 | 0x04 | Named Import Table offset |
| 0x104 | 0x04 | Named Import Table num (size = num \* 8) |
| 0x108 | 0x04 | Indexed Import Table offset |
| 0x10C | 0x04 | Indexed Import Table num (size = num \* 8) |
| 0x110 | 0x04 | Anonymous Import Table offset |
| 0x114 | 0x04 | Anonymous Import Table num (size = num \* 8) |
| 0x118 | 0x04 | Import Strings offset |
| 0x11C | 0x04 | Import Strings size |
| 0x120 | 0x04 | unk8 offset |
| 0x124 | 0x04 | unk8 num |
| 0x128 | 0x04 | Relocation Patches offset |
| 0x12C | 0x04 | Relocation Patches num (size = num \* 12) |
| 0x130 | 0x04 | unk9 offset |
| 0x134 | 0x04 | unk9 num |

## Segment offset (4 bytes)

| Bits | Description             |
|------|-------------------------|
| 0-3  | Segment index for table |
| 4-31 | Offset into segment     |

## Segment Table entry (12 bytes)

| Offset | Size | Description                                              |
|--------|------|----------------------------------------------------------|
| 0x0    | 0x4  | Segment offset                                           |
| 0x4    | 0x4  | Segment size                                             |
| 0x8    | 0x4  | Segment id (0 = .text, 1 = .rodata, 2 = .data, 3 = .bss) |

## Named Export Table entry (8 bytes)

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | Name offset |
| 0x4 | 0x4 | [Segment offset](#segment_offset_(4_bytes) "wikilink") for export |

## Indexed Export Table entry (4 bytes)

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | [Segment offset](#segment_offset_(4_bytes) "wikilink") for export |

## Named Import Table entry (8 bytes)

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | Name offset |
| 0x4 | 0x4 | Offset of the head of a linear list that contains the patches for this import |

## Indexed Import Table entry (8 bytes)

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | index of the export symbol |
| 0x4 | 0x4 | Offset of the head of a linear list that contains the patches for this import |

## Anonymous Import Table entry (8 bytes)

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | [Segment offset](#segment_offset_(4_bytes) "wikilink") of the export symbol |
| 0x4 | 0x4 | Offset of the head of a linear list that contains the patches for this import |

## Import Module Table entry (20 bytes)

| Offset | Size | Description                                                |
|--------|------|------------------------------------------------------------|
| 0x0    | 0x4  | Module name offset                                         |
| 0x4    | 0x4  | Indexed import num                                         |
| 0x8    | 0x4  | Offset of the head of a sub list in Indexed Import Table   |
| 0xC    | 0x4  | Anonymous import num                                       |
| 0x10   | 0x4  | Offset of the head of a sub list in Anonymous Import Table |

## Patch entry (12 bytes)

| Offset | Size | Description |
|----|----|----|
| 0x0 | 0x4 | [Segment offset](#segment_offset_(4_bytes) "wikilink") for output. |
| 0x4 | 0x1 | Patch type (R_ARM_NONE = 0, R_ARM_ABS32 = 2, R_ARM_REL32 = 3, R_ARM_THM_PC22 = 10, R_ARM_CALL = 28, R_ARM_JUMP24 = 29, R_ARM_TARGET1 = 38, R_ARM_PREL31 = 42) |
| 0x5 | 0x1 | For import patches, non-zero if last entry; for relocation patches, this is the referred segment index |
| 0x6 | 0x1 | For import patches, 1 is written to first entry if all symbols loaded successfully; unknown (padding?) for relocation patches |
| 0x7 | 0x1 | Unknown (padding?) |
| 0x8 | 0x4 | addend |

Relocation code from RO:

`static Result writePatch(u32* out, u32 patchType, u32 addend, u32 base, u32 inputPtr) {`  
`    const s32 branchOffset = inputPtr - base;`  
`    u32 offset = base + addend - inputPtr;`  
  
`    if (patchType == R_ARM_NONE)`  
`        return 0;`  
  
`    if (patchType == R_ARM_ABS32 || patchType == R_ARM_TARGET1) {`  
`        *out = base + addend;`  
`        return 0;`  
`    }`  
  
`    if (patchType == R_ARM_REL32) {`  
`        *out = offset;`  
`        return 0;`  
`    }`  
  
`    if (patchType == R_ARM_THM_PC22) {`  
`        // +-4MB.`  
`        if (branchOffset >= 0x400000 || branchOffset <= -0x400000)`  
`            return 0xD9012C23;`  
  
`        if (base & 1) {`  
`            *out = (((offset >> 12) | 0xF000) << 16) | ((offset << 4) >> 5) | 0xF800;`  
`        } else {`  
`            if (offset & 2)`  
`                offset += 2;`  
  
`            *out = ((offset >> 12) | 0xF000) << 16 | ((offset << 4) >> 5) | 0xE800;`  
`        }`  
  
`        return 0;`  
`    }`  
  
`    if (patchType == R_ARM_CALL) {`  
`        // +-32MB.`  
`        if (branchOffset >= 0x2000000 || branchOffset <= -0x2000000)`  
`            return 0xD9012C23;`  
  
`        if (base & 1) {`  
`            *out = ((offset << 23) & 0x1000000) | ((offset << 6) >> 8) | 0xFA000000;`  
`        } else {`  
`            *out = 0xEB000000 | ((offset << 6) >> 8);`  
`        }`  
  
`        return 0;`  
`    }`  
  
`    if (patchType == R_ARM_JUMP24) {`  
`        // +-32MB.`  
`        if (branchOffset >= 0x2000000 || branchOffset <= -0x2000000 || (base & 1))`  
`            return 0xD9012C23;`  
  
`        *out = (*out & 0xFF000000) | ((offset << 6) >> 8);`  
`        return 0;`  
`    }`  
  
`    if (patchType == R_ARM_PREL31) {`  
`        *out = addend + ((base << 1) >> 1) - inputPtr;`  
`        return 0;`  
`    }`  
  
`    return 0xD9012C22;`  
```
}
```

## nnroControlObject

Signature:

```
Result nnroControlObject(void* arg, u32 type);
```

| Type | Description |
|----|----|
| 0 | Write address of "nnroEitNode\_" to memory pointed by arg (\*(u32\*)arg = &nnroEitNode\_) |
| 1 | Set global in CRO to arg, where arg is the CRO end (g_CRO_end = (u32)arg) |
| 2 | Write CRO end to memory pointed by arg (\*(u32\*)arg = g_CRO_end) |
| 3 | Write begin, end of function list (C initializers?) to memory pointed by arg (\*(u32\*)arg = (u32)listBegin, ((u32\*)arg)\[1\] = (u32)listEnd) |
| 4 | Write begin, end of function list (C++ initializers?) to memory pointed by arg (\*(u32\*)arg = (u32)listBegin, ((u32\*)arg)\[1\] = (u32)listEnd) |

"EitNode" are nodes of a linked list containing informations about the main executable + loaded modules:

| Index Word | Type | Description |
|----|----|----|
| 0 | EitNode\* | Pointer to the previous element of the list |
| 1 | EitNode\* | Pointer to the next element of the list |
| 2 | u32 | Module code start, for the main executable this is .text base, for CROs this is the value at CRO+0xB0 |
| 3 | u32 | Module code end (start + size), for the main executable the size is the size of all mapped sections, for CROs it's the value at CRO+0xB4 |
| 4 | u32\* | Unknown, seems to be an array of u32, probably holds debugging informations |
| 5 | u32\* | This points at the end of the previous array |
| 6 | ElfNode\* (?) | Unknown, this is only set for the main executable node, and it points to itself |

[Category:File formats](Category:File_formats "wikilink")
