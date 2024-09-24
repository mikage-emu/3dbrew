Abstract base class for all interrupt events.

Size: 0x4 bytes

| Offset | Type      | Description       |
|--------|-----------|-------------------|
| 0x0    | void \*\* | Pointer to vtable |

This abstract base class defines
`virtual KSchedulableInterruptEvent* handleInterruptAndGetKSchedulableInterruptEvent(u32 interruptID) = 0`.
It's actually the function called by the IRQ handler, which returns a
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink") to
call the second virtual method of (which signals the object) after a
reschedule.

If either NULL or 1 is returned, nothing will be signaled. If NULL is
returned, no post-interrupt rescheduling will be done.

The kernel uses the
[KEventInterruptEvent](KUserBindableInterruptEvent "wikilink") field of
a [KEvent](KEvent "wikilink") when binding public interrupts per
svcBindInterrupt request.

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")