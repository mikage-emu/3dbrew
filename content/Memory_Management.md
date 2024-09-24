+++
title = 'Memory Management'
+++

# Types and structures

## enum MemoryOperation

| Memory operation | Id      |
|------------------|---------|
| FREE             | 1       |
| RESERVE          | 2       |
| COMMIT           | 3       |
| MAP              | 4       |
| UNMAP            | 5       |
| PROTECT          | 6       |
| REGION APP       | 0x100   |
| REGION SYSTEM    | 0x200   |
| REGION BASE      | 0x300   |
| LINEAR           | 0x10000 |

The LINEAR memory-operation indicates that the mapped physical address
is always MappedVAddr+0x0C000000, thus this memory can be used for
hardware devices' DMA(such as the [GPU](GPU "wikilink")). Addr0+size for
this must be within the 0x14000000-0x1C000000 range when Addr0 is
non-zero(Addr1 must be zero), Addr0 isn't actually used by
svcControlMemory for mapping memory: Addr0 is not used by the kernel
after doing address-range checks. The kernel determines what
physical-address to use by allocating memory from FCRAM(about the same
way as other memory), which is then used to determine the
virtual-address.

[8.0.0-18](8.0.0-18 "wikilink") added a new memory
mapping(0x30000000-0x38000000) for LINEAR memory, this replaces the
original mapping for newer titles. The kernel uses the new mapping when
the process memory-region is BASE, or when the process
kernel-release-version field is \>=0x022c(2.44 / system-version
[8.0.0-18](8.0.0-18 "wikilink")).

The input mem-region value for svcControlMemory is only used(when
non-zero) when the PID is value 1, for the [FIRM](FIRM "wikilink") ARM11
"loader" module.

## enum MemoryPermission

| Memory permission      | Id         |
|------------------------|------------|
| NONE                   | 0          |
| R                      | 1          |
| W (Invalid, see below) | 2          |
| RW                     | 3          |
| X                      | 4          |
| RX                     | 5          |
| WX                     | 6          |
| RWX                    | 7          |
| DONTCARE               | 0x10000000 |

Specifying write-permission without read-permission is invalid, it's
handled the same way as if the RW bits were not set(ARM11-MPCore doesn't
support write-only memory permissions).

## enum MemoryState

| Memory state flags | Value |
|--------------------|-------|
| FREE               | 0     |
| RESERVED           | 1     |
| IO                 | 2     |
| STATIC             | 3     |
| CODE               | 4     |
| PRIVATE            | 5     |
| SHARED             | 6     |
| CONTINUOUS         | 7     |
| ALIASED            | 8     |
| ALIAS              | 9     |
| ALIAS CODE         | 10    |
| LOCKED             | 11    |

## struct MemoryInfo

| Type             | Field                        |
|------------------|------------------------------|
| u32              | Base process virtual address |
| u32              | Size                         |
| u32              | Permission                   |
| enum MemoryState | State                        |

## enum PageFlags

| Page flags | Bit |
|------------|-----|
| LOCKED     | 0   |
| CHANGED    | 1   |

## struct PageInfo

| Type            | Field |
|-----------------|-------|
| PageFlags (u32) | Flags |

# Memory Mapping

ControlMemory and MapMemoryBlock can be used to map memory pages, these
two SVCs only support mapping execute-never R/W pages. The input
permissions parameter for these SVCs must therefore be \<=3, where value
zero is used when un-mapping memory. Furthermore it appears that only
regular heap pages can be mirrored (it won't work for TLS, stack, .data,
.text, for example).

Bitmask 0xF00 for ControlMemory parameter MemoryType is the memory-type,
when this is zero the memory-type is loaded from the kernel flags stored
in the exheader ARM11 kernel descriptors, for the process using the SVC.

ControlMemory parameter MemoryType with value 0x10003 is used for
mapping the GSP [heap](Memory_layout "wikilink"). The low 8-bits are the
type: 1 is for un-mapping memory, 3 for mapping memory. Type4 is used to
mirror the RW memory at Addr1, to Addr0. Type4 will return an error if
Addr1 is located in read-only memory. Addr1 is not used for type1 and
type3.

The ARM11 kernel does not allow processes to create shared memory blocks
via svcCreateMemoryBlock, when the process memorytype (from the kernel
flags stored in the exheader kernel descriptor) is the application
memorytype, and when addr=0. When the memorytype is not the application
memorytype and addr=0, the kernel allocates new memory for the calling
process and turns it into a shared memory block. When addr is non-zero,
it must be located in memory which is already mapped. Furthermore, it
appears that only regular heap pages (allocated using svcControlMemory
op=COMMIT) are accepted as valid addrs. The addr(+size) must be
\>=0x00100000 and \<0x14000000.

ControlProcessMemory maps memory in the specified process, this is the
only SVC which allows mapping executable memory. Format of the
permissions field for memory mapping SVCs: bit0=R, bit1=W, bit2=X. Type6
sets the Addr0 memory permissions to the input permissions, for already
mapped memory. Type is the MemoryOperation enum, without the
memory-type/memory-region. ControlProcessMemory only supports type4,
type5, and type6. ControlProcessMemory does not support using the
current KProcess handle alias.

Note that with the MAP MemoryOperation, the kernel will refuse to MAP
memory for the specified addr1, when addr1 was already used with another
MAP operation as addr1. The kernel also doesn't allow memory to be freed
via the FREE MemoryOperation, when other virtual-memory is mapped to
this same memory(when the MAP MemoryOperation was used with this memory
with addr1). With the MAP MemoryOperation, the memory permissions for
the original buffer are also set to no-access.

**`MapProcessMemory`**`(Handle process, u32 destAddr, u32 limit)` maps
memory from the given process into the current process. This memory is
mapped with permissions RW-, regardless of the permissions for the
memory under the specified process. First `min(limit, 0x3F00000)` bytes
are mapped starting from `0x00100000` in the source process to
`destAddr` in the current process. Then
`min(limit - 0x7F00000, 0x6000000)` bytes (if more than 0) are mapped
from `0x08000000` in the source process to `destAddr + 0x7F00000` in the
current process. Another way to view this is that it is overlaying the
two ranges `[0x0010_0000; 0x0400_0000]` and `[0x0800_0000; 0x0E00_0000]`
from the source process onto `[destAddr - 0x100000; destAddr + limit]`
in the current process, truncating whatever part of the mapping that
doesn't fit. This system call is used by [RO
Services](RO_Services "wikilink") to map the program's code and heap
into ro. Memory mapped by MapProcessMemory is unmapped by
UnmapProcessMemory.

# How The Kernel Allocates And Tracks Memory

FCRAM (128MiB for O3DS, or 256MiB for N3DS) is divided into three
regions: APPLICATION, SYSTEM and BASE. A program is allowed to allocate
memory in one of the three region. (For example games are always in the
APPLICATION region). Inside one region, there are two kinds of memory
that can be allocated: (regular) heap and linear heap.

(Regular) heap is allocated starting from the end of the memory region,
and growing down. They are mostly for application private use, and
sometimes for software-based memory sharing (with other process using
KSharedMemory, for example). They can be mapped to anywhere inside
0x08000000~0x10000000 virtual memory range upon application request.
When the application requests for a block of heap, the block is not
guaranteed continuous in FCRAM and the location is not specified either.

Linear heap is allocated starting from the beginning of the memory
region, and growing up. They are mostly for hardware-based memory
sharing (with GPU, DMA etc.), but can also be used privately as well.
They can be mapped to the linear heap virtual memory region (0x14000000+
or 0x30000000+, depending on game's kernel version). When the
application requests for a linear heap block, the block is always
continuous in FCRAM, and the difference between physical address and
virtual address is always a constant. Therefore it gives virtual to
physical address convertibility, which enables communication with other
hardware.

Each region in the kernel is managed by a dedicated KPageHeap object,
which tracks free memory blocks. Each free block is represented with a
KPageHeapBlock structure stored in FCRAM that stores the size of the
free region and links to adjacent blocks. When a chunk of memory is
allocated from the heap, the block is removed from the linked list and
the region is cleared, erasing the header. On initialization a free
block is inserted that covers the entire region.

## KPageHeapBlock

Size: 0xC-bytes(?) pre-v11.0, 0x18-bytes starting with v11.0.

| Offset | Type             | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
|--------|------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | u32              | Size in pages                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| 0x4    | KPageHeapBlock\* | Next                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 0x8    | KPageHeapBlock\* | Prev                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 0xC    | KPageHeapBlock\* | Pointer to the current memchunk. Added with v11.0?                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 0x10   | u32              | Nonce, doesn't seem to be read at all except during MAC calculation. Added with v11.0. Used with the new heap [security](11.0.0-33 "wikilink") feature. A kernel state field is copied to this field before calculating the MAC. Once done, that kernel state field is subtracted by the value of the calculated MAC stored below. Since this kernel state field is initially 0x0, this field for the FCRAM APPLICATION+0 KPageHeapBlock during kernel boot is set to 0x0. |
| 0x14   | u32              | MAC calculated over rest of struct. Added with v11.0. Used with the new heap [security](11.0.0-33 "wikilink") feature.                                                                                                                                                                                                                                                                                                                                                     |

## KPageHeap

Size: 0x10-bytes pre-[11.0.0-X](11.0.0-33 "wikilink"), 0x20-bytes
starting with [11.0.0-X](11.0.0-33 "wikilink").

| Offset | Type             | Description                                                                                        |
|--------|------------------|----------------------------------------------------------------------------------------------------|
| 0x0    | KPageHeapBlock\* | First                                                                                              |
| 0x4    | KPageHeapBlock\* | Last                                                                                               |
| 0x8    | u32              | Region start                                                                                       |
| 0xC    | u32              | Region size                                                                                        |
| 0x10   | 0x10-byte block. | This is the "key" used with the kernel heap MAC implemented with [11.0.0-X](11.0.0-33 "wikilink"). |

The KPageHeap objects are owned by the KMemoryManager. This object acts
as a light wrapper that abstracts allocations and freeing of memory from
the heaps and handles page reference tracking.

## KMemoryManager

Size: 0x50-bytes pre-[11.0.0-X](11.0.0-33 "wikilink"), 0x80-bytes
starting with [11.0.0-X](11.0.0-33 "wikilink").

X = KPageHeap_size\*3.

| Offset            | Type             | Description                                                                                        |
|-------------------|------------------|----------------------------------------------------------------------------------------------------|
| 0x0               | KPageHeap        | KPageHeap for app memory                                                                           |
| KPageHeap_size\*1 | KPageHeap        | KPageHeap for sys memory                                                                           |
| KPageHeap_size\*2 | KPageHeap        | KPageHeap for base memory                                                                          |
| X + 0x0           | KMemoryManager\* | Ptr to start of FCRAM region descriptor                                                            |
| X + 0x4           | u32              | FCRAM start                                                                                        |
| X + 0x8           | u32              | FCRAM size in pages                                                                                |
| X + 0xC           | u32\*            | Pointer to FCRAM memory used for page reference tracking. Each u32 represents a page.              |
| X + 0x10          | u32              | Count of physical FCRAM used by the kernel, in bytes. (used by [svcGetSystemInfo](SVC "wikilink")) |
| X + 0x14          | u32              | ?                                                                                                  |
| X + 0x18          | KLightMutex      | Mutex used for thread synchronization during memory (de)allocation from the heaps.                 |

## Kernel Region Descriptor