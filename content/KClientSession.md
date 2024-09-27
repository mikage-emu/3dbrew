+++
title = 'KClientSession'
categories = ["Kernel synchronization objects"]
+++

class [KClientSession](KClientSession "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink");

Size : 0x20 bytes

| Offset | Type              | Description                                                                    |
|--------|-------------------|--------------------------------------------------------------------------------|
| 0x0    | u32               | Pointer to vtable                                                              |
| 0x4    | u32               | Reference count                                                                |
| 0x8    | u32               | KLinkedListNode count for object                                               |
| 0xC    | KLinkedListNode\* | Pointer to first KLinkedListNode in list of KThreads using this client session |
| 0x10   | KLinkedListNode\* | Pointer to last KLinkedListNode in list of KThreads using this client session  |
| 0x14   | KSession\*        | Pointer to parent session                                                      |
| 0x18   | u32               | Session status                                                                 |
| 0x1C   | KClientPort\*     | Pointer to associated client port inside parent KPort                          |

Session status:

1: open
2: closed by client
3: closed by server?

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")