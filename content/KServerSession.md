+++
title = 'KServerSession'
categories = ["Kernel synchronization objects"]
+++

class [KServerSession](KServerSession "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink");

Size : 0x24 bytes

| Offset | Type                                            | Description                                                                                                                            |
|--------|-------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | u32                                             | Pointer to vtable                                                                                                                      |
| 0x4    | u32                                             | Reference count                                                                                                                        |
| 0x8    | u32                                             | Node count for threads                                                                                                                 |
| 0xC    | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to first KLinkedListNode in the list of threads that sync with this object                                                     |
| 0x10   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Pointer to last KLinkedListNode in the list of threads that sync with this object                                                      |
| 0x14   | [KSession](KSession "wikilink")\*               | Pointer to parent session                                                                                                              |
| 0x18   | [KThread](KThread "wikilink")\*                 | Last stolen KThread during sync request- current thread when KServerSession code is running during svc - noted in KThread+0xA8 as well |
| 0x1C   | [KThread](KThread "wikilink")\*                 | First stolen KThread during sync request                                                                                               |
| 0x20   | [KThread](KThread "wikilink")\*                 | KThread that originated the session                                                                                                    |

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")
