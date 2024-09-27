+++
title = 'KEventInfo'
categories = ["Kernel objects"]
+++

Size : 0x38 bytes

It is converted to [struct
DebugEventInfo](SVC#struct_debugeventinfo "wikilink") by using
svcContinueDebugEvent.

## Object definition

| Offset | Type            | Description                                                                                                                                                                                                                           |
|--------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | u32             | Event type                                                                                                                                                                                                                            |
| 0x4    | u32             | Current KThread ID                                                                                                                                                                                                                    |
| 0x8    | u32             | Flags. In all observed cases, bit0 means that svcContinueDebugEvent needs to be called for this event (except for EXIT PROCESS events, for which you need to call svcContinueDebugEvent even if this bit is clear)                    |
| 0xC    | u8              | ATTACH PROCESS/THREAD events: 1 if the object was attached by svcDebugActiveProcess, 0 otherwise (this is always 1 for processes)                                                                                                     |
| 0xD    | u8              | Equal to bit0 of field 0x8 in all observed cases: indicates that svcContinueDebugEvent needs to be called for this event (except for EXIT PROCESS events, for which you need to call svcContinueDebugEvent even if this bit is clear) |
| 0xE    | bool            | Ignore continue                                                                                                                                                                                                                       |
| 0xF    | u8              | Indicates that the event has been handled and should be deleted                                                                                                                                                                       |
| 0x10   | `union { ... }` | Event-specific data, see below (slightly different from DebugEventInfo)                                                                                                                                                               |

## Event-specific data

### ATTACH PROCESS event

| Type                               | Field   |
|------------------------------------|---------|
| [KProcess](KProcess "wikilink") \* | Process |

### ATTACH THREAD event

| Type    | Field                                                      |
|---------|------------------------------------------------------------|
| u32     | Creator thread ID (0 if attached by svcDebugActiveProcess) |
| void \* | Thread local storage                                       |
| u32 \*  | Entrypoint = .text load address of the parent process      |

### EXIT THREAD/PROCESS events

| Type | Field       |
|------|-------------|
| u32  | Exit reason |

### EXCEPTION event

| Type            | Field                                                                                                                                               |
|-----------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| u32             | Exception type                                                                                                                                      |
| u32             | Exception address                                                                                                                                   |
| u32             | Exception category: 4 for DEBUGGER BREAK, 3 for USER BREAK, 2 for STOP POINT, 1 for DATA ABORT/UNALIGNED DATA ACCESS/UNDEFINED SYSCALL, 0 otherwise |
| `union { ... }` | Type-specific data, see below                                                                                                                       |

#### UNDEFINED INSTRUCTION/PREFETCH ABORT/DATA ABORT/UNALIGNED DATA ACCESS/UNDEFINED SYSCALL/STOP POINT events

| Type | Field                                                                                                                                                    |
|------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| u32  | Fault information: Fault Address Register (for watchpoints, DATA ABORT and UNALIGNED DATA ACCESS), attempted SVC ID (for UNDEFINED SYSCALL), otherwise 0 |
| u32  | Stop point type that caused the event (when applicable): 0 = svc 0xFF, 1 = breakpoint, 2 = watchpoint                                                    |

#### USER BREAK event

| Type     | Field                                            |
|----------|--------------------------------------------------|
| u32      | Break reason                                     |
| u32\[2\] | User-provided parameters for debug reasons, or 0 |

#### DEBUGGER BREAK event

| Type     | Field                                                                                                                                                                           |
|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| s32\[4\] | IDs of the attached process's threads that were running on each core at the time of the @ref svcBreakDebugProcess call, or -1 (only the first 2 values are meaningful on O3DS). |

### SCHEDULE IN/OUT events

| Type     | Field                    |
|----------|--------------------------|
| u64      | Clock tick               |
| u32      | CPU ID                   |
| u32\[5\] | Unknown                  |
| u32 (?)  | Event info, apparently 0 |

### SYSCALL IN/OUT events

| Type | Field      |
|------|------------|
| u64  | Clock tick |
| u32  | Syscall ID |

### OUTPUT STRING event

| Type | Field          |
|------|----------------|
| u32  | String address |
| u32  | String size    |

### MAP event

| Type | Field            |
|------|------------------|
| u32  | Mapped address   |
| u32  | Mapped size      |
| u32  | MemoryPermission |
| u32  | MemoryState      |

[Category:Kernel objects](Category:Kernel_objects "wikilink")
