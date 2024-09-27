class [KThread](KThread "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink"),
[KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink"),
[KSendableInterruptEvent](KSendableInterruptEvent "wikilink") and
[KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink");

Size : 0xB0 bytes

| Offset | Type                                                                | Description                                                                                                                                                                                                                                                                                                                   |
|--------|---------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | u32                                                                 | Pointer to vtable                                                                                                                                                                                                                                                                                                             |
| 0x4    | u32                                                                 | Reference count                                                                                                                                                                                                                                                                                                               |
| 0x8    | u32                                                                 | Count of KThreads that sync with this object - number of nodes in the linked list below                                                                                                                                                                                                                                       |
| 0xC    | KLinkedListNode\*                                                   | Pointer to first KLinkedListNode in node list of KThreads that sync with this object                                                                                                                                                                                                                                          |
| 0x10   | KLinkedListNode\*                                                   | Pointer to last KLinkedListNode in node list of KThreads that sync with this object                                                                                                                                                                                                                                           |
| 0x14   | [KTimeableInterruptEvent](KTimeableInterruptEvent "wikilink")       | Used to suspend threads (\*this)                                                                                                                                                                                                                                                                                              |
| 0x24   | [KSendableInterruptEvent](KSendableInterruptEvent "wikilink")       | Interrupt event (\*this) sent to terminate a thread, except in the case just below                                                                                                                                                                                                                                            |
| 0x2C   | [KSchedulableInterruptEvent](KSchedulableInterruptEvent "wikilink") | Interrupt event (\*this) scheduled by the IRQ handler when the thread should terminate (\*this)                                                                                                                                                                                                                               |
| 0x34   | u8                                                                  | Scheduling mask                                                                                                                                                                                                                                                                                                               |
| 0x35   | u8                                                                  | Set to 1 when a thread is woken up from a svcSendSyncRequest call due to the ServerSession endpoint closing down                                                                                                                                                                                                              |
| 0x36   | s8                                                                  | Indicates that the thread shall terminate                                                                                                                                                                                                                                                                                     |
| 0x37   | u8                                                                  | Indicates there was an error translating the parameters in the command buffer during an IPC call                                                                                                                                                                                                                              |
| 0x38   | KDebugThread\*                                                      | Pointer to KDebugThread object used with the current KThread                                                                                                                                                                                                                                                                  |
| 0x3C   | u32                                                                 | Base thread priority                                                                                                                                                                                                                                                                                                          |
| 0x40   | u32                                                                 | Pointer to object the KThread is waiting on- can be a timer, event, session, etc.                                                                                                                                                                                                                                             |
| 0x44   | Result                                                              | Status for object above                                                                                                                                                                                                                                                                                                       |
| 0x48   | KObjectMutex\*                                                      | Locking kernel mutex                                                                                                                                                                                                                                                                                                          |
| 0x4C   | u32                                                                 | Arbitration address                                                                                                                                                                                                                                                                                                           |
| 0x50   | KLinkedListNode\*                                                   | Pointer to first KLinkedListNode in node list of objects this thread is waiting on                                                                                                                                                                                                                                            |
| 0x54   | KLinkedListNode\*                                                   | Pointer to last KLinkedListNode in node list of objects this thread is                                                                                                                                                                                                                                                        |
| 0x5C   | [KMutexLinkedList](KMutex "wikilink") \*                            | Set in some very specific circumstances                                                                                                                                                                                                                                                                                       |
| 0x60   | u32                                                                 | Count of KMutex objects this thread is using                                                                                                                                                                                                                                                                                  |
| 0x64   | KLinkedListNode\*                                                   | Pointer to first KLinkedListNode in node list of KMutex objects this thread is using                                                                                                                                                                                                                                          |
| 0x68   | KLinkedListNode\*                                                   | Pointer to last KLinkedListNode in node list of KMutex objects this thread is using                                                                                                                                                                                                                                           |
| 0x6C   | s32                                                                 | Dynamic thread priority                                                                                                                                                                                                                                                                                                       |
| 0x70   | s32                                                                 | Processor that created the thread (in the sense of "first ran") ; processor the thread is running in                                                                                                                                                                                                                          |
| 0x74   | [KPreemptionTimer](KResourceLimit "wikilink") \*                    | Points to [KResourceLimit](KResourceLimit "wikilink")+0x60, which among other things holds the amount of CPU time available in ticks, or NULL                                                                                                                                                                                 |
| 0x7C   | u8                                                                  | Thread is alive                                                                                                                                                                                                                                                                                                               |
| 0x7D   | u8                                                                  | Thread has been terminated                                                                                                                                                                                                                                                                                                    |
| 0x7E   | u8                                                                  | Thread affinity mask - set differently depending on whether the thread is created via svc call or from inside the kernel                                                                                                                                                                                                      |
| 0x80   | KProcess\*                                                          | Process the thread belongs to (virtual address)                                                                                                                                                                                                                                                                               |
| 0x84   | u32                                                                 | Thread id                                                                                                                                                                                                                                                                                                                     |
| 0x88   | u32\*                                                               | Ptr to svc mode register storage for KThread inside the thread context.                                                                                                                                                                                                                                                       |
| 0x8C   | u32\*                                                               | End-address of the page for this thread context allocated in the [0xFF4XX000](Memory_layout "wikilink") region. Thus, if the beginning of this mapped page is 0xFF401000, this ptr would be 0xFF402000. Thread context page - used for thread svc stack, preserving svc mode registers and VFP exception register for thread. |
| 0x90   | s32                                                                 | Ideal processor (processorid value from [svcCreateThread](SVC "wikilink"))                                                                                                                                                                                                                                                    |
| 0x94   | void\*                                                              | Ptr to [Thread Local Storage](Thread_Local_Storage "wikilink")                                                                                                                                                                                                                                                                |
| 0x98   | void\*                                                              | Ptr to [Thread Local Storage](Thread_Local_Storage "wikilink") in FCRAM via kernel vmem                                                                                                                                                                                                                                       |
| 0xA0   | KThreadLinkedListNode                                               | Previous and next scheduled threads                                                                                                                                                                                                                                                                                           |
| 0xA8   | KThreadLinkedList \*                                                | Pointer to linked list of scheduled threads that has stolen it, or 0 if in normal list                                                                                                                                                                                                                                        |
| 0xAC   | s32                                                                 | Priority to restore after sleep if suspended, otherwise -1                                                                                                                                                                                                                                                                    |

With the following declarations:
`struct KThreadLinkedList { KThread *first, *last; };` and
`struct KThreadLinkedListNode { KThread *prev, *next; };`.

# Thread Scheduling Mask

The thread scheduling mask is made of a low nibble (enum) and a high
nibble (bitfield).

Low nibble:

| Value | Description                    |
|-------|--------------------------------|
| 0     | The thread is not scheduled    |
| 1     | The thread is scheduled        |
| 2     | The thread is being terminated |

High nibble:

| Mask        | Description                      |
|-------------|----------------------------------|
| 0           | Nothing special                  |
| 0x8 (bit 3) | The thread has been debug-locked |

A thread is scheduled \*if and only if\* its (full) scheduling mask is
exactly 1. This allows debug-(un)locking of threads to be done
transparently.

# Thread Affinity Mask

If the thread is created via a call to SVC 8(CreateThread), which uses
thread creation type 3, and the CPU ID is -2(meaning use the core
specified in the exheader), the mask is just the affinity mask from the
thread's owner KProcess. If the CPU ID is -1(meaning any core), the
affinity mask is set to 0xF on the New3DS and 0x3 on the Old3DS.
Otherwise, the affinity mask is (1 \<\< cpu_id) \| 1.

If the thread is created via a call by the kernel, which uses thread
creation types 0-2, the checks for -1 and -2 are skipped and the mask is
always (1 \<\< cpu_id) \| 1.

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")
[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")