+++
title = 'KTimerAndWDTManager'
categories = ["Kernel interrupt events"]
+++

class [KTimerAndWDTManager](KTimerAndWDTManager "wikilink") extends
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink")

Size : 0x28 bytes

This is the interrupt event object associated with SGIs \#29 and \#30
(timer and watchdog timer interrupts). It keeps tracks of the system
uptime and manages
[KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink") instances.

The interrupt handler of this object updates its counter attributes and
returns 0 if it was called with interuptID = 31 (or any invalid
interruptID value) (Watchdog timer underflow), otherwise it does nothing
and returns the object itself (timer interrupt).

There is only one instance of this class (everything uses the timer and
watchdog timer of core1).

| Offset | Type                                                                           | Description                                                                                                                                                                                                                                                                                                                                                       |
|--------|--------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                                                      | Pointer to vtable                                                                                                                                                                                                                                                                                                                                                 |
| 0x4    | [KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink") \* | Next interrupt event (associated with the current one) of type [KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink"). The linked list represented by this attribute can contain cycles                                                                                                                                                              |
| 0x8    | u32                                                                            | Watchdog timer underflow counter                                                                                                                                                                                                                                                                                                                                  |
| 0xC    | u32                                                                            | Previous value of the underflow counter                                                                                                                                                                                                                                                                                                                           |
| 0x10   | [KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink")                  | Instance of a subclass of [KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink") used to keep track of all instances of [KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink"). Also keeps tracks of the system uptime in CPU ticks, this is updated each time a [KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink") is added to its list |
| 0x20   | [KRecursiveLock](KRecursiveLock "wikilink")                                    | Recursive lock                                                                                                                                                                                                                                                                                                                                                    |

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")
