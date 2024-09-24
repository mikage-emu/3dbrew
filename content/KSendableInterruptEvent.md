+++
title = 'KSendableInterruptEvent'
categories = ["Kernel interrupt events"]
+++

class [KSendableInterruptEvent](KSendableInterruptEvent "wikilink")
extends
[KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink");

Size : 0x8 bytes

Abstract class used as base for [KProcess](KProcess "wikilink"),
[KThread](KThread "wikilink") and some DMA-related object. Used with
[KInterruptEventMailbox](KInterruptEventMailbox "wikilink")

| Offset | Type                                                                           | Description                                                                                                                   |
|--------|--------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                                                      | Pointer to vtable                                                                                                             |
| 0x4    | [KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink") \* | Next interrupt event (associated with the current one), of type [KSendableInterruptEvent](KSendableInterruptEvent "wikilink") |

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")