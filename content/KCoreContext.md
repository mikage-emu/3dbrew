+++
title = 'KCoreContext'
categories = ["Kernel objects"]
+++

Size: 0x9000 bytes (effective size: 0x6000 bytes)

There's one instance of this structure per core. The instance for the
current core is aliased at 0xFFFF1000

| Offset | Type                                        | Description                                                                                                   |
|--------|---------------------------------------------|---------------------------------------------------------------------------------------------------------------|
| 0x0    | u32\[0x400\]                                | N/A (unmapped memory)                                                                                         |
| 0x1000 | u32\[0x1000\]                               | L1 translation table (TTB1). The unused part of it is used as stack for exception modes other than supervisor |
| 0x5000 | u32\[0x400\]                                | N/A                                                                                                           |
| 0x6000 | [KThreadContext](KThreadContext "wikilink") | Context for the scheduler's thread                                                                            |
| 0x7000 | u32\[0x400\]                                | N/A                                                                                                           |
| 0x8000 | KCoreObjectContext                          | Currently used objects, see below                                                                             |

KCoreObjectContext

Size: 0x1000 bytes

| Offset | Type                                                                                      | Description                                                                                                                              |
|--------|-------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | [KThread](KThread "wikilink")\*                                                           | Pointer to the current thread for this core                                                                                              |
| 0x4    | [KProcess](KProcess "wikilink")\*                                                         | Pointer to the current process for this core                                                                                             |
| 0x8    | [KScheduler](KScheduler "wikilink")\*                                                     | Pointer to the current scheduler for this core                                                                                           |
| 0xC    | [KSchedulableInterruptEventLinkedList](KSchedulableInterruptEventLinkedList "wikilink")\* | Pointer to the current instance of [KSchedulableInterruptEventLinkedList](KSchedulableInterruptEventLinkedList "wikilink") for this core |
| 0x10   | [KThread](KThread "wikilink")\*                                                           | Pointer to the last thread having encountered an exception for this core, used when dumping FPU registers                                |
| 0x14   | u8\[4\]                                                                                   | Padding ?                                                                                                                                |
| 0x18   | [KThread](KThread "wikilink")                                                             | Scheduler thread instance                                                                                                                |
| 0xC8   | [KScheduler](KScheduler "wikilink")                                                       | Scheduler instance                                                                                                                       |
| 0x2F0  | [KSchedulableInterruptEventLinkedList](KSchedulableInterruptEventLinkedList "wikilink")   | [KSchedulableInterruptEventLinkedList](KSchedulableInterruptEventLinkedList "wikilink") instance                                         |
| 0x300  | u8\[0x874\]                                                                               | Unused ?                                                                                                                                 |
| 0xB74  | u32\[0x123\]                                                                              | Unknown stack                                                                                                                            |

[Category:Kernel objects](Category:Kernel_objects "wikilink")