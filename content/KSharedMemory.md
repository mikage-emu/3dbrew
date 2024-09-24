+++
title = 'KSharedMemory'
categories = ["Kernel auto objects"]
+++

class [KSharedMemory](KSharedMemory "wikilink") extends
[KAutoObject](KAutoObject "wikilink") and
[KLinkedList](KLinkedList "wikilink");

Size : 0x28 bytes

| Offset | Type                                            | Description                                                                                                                           |
|--------|-------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | u32                                             | Pointer to vtable                                                                                                                     |
| 0x4    | u32                                             | Reference count                                                                                                                       |
| 0x8    | u32                                             | Node count for [KBlockInfo](KBlockInfo "wikilink") objects                                                                            |
| 0xC    | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of [KBlockInfo](KBlockInfo "wikilink") objects associated with this KSharedMemory object |
| 0x10   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of [KBlockInfo](KBlockInfo "wikilink") objects associated with this KSharedMemory object  |
| 0x14   | [KProcess](KProcess "wikilink")\*               | Owner                                                                                                                                 |
| 0x18   | u32                                             | Owner permissions                                                                                                                     |
| 0x1C   | u32                                             | Other processes' permissions for this block                                                                                           |
| 0x20   | u8                                              | Set after KBlockInfo is generated for the KSharedMemory                                                                               |
| 0x21   | s8                                              | Set after all KBlockInfo is generated                                                                                                 |
| 0x22   | u8                                              | Unknown                                                                                                                               |
| 0x24   | u32                                             | Address                                                                                                                               |

[Category:Kernel auto objects](Category:Kernel_auto_objects "wikilink")
