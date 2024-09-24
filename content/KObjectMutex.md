+++
title = 'KObjectMutex'
categories = ["Kernel objects"]
+++

Size : 0x8 bytes

This is used to provide thread-safety when manipulating kernel objects
such as [KProcessHwInfo](KProcessHwInfo "wikilink"),
[KProcessHandleTable](KProcess#KProcessHandleTable "wikilink"),
[InterruptTable](ARM11_Interrupts#Interrupt_Table_.28New3DS.29 "wikilink"),
etc.

| Offset | Type                             | Description                                                                                                          |
|--------|----------------------------------|----------------------------------------------------------------------------------------------------------------------|
| 0x0    | [KThread](KThread "wikilink") \* | Thread owning the mutex                                                                                              |
| 0x4    | s16                              | Incremented at the start of each "try-acquire" loop, then decremented. Used to detect errors (error if counter \> 0) |
| 0x6    | s16                              | Incremented before each context switch while trying to acquire the mutex, then decremented                           |

[Category:Kernel objects](Category:Kernel_objects "wikilink")
