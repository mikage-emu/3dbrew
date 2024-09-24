+++
title = 'KMemoryBlock'
categories = ["Kernel objects"]
+++

Size : 0x14 bytes

| Offset | Type   | Description                                                                                                                |
|--------|--------|----------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void\* | Base address of memory block.                                                                                              |
| 0x4    | u32    | Block size in pages.                                                                                                       |
| 0x8    | u32    | Memory block permissions - rwx.                                                                                            |
| 0xC    | u32    | Memory state bitflags - the lowest byte is the type of memory and the second byte is for specific properties of the block. |
| 0x10   | u32    | Zero                                                                                                                       |

[Category:Kernel objects](Category:Kernel_objects "wikilink")
