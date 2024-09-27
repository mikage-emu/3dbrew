+++
title = 'KProcess'
categories = ["Kernel synchronization objects","Kernel interrupt events"]
+++

class [KProcess](KProcess "wikilink") extends
[KSynchronizationObject](KSynchronizationObject "wikilink") and
[KSendableInterruptEvent](KSendableInterruptEvent "wikilink");

Size : 0x270 (N3DS) / 0x268 bytes (O3DS post 8.x) / 0x260 bytes (O3DS
pre 8.x). 0x4D8 bytes on ARM9. The only field that changed is the
[KProcessHwInfo](KProcessHwInfo "wikilink") member instance. The
definition of KProcess remain identical in all cases.

The listed offsets are N3DS-only.

| Offset | Type                                                           | Description                                                                                                                                                                                                                                   |
|--------|----------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | void\*\*                                                       | Pointer to vtable                                                                                                                                                                                                                             |
| 0x4    | u32                                                            | Reference count                                                                                                                                                                                                                               |
| 0x8    | u32                                                            | Count of KThreads that sync with this object - number of nodes in the linked list below                                                                                                                                                       |
| 0xC    | KLinkedListNode\*                                              | Pointer to first KLinkedListNode in node list of KThreads that sync with this object                                                                                                                                                          |
| 0x10   | KLinkedListNode\*                                              | Pointer to last KLinkedListNode in node list of KThreads that sync with this object                                                                                                                                                           |
| 0x14   | [KSendableInterruptEvent](KSendableInterruptEvent "wikilink")  | Interrupt event (\*this) sent to terminate the process                                                                                                                                                                                        |
| 0x1C   | [KProcessHwInfo](KProcessHwInfo "wikilink")                    | Process hardware/context info. Used to manage segmentation, etc.                                                                                                                                                                              |
| 0x68   | u32                                                            | Total size of all [Thread Context](Memory_layout#0xff4xx000 "wikilink") pages owned by threads that belong to this process                                                                                                                    |
| 0x6C   | u32                                                            | Number of [KThreadLocalPages](KThreadLocalPage "wikilink") used by this KProcess                                                                                                                                                              |
| 0x70   | KLinkedListNode\*                                              | Pointer to first KLinkedListNode in the list of KThreadLocalPages                                                                                                                                                                             |
| 0x74   | KLinkedListNode\*                                              | Pointer to last KLinkedListNode in the list of KThreadLocalPages                                                                                                                                                                              |
| 0x78   | u32                                                            | Unknown                                                                                                                                                                                                                                       |
| 0x7C   | s32                                                            | Ideal processor for this process                                                                                                                                                                                                              |
| 0x80   | KDebug\*                                                       | KDebug object created from [svc 0x60](SVC "wikilink") to debug the process                                                                                                                                                                    |
| 0x84   | KResourceLimit\*                                               | Pointer to resource limits for process.                                                                                                                                                                                                       |
| 0x88   | u8                                                             | Normally 1 to indicate process is open/available. Set to 2 to indicate process is exiting/closing and 3 to indicate exited/closed.                                                                                                            |
| 0x89   | u8                                                             | Process affinity mask                                                                                                                                                                                                                         |
| 0x8A   | u16                                                            | Unused, alignment                                                                                                                                                                                                                             |
| 0x8C   | s16                                                            | Number of threads which belong to this process.                                                                                                                                                                                               |
| 0x8E   | s16                                                            | Max number of threads which can belong to this process. This is always 0.                                                                                                                                                                     |
| 0x90   | 0x10-bytes                                                     | SVC access control mask from the exheader kernel descriptors. This is copied to the [Thread Context](Memory_layout#0xff4xx000 "wikilink") area when creating threads, which is the actual data the SVC-handler checks for SVC-access-control. |
| 0xA0   | u32\[4\]                                                       | Interrupt flags- 32 interrupts per word, 4 words, 0x80 interrupts total divided evenly across 4 words                                                                                                                                         |
| 0xB0   | u32                                                            | Kernel flags from the exheader kernel descriptors.                                                                                                                                                                                            |
| 0xB4   | u16                                                            | Handle table size from the exheader kernel descriptors. When this is 0, handle table is stored in WRAM.                                                                                                                                       |
| 0xB6   | u16                                                            | Kernel release version field, from the exheader kernel descriptors.                                                                                                                                                                           |
| 0xB8   | KCodeSet\*                                                     | Pointer to [KCodeSet](KCodeSet "wikilink") instance                                                                                                                                                                                           |
| 0xBC   | u32                                                            | Process id, this always begins at 0x0 for the first process.                                                                                                                                                                                  |
| 0xC0   | s64                                                            | Process creation time as tick count                                                                                                                                                                                                           |
| 0xC8   | KThread\*                                                      | Pointer to the process's main thread.                                                                                                                                                                                                         |
| 0xCC   | u32\[4\]                                                       | Interrupt enabled flags- 32 interrupts per word, 4 words, 0x80 interrupts total divided evenly across 4 words                                                                                                                                 |
| 0xDC   | [KProcessHandleTable](KProcess#kprocesshandletable "wikilink") | This is the data for tracking and using all of the KProcess's handles.                                                                                                                                                                        |
| 0x234  | u32                                                            | Unused (From here up, everything is set to 0 on creation, has 0 written to it again during process creation, and is never used again.)                                                                                                        |
| 0x238  | u64                                                            | Unused                                                                                                                                                                                                                                        |
| 0x240  | u64                                                            | Unused                                                                                                                                                                                                                                        |
| 0x248  | u64                                                            | Unused                                                                                                                                                                                                                                        |
| 0x250  | u64                                                            | Unused                                                                                                                                                                                                                                        |
| 0x258  | u64                                                            | Unused                                                                                                                                                                                                                                        |
| 0x260  | u64                                                            | Unused                                                                                                                                                                                                                                        |
| 0x268  | u64                                                            | Unused                                                                                                                                                                                                                                        |

# KProcessHandleTable

| Offset | Type                                    | Description                                                                                                                                                                                |
|--------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | HandleDescriptor\*                      | Pointer to the process's handle table.                                                                                                                                                     |
| 0x4    | s16                                     | The max number of handles that can be open at once - usually 0x200.                                                                                                                        |
| 0x6    | s16                                     | The highest count of handles that have been open at once                                                                                                                                   |
| 0x8    | HandleDescriptor\*                      | Pointer to the next open HandleDescriptor entry in the handle table.                                                                                                                       |
| 0xC    | s16                                     | Total handles used by this KProcess.                                                                                                                                                       |
| 0xE    | s16                                     | The current number of handles in use.                                                                                                                                                      |
| 0x10   | [KObjectMutex](KObjectMutex "wikilink") | Mutex                                                                                                                                                                                      |
| 0x18   | HandleDescriptor\[0x28\]                | This small handle data table, internal to the KProcess, is only used in certain processes that don't have an external handle descriptor table in FCRAM. It is all zeros in most processes. |

# HandleDescriptor

| Offset | Type | Description                                              |
|--------|------|----------------------------------------------------------|
| 0x0    | u32  | Handle info                                              |
| 0x4    | u32  | Pointer to the kernel object that the handle references. |

The handle info u32 works as such:

The high byte is a remainder from the pointer to the next entry that
originally occupied the handle table entry. It is unused. Byte 2 is
either the class type token starting with firmware version 9.0 or the
lowest byte of the char\* that points to the class type name in firmware
versions below 9.0. The lower halfword is the handle number of the
current handle taken from the total handle count for the KProcess that
owns the table.

On table creation, each entry in the handle data table is populated with
a pointer to the next entry in the table. When a new handle is created,
that pointer is moved into offset 0x8 of the KProcessHandleTable info
struct to use for generation of the next handle.

The final handle that gets returned when a handle is created is
(handle_index \| (handle_total \<\< 15)), basically they take the index
into the handle data table and OR that with the total handle count \<\<
15. This returned value is the one that gets passed back to the running
application and is used to look up the HandleDescriptor entry in the
table.

[Category:Kernel synchronization
objects](Category:Kernel_synchronization_objects "wikilink")
[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")
