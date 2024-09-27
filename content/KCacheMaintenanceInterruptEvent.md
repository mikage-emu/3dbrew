+++
title = 'KCacheMaintenanceInterruptEvent'
categories = ["Kernel interrupt events"]
+++

class
[KCacheMaintenanceInterruptEvent](KCacheMaintenanceInterruptEvent "wikilink")
extends [KBaseInterruptEvent](KBaseInterruptEvent "wikilink")

This object handles data cache (L2C *not* included) and instruction
cache maintainance.

There is only one instance of this object.

Size : 0x4C bytes (N3DS) / 0x34 bytes (O3DS)

| Offset | Type                                                    | Description                                                                                                                        |
|--------|---------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                               | Pointer to vtable                                                                                                                  |
| 0x4    | u8                                                      | Cache operation                                                                                                                    |
| 0x5    | u8                                                      | Indicates whether to do the operation asynchronically (this is what is used when processes are running for ranges \>= 0x200 bytes) |
| 0x6    | s8                                                      | Number of cores still doing cache maintenance operations                                                                           |
| 0x7    | u8                                                      | Padding                                                                                                                            |
| 0x8    | [KThread](KThread "wikilink") \*                        | Thread operating on the object                                                                                                     |
| 0xC    | void \*                                                 | Start address (when applicable)                                                                                                    |
| 0x10   | void \*                                                 | End address (when applicable)                                                                                                      |
| 0x14   | KThreadLinkedListNode \*                                | Related to KThread+0xA0                                                                                                            |
| 0x18   | KThreadLinkedList \*                                    | KThread+0xA8 of the current thread                                                                                                 |
| 0x1C   | KAsyncCacheMaintenanceInterruptEvent\[number of cores\] | Used when the field at offset 0x5 is 1, see below                                                                                  |

Possible operations (any other value leads to a kernel panic):

| Operation | Description                                                                                             |
|-----------|---------------------------------------------------------------------------------------------------------|
| 4         | Invalidate data cache range                                                                             |
| 5         | Clean data cache range                                                                                  |
| 6         | Clean and invalidate data cache range                                                                   |
| 7         | Invalidate instruction cache range (also flush the entire branch target cache and the prefetch buffer)  |
| 8         | Invalidate entire data cache                                                                            |
| 9         | Clean entire data cache                                                                                 |
| 10        | Clean and invalidate entire data cache                                                                  |
| 11        | Invalidate entire instruction cache (also flush the entire branch target cache and the prefetch buffer) |

KAsyncCacheMaintenanceInterruptEvent extends
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink"),
size = 0xC bytes:

| Offset | Type                                                                   | Description                                                                                                              |
|--------|------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                                              | Pointer to vtable                                                                                                        |
| 0x4    | [KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink") \* | Next interrupt event                                                                                                     |
| 0x8    | const [KThread](KThread "wikilink") \*                                 | Thread woken up by the first virtual function of this object, doing the actual cache maintenance operation. Same for all |

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")