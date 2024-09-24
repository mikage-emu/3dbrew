+++
title = 'KRecursiveLock'
categories = ["Kernel objects"]
+++

Size : 0x8 bytes

Used to implement critical sections, etc.

This class has 3 methods : `Lock`, `Unlock`, and `LocalUnlock`. The only
difference between the two last methods is that the last one never
triggers SGI \#8 (rescheduling signal, associated to
[KScheduler](KScheduler "wikilink") objects)

`Lock` / `Unlock` blocks are always used with the same object.

`Lock` / `LocalUnlock` are always used with the associated attribute of
the timer/watchdog timer interrupt object.

| Offset | Type                             | Description            |
|--------|----------------------------------|------------------------|
| 0x0    | [KThread](KThread "wikilink") \* | Thread owning the lock |
| 0x4    | s32                              | Lock count             |

[Category:Kernel objects](Category:Kernel_objects "wikilink")