+++
title = 'KPort'
categories = ["Kernel auto objects"]
+++

class [KPort](KPort "wikilink") extends
[KAutoObject](KAutoObject "wikilink");

Size : 0x48 bytes

| Offset | Type                                            | Description                                                                               |
|--------|-------------------------------------------------|-------------------------------------------------------------------------------------------|
| 0x0    | u32                                             | Pointer to vtable                                                                         |
| 0x4    | u32                                             | Reference count                                                                           |
| 0x8    | u32                                             | Pointer to [KServerPort](KServerPort "wikilink") vtable                                   |
| 0xC    | u32                                             | [KServerPort](KServerPort "wikilink") Reference count                                     |
| 0x10   | u32                                             | Node count for threads                                                                    |
| 0x14   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of threads that sync with this object        |
| 0x18   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of threads that sync with this object         |
| 0x1C   | u32                                             | Node count for sessions                                                                   |
| 0x20   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of KServerSessions associated with this port |
| 0x24   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of KServerSessions associated with this port  |
| 0x28   | KPort\*                                         | Pointer to parent KPort                                                                   |
| 0x2C   | u32                                             | Pointer to [KClientPort](KClientPort "wikilink") vtable                                   |
| 0x30   | u32                                             | [KClientPort](KClientPort "wikilink") Reference count                                     |
| 0x34   | u32                                             | Node count for threads                                                                    |
| 0x38   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of threads that sync with this object        |
| 0x3C   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of threads that sync with this object         |
| 0x40   | s16                                             | Current connection count to port                                                          |
| 0x42   | s16                                             | Max connection count to port                                                              |
| 0x44   | KPort\*                                         | Pointer to the parent port object;                                                        |

[Category:Kernel auto objects](Category:Kernel_auto_objects "wikilink")