+++
title = 'KClientPort'
categories = ["Kernel synchronization objects"]
+++

class [KClientPort](KClientPort "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink");

Size : 0x1C bytes

| Offset | Type                                            | Description                                                                        |
|--------|-------------------------------------------------|------------------------------------------------------------------------------------|
| 0x0    | u32                                             | Pointer to vtable                                                                  |
| 0x4    | u32                                             | Reference count                                                                    |
| 0x8    | u32                                             | Node count for threads                                                             |
| 0xC    | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of threads that sync with this object |
| 0x10   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of threads that sync with this object  |
| 0x14   | s16                                             | Current connection count to port                                                   |
| 0x16   | s16                                             | Max connection count to port                                                       |
| 0x18   | [KPort](KPort "wikilink")\*                     | Pointer to the parent port object;                                                 |

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")
