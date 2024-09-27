+++
title = 'KCodeSet'
categories = ["Kernel auto objects"]
+++

class [KCodeSet](KCodeSet "wikilink") extends
[KAutoObject](KAutoObject "wikilink");

Size : 0x64 bytes

| Offset | Type                  | Description                     |
|--------|-----------------------|---------------------------------|
| 0x0    | u32                   | Pointer to vtable               |
| 0x4    | u32                   | Reference count                 |
| 0x8    | KCodeSetMemDescriptor | Memory section info for .text   |
| 0x1C   | KCodeSetMemDescriptor | Memory section info for .rodata |
| 0x30   | KCodeSetMemDescriptor | Memory section info for .data   |
| 0x44   | u32                   | Total .text pages               |
| 0x48   | u32                   | Total .rodata pages             |
| 0x4C   | u32                   | Total RW pages (.bss + .data)   |
| 0x50   | u64                   | Process name as 8-byte string   |
| 0x58   | u16                   | ?                               |
| 0x5A   | u16                   | ?                               |
| 0x5C   | u64                   | TitleID                         |

# KCodeSetMemDescriptor

Sections too large to fit into any available memory blocks will be split
across multiple memory blocks with a [KBlockInfo](KBlockInfo "wikilink")
instance for each. This is described by the memory section info struct:

| Offset | Type                                            | Description                                             |
|--------|-------------------------------------------------|---------------------------------------------------------|
| 0x0    | u32                                             | Start address (virtual)                                 |
| 0x4    | u32                                             | Total pages                                             |
| 0x8    | u32                                             | [KBlockInfo](KBlockInfo "wikilink") count               |
| 0xC    | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of objects |
| 0x10   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of objects  |

[Category:Kernel auto objects](Category:Kernel_auto_objects "wikilink")
