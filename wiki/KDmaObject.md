class [KDmaObject](KDmaObject "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink");

Size : 0x18 bytes

| Offset | Type              | Description                                                                             |
|--------|-------------------|-----------------------------------------------------------------------------------------|
| 0x0    | u32               | Pointer to vtable                                                                       |
| 0x4    | u32               | Reference count                                                                         |
| 0x8    | u32               | Count of KThreads that sync with this object - number of nodes in the linked list below |
| 0xC    | KLinkedListNode\* | Pointer to first KLinkedListNode in node list of KThreads that sync with this object    |
| 0x10   | KLinkedListNode\* | Pointer to last KLinkedListNode in node list of KThreads that sync with this object     |
| 0x14   | u8                | Configuration number, initialized to 0xFF(-1)                                           |
| 0x15   | u8                | Dma started, initialized to 1                                                           |
| 0x16   | u16               | Unused                                                                                  |

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")