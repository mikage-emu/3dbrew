+++
title = 'KObjectLink'
categories = ["Kernel objects"]
+++

Size : 0x10 bytes

This is used to keep track of kernel objects and allocate new ones.

| Offset | Type | Description                                                    |
|--------|------|----------------------------------------------------------------|
| 0x0    | u32  | Pointer to next available kernel object                        |
| 0x4    | u32  | Pointer to first kernel object                                 |
| 0x8    | u32  | Size of kernel heap allocation for this specific kernel object |
| 0xC    | u32  | Size of this kernel object                                     |

[Category:Kernel objects](Category:Kernel_objects "wikilink")