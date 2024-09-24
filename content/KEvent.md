+++
title = 'KEvent'
categories = ["Kernel synchronization objects","Kernel interrupt events"]
+++

class [KEvent](KEvent "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink") and
[KUserBindableInterruptEvent](KUserBindableInterruptEvent "wikilink");

Size : 0x28 bytes

| Offset | Type                                                                  | Description                                                                             |
|--------|-----------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| 0x0    | u32                                                                   | Pointer to vtable                                                                       |
| 0x4    | u32                                                                   | Reference count                                                                         |
| 0x8    | u32                                                                   | Count of KThreads that sync with this object - number of nodes in the linked list below |
| 0xC    | KLinkedListNode\*                                                     | Pointer to first KLinkedListNode in node list of KThreads that sync with this object    |
| 0x10   | KLinkedListNode\*                                                     | Pointer to last KLinkedListNode in node list of KThreads that sync with this object     |
| 0x14   | [KUserBindableInterruptEvent](KUserBindableInterruptEvent "wikilink") | Interrupt event (\*this)                                                                |
| 0x20   | bool                                                                  | Event is signaled                                                                       |
| 0x21   | bool                                                                  | Manual clear                                                                            |
| 0x22   | u8                                                                    | Reset type                                                                              |
| 0x23   | u8                                                                    | Unused, alignment                                                                       |
| 0x24   | [KProcess](KProcess "wikilink") \*                                    | Owner                                                                                   |
|        |                                                                       |                                                                                         |

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")
[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")