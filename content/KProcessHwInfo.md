+++
title = 'KProcessHwInfo'
categories = ["Kernel objects"]
+++

Struct inside the [KProcess](KProcess "wikilink") object. Starts at
KProcess+0x1C.

Size : 0x4C bytes (on N3DS)

Offsets above 0x8 are only for N3DS.

| Offset | Type                                            | Description                                                             |
|--------|-------------------------------------------------|-------------------------------------------------------------------------|
| 0x0    | [KObjectMutex](KObjectMutex "wikilink")         | Mutex                                                                   |
| 0x8    | u32\[number of cores\]                          | TLB entries for process need invalidating on core(i)                    |
| 0x18   | u32                                             | KMemoryBlock count for KProcess                                         |
| 0x1C   | [KLinkedListNode](KLinkedListNode "wikilink")\* | First KLinkedListNode in list of KMemoryBlocks                          |
| 0x20   | [KLinkedListNode](KLinkedListNode "wikilink")\* | Last KLinkedListNode in list of KMemoryBlocks                           |
| 0x24   | u32                                             | Unknown                                                                 |
| 0x28   | u32                                             | Unknown                                                                 |
| 0x2C   | void\*                                          | Translation table base                                                  |
| 0x30   | u8                                              | Context ID                                                              |
| 0x31   | bool                                            | Indicates that a global TLB flush is needed                             |
| 0x32   | bool                                            | Process is the current running game/app                                 |
| 0x34   | u32                                             | Unknown                                                                 |
| 0x38   | void\*                                          | End of userland memory for process                                      |
| 0x3C   | void\*                                          | Linear memory start for process (since [8.0.0-18](8.0.0-18 "wikilink")) |
| 0x40   | u32                                             | Unknown (since [8.0.0-18](8.0.0-18 "wikilink"))                         |
| 0x44   | u32                                             | MMU table size                                                          |
| 0x48   | u32\*                                           | Pointer to the MMU table in kernel FCRAM vmem                           |

[Category:Kernel objects](Category:Kernel_objects "wikilink")