class [KServerPort](KServerPort "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink");

Size : 0x24 bytes

| Offset | Type                                            | Description                                                                                 |
|--------|-------------------------------------------------|---------------------------------------------------------------------------------------------|
| 0x0    | u32                                             | Pointer to vtable                                                                           |
| 0x4    | u32                                             | Reference count                                                                             |
| 0x8    | u32                                             | Node count for threads                                                                      |
| 0xC    | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of threads that sync with this object          |
| 0x10   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of threads that sync with this object           |
| 0x14   | u32                                             | Node count for threads                                                                      |
| 0x18   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of KServerSessions associated with this object |
| 0x1C   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of KServerSessions associated with this object  |
| 0x20   | [KPort](KPort "wikilink")\*                     | Pointer to parent KPort                                                                     |

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")
