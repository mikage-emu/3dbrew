+++
title = 'KUserBindableInterruptEvent'
categories = ["Kernel interrupt events"]
+++

class
[KUserBindableInterruptEvent](KUserBindableInterruptEvent "wikilink")
extends
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink")

Size : 0xC bytes

Abstract class which is a base class for [KEvent](KEvent "wikilink") and
[KSemaphore](KSemaphore "wikilink"), to be used with svcBindInterrupt.

Semaphores cannot be bound to level high ("rising edge") active
interrupts.

For public interrupts (i.e. anything else than SGI \#15 in this case),
svcBindInterrupt sets the flag that indicates that the interrupt shall
be disabled after each time the interrupt is received.

The second virtual function reenables the interrupt (using the interrupt
ID) and signals the object (as synchronization object). In the case of
KSemaphore this also increments the semaphore's count.

| Offset | Type                                                                           | Description                                                                                                                                                                                             |
|--------|--------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                                                      | Pointer to vtable                                                                                                                                                                                       |
| 0x4    | [KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink") \* | Next interrupt event (associated with the current one), usually a [KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink"). The linked list represented by this attribute can contain cycles |
| 0x8    | s32                                                                            | Interrupt ID, -1 by default                                                                                                                                                                             |

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")