class
[KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink")
extends [KBaseInterruptEvent](KBaseInterruptEvent "wikilink")

Size : 0x8 bytes

This this the abstract base class for all interrupt events related to
synchronization objects:
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink"),
[KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink") and
[KSendableInterruptEvent](KSendableInterruptEvent "wikilink")

There's no new virtual function defined by this class.

| Offset | Type                                                                           | Description                                                                                                              |
|--------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                                                      | Pointer to vtable                                                                                                        |
| 0x4    | [KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink") \* | Next interrupt event (associated with the current one). The linked list represented by this attribute can contain cycles |

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")