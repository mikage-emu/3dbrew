+++
title = 'KFIQInterruptEvent'
categories = ["Kernel interrupt events"]
+++

class [KFIQInterruptEvent](KFIQInterruptEvent "wikilink") extends
[KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink")

Size : 0x10 bytes

Interrupt event object associated with SGI \#15, which is the only
private interrupt that can be bound using
[svcBindInterrupt](SVC "wikilink").

Although that SGI \#15 is sent to both core0 and core1, there's only
*one* instance of [KFIQInterruptEvent](KFIQInterruptEvent "wikilink")
for all cores, the fields of which are set by svcBindInterrupt. If it
has been bound on one core, it can't be bound on the others (0xD8A007FC,
"already exists", is returned). It is usually bound by the dmnt or the
debugger sysmodules.

svcBindInterrupt doesn't check the process's
[exheader](NCCH/Extended_Header "wikilink") flags for that interrupt at
all.

The first virtual method returns `event->interruptEvent` and the second
calls the corresponding second method of that interrupt event.

Bit1 of [PDN_FIQ_CNT](PDN_Registers#PDN_FIQ_CNT "wikilink") is set when
handling a FIQ and when unbinding SGI \#15 using svcUnbindInterrupt, and
cleared after the associated event has been signaled, as well as when
svcBindInterrupt is used for SGI \#15.

| Offset | Type                                                                           | Description                                                                                                                                          |
|--------|--------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                                                      | Pointer to vtable                                                                                                                                    |
| 0x4    | [KSynchronizationInterruptEvent](KSynchronizationInterruptEvent "wikilink") \* | Next interrupt event (associated with the current one). The linked list represented by this attribute can contain cycles. Unused?                    |
| 0x8    | [KEvent](KEvent "wikilink") \*                                                 | Associated event bound with svcBindInterrupt                                                                                                         |
| 0xC    | u8                                                                             | Is level-high active ("rising edge") = `event->isManualClear`. Must be false when using [svcBindInterrupt](SVC "wikilink")                           |
| 0xD    | u8                                                                             | Unknown? Must be true at the time the associated event is signaled, when "level-high active"/"is manual clear" is false, and is set to 1 afterwards. |
| 0xE    | u8\[2\]                                                                        | Padding                                                                                                                                              |

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")