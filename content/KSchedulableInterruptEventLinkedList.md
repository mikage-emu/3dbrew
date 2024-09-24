+++
title = 'KSchedulableInterruptEventLinkedList'
categories = ["Kernel objects"]
+++

Size : 0x10 bytes

There is exactly one instance of this class per core.

On interrupt requests, when the interrupt handler of a
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink")
returns anything else than NULL or 1, it is added to this list.

After being added to this list, the thread handling this object (which
is a thread created by the kernel main function) is scheduled and the
context is switched. That thread pops the first interrupt event from the
list and execute its second virtual function, then unschedules itself
and switches context back.

| Offset | Type                                                                   | Description                                      |
|--------|------------------------------------------------------------------------|--------------------------------------------------|
| 0x0    | [KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink") \* | First interrupt event                            |
| 0x4    | [KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink") \* | Last interrupt event                             |
| 0x8    | u32                                                                    | Unused                                           |
| 0xC    | [KThread](KThread "wikilink") \* const                                 | Kernel thread of priority 0 handling this object |

[Category:Kernel objects](Category:Kernel_objects "wikilink")
