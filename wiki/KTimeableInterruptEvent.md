class [KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink")
extends
[KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink")

Size : 0x10 bytes

Abstract class used as base for [KThread](KThread "wikilink"),
[KTimer](KTimer "wikilink"), and the dummy subclass of the attribute at
offset 0x10 of [KTimerAndWDTManager](KTimerAndWDTManager "wikilink").
Instances of these classes are kept track of by the
[KTimerAndWDTManager](KTimerAndWDTManager "wikilink").

As of [11.3.0-36](11.3.0-36 "wikilink"), a second virtual method was
added to decide whether to remove an object from the list of objects
tracked by the [KTimerAndWDTManager](KTimerAndWDTManager "wikilink")
instance, see changelog.

| Offset | Type                                                                           | Description                                                                                                                                                                                                                          |
|--------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                                                      | Pointer to vtable                                                                                                                                                                                                                    |
| 0x4    | [KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink") \* | Next interrupt event (associated with the current one). The linked list represented by this attribute can contain cycles. For [KThread](KThread "wikilink") instances, this is usually a [KTimer](KTimer "wikilink"), and vice-versa |
| 0x8    | s64                                                                            | Desired time point (relative to the CPU power-on) in CPU ticks for [KTimerAndWDTManager](KTimerAndWDTManager "wikilink") when it's handling its list of [KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink") instances      |

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")