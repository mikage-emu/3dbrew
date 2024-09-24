class [KSynchronizationObject](KSynchronizationObject "wikilink")
extends [KAutoObject](KAutoObject "wikilink");

Size : 0x14 bytes

| Offset | Type              | Description                                                                             |
|--------|-------------------|-----------------------------------------------------------------------------------------|
| 0x0    | u32               | Pointer to vtable                                                                       |
| 0x4    | u32               | Reference count                                                                         |
| 0x8    | u32               | Count of KThreads that sync with this object - number of nodes in the linked list below |
| 0xC    | KLinkedListNode\* | Pointer to first KLinkedListNode in node list of KThreads that sync with this object    |
| 0x10   | KLinkedListNode\* | Pointer to last KLinkedListNode in node list of KThreads that sync with this object     |

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")