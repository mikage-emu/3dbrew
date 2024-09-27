+++
title = 'KResourceLimit'
categories = ["Kernel auto objects"]
+++

class [KResourceLimit](KResourceLimit "wikilink") extends
[KAutoObject](KAutoObject "wikilink");

Size : 0x74 bytes

| Offset | Type             | Description                                      |
|--------|------------------|--------------------------------------------------|
| 0x0    | u32              | Pointer to vtable                                |
| 0x4    | u32              | Reference count                                  |
| 0x8    | s32              | Max Priority                                     |
| 0xC    | s32              | Max commit                                       |
| 0x10   | s32              | Max thread                                       |
| 0x14   | s32              | Max event                                        |
| 0x18   | s32              | Max mutex                                        |
| 0x1C   | s32              | Max semaphore                                    |
| 0x20   | s32              | Max timer                                        |
| 0x24   | s32              | Max shared memory                                |
| 0x28   | s32              | Max address arbiter                              |
| 0x2C   | s32              | Max CPU time                                     |
| 0x30   | s32              | Current Priority                                 |
| 0x34   | s32              | Current commit                                   |
| 0x38   | s32              | Current thread                                   |
| 0x3C   | s32              | Current event                                    |
| 0x40   | s32              | Current mutex                                    |
| 0x44   | s32              | Current semaphore                                |
| 0x48   | s32              | Current timer                                    |
| 0x4C   | s32              | Current shared memory                            |
| 0x50   | s32              | Current address arbiter                          |
| 0x54   | s32              | Current CPU time                                 |
| 0x58   | KObjectMutex     | Mutex                                            |
| 0x60   | KPreemptionTimer | Preemption timer for the current core, see below |

There are 4 KResourceLimit objects created on the kernel heap. Each is
used for a different category specified by the exheader's resource limit
category specifier in the exheader [ARM11 Local System
Capabilities](NCCH/Extended_Header#arm11_local_system_capabilities "wikilink").

**KPreemptionTimer**:

| Offset | Type | Description                                                           |
|--------|------|-----------------------------------------------------------------------|
| 0x0    | u32  | Max CPU time in ticks for preemption type 0 (default preemption type) |
| 0x4    | u32  | Current timer (in watchdog timer ticks)                               |
| 0x8    | u32  | Last remembered watchdog timer counter value                          |
| 0xC    | u32  | Max CPU time in ticks for preemption type 1                           |

A call to svcSetResourceLimitValues with a limit value of 1000 for CPU
time must be done first to set up some global variables and the
associated [KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink")
instances, and another call needs to be made to actually enable
preemption.

Preemption type 0: this is the default, preempts threads on core1 and
allow them to run only 2ms \* (timeLimit / 100).

Preemption type 1: *seems* to be borked, it was apparently intended to
preempt threads on all cores but seems to only preempt the kernel thread
running the preemptor itself and threads on core1... (time slice: 12.5ms
\* (timeLimit / 100))

"Firm" dev consoles can switch between these two types using
svcKernelSetState type 6.

[Category:Kernel auto objects](Category:Kernel_auto_objects "wikilink")
