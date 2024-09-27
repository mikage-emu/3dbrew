+++
title = 'KTimer'
categories = ["Kernel synchronization objects","Kernel interrupt events"]
+++

class [KTimer](KTimer "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink") and
[KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink");

Size : 0x3C bytes

| Offset | Type                                                          | Description                                                                                                                                                                                                                                                                                                    |
|--------|---------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | u32                                                           | Pointer to vtable                                                                                                                                                                                                                                                                                              |
| 0x4    | u32                                                           | Reference count                                                                                                                                                                                                                                                                                                |
| 0x8    | u32                                                           | Count of KThreads that sync with this object - number of nodes in the linked list below                                                                                                                                                                                                                        |
| 0xC    | KLinkedListNode\*                                             | Pointer to first KLinkedListNode in node list of KThreads that sync with this object                                                                                                                                                                                                                           |
| 0x10   | KLinkedListNode\*                                             | Pointer to last KLinkedListNode in node list of KThreads that sync with this object                                                                                                                                                                                                                            |
| 0x14   | [KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink") | Interrupt event (\*this) to be used with [KTimerAndWDTManager](KTimerAndWDTManager "wikilink") holding its desired time point (relative to the CPU power-on) in CPU ticks (when handling its list of [KTimableInterruptEvent](KTimableInterruptEvent "wikilink") instances). Gets incremented at each interval |
| 0x24   | u8                                                            | Timer is signaled                                                                                                                                                                                                                                                                                              |
| 0x25   | u8                                                            | Timer reset type (one shot, sticky, pulse)                                                                                                                                                                                                                                                                     |
| 0x26   | u16                                                           | Starting from [11.3.0-36](11.3.0-36 "wikilink"): set to 0 prior to removing the timer from the [KTimerAndWDTManager](KTimerAndWDTManager "wikilink") queue, set to 1 just after that.                                                                                                                          |
| 0x28   | s64                                                           | Interval in nanoseconds                                                                                                                                                                                                                                                                                        |
| 0x30   | s64                                                           | Current value in nanoseconds: current system uptime + user-specified time offset, updated at each interval                                                                                                                                                                                                     |
| 0x38   | KProcess\*                                                    | Owner                                                                                                                                                                                                                                                                                                          |
|        |                                                               |                                                                                                                                                                                                                                                                                                                |

Negative intervals and time offsets are considered null.

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")
[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")