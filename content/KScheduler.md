+++
title = 'KScheduler'
categories = ["Kernel interrupt events"]
+++

class [KScheduler](KScheduler "wikilink") extends
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink");

Size : 0x228 bytes

| Offset | Type                                                           | Description                                                                                                                                             |
|--------|----------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void \*\*                                                      | Pointer to vtable                                                                                                                                       |
| 0x4    | [KSynchronizationObject](KSynchronizationObject "wikilink") \* | Inherited field. Unused.                                                                                                                                |
| 0x8    | u32                                                            | Count for thread switch attempts - this is only added to if a context switch function runs but exits because the scheduler is locked by another thread. |
| 0xC    | bool                                                           | Context switch needed                                                                                                                                   |
| 0xD    | bool                                                           | Context switch started during interrupt                                                                                                                 |
| 0xE    | bool                                                           | Trigger CPU cross-core interrupt (interrupt 8)                                                                                                          |
| 0xF    | bool                                                           | Post-interrupt rescheduling needed                                                                                                                      |
| 0x10   | s16                                                            | Scheduler core number                                                                                                                                   |
| 0x12   | s16                                                            | Count of threads currently being managed by this scheduler object                                                                                       |
| 0x14   | u32                                                            | Bit field for high priority threads in KScheduler(0-31)                                                                                                 |
| 0x18   | u32                                                            | Bit field for low priority threads in KScheduler(32-63)                                                                                                 |
| 0x1C   | KThread\*                                                      | Scheduler's idle thread (runs when no other runnable thread is available)                                                                               |
| 0x20   | [KThreadLinkedList](KThread "wikilink")                        | Linked list of threads managed by this KScheduler instance                                                                                              |
| 0x28   | ThreadSchedulePrioList\[64\]                                   | List of KThread pair structs by priority                                                                                                                |

There is 1 KScheduler object per core.

KScheduler instances are mapped to SGI \#8. The interrupt
handler/callback returns 1, which triggers a post-interrupt rescheduling
and context switch (like all the other handlers not returning NULL), but
does nothing else in particular. The second virtual method is stubbed.

Each priority of KThread has an associated linked list of KThreads
object pointers below the KScheduler object. Each pair of pointers makes
up 1 entry in that core's Scheduler for their priority.

Priority bit fields:

Each bit field goes from the most significant bit to the least
significant bit, high priority to low priority. This means, for example,
that bit 31 in the high priority bit field is for priority 0 and bit 0
is for priority 31. These fields are set when a KThread with the
corresponding priority is added for scheduling and are cleared when the
last KThread in the linked list for a given priority is removed from the
scheduler.

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")