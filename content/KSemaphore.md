+++
title = 'KSemaphore'
categories = ["Kernel synchronization objects","Kernel interrupt events"]
+++

class [KSemaphore](KSemaphore "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink") and
[KUserBindableInterruptEvent](KUserBindableInterruptEvent "wikilink");

Size : 0x2C bytes

| Offset | Type                                                                  | Description                                                                             |
|--------|-----------------------------------------------------------------------|-----------------------------------------------------------------------------------------|
| 0x0    | u32                                                                   | Pointer to vtable                                                                       |
| 0x4    | u32                                                                   | Reference count                                                                         |
| 0x8    | u32                                                                   | Count of KThreads that sync with this object - number of nodes in the linked list below |
| 0xC    | KLinkedListNode\*                                                     | Pointer to first KLinkedListNode in list of KThreads that sync with this semaphore      |
| 0x10   | KLinkedListNode\*                                                     | Pointer to last KLinkedListNode in list of KThreads that sync with this semaphore       |
| 0x14   | [KUserBindableInterruptEvent](KUserBindableInterruptEvent "wikilink") | Interrupt event (\*this)                                                                |
| 0x20   | u32                                                                   | Count                                                                                   |
| 0x24   | u32                                                                   | Max count                                                                               |
| 0x28   | KProcess\*                                                            | Owner                                                                                   |

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")
[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")
