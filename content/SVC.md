+++
title = 'SVC'
+++

# System calls

**Note: The argument-lists here apply to the official syscall
wrapper-functions that are found in userland processes. The actual
ordering passed to the kernel via the SVC instruction is documented in
[Kernel ABI](Kernel_ABI "wikilink").**

| Id   | NF ARM11 | NF ARM9 | TF ARM11 | Description                                                                                                                                                                                                                                                                  | Notes                                                                                                                                                                                                                                             |
|------|----------|---------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x01 | Yes      | No      | No       | Result [ControlMemory](Memory_Management "wikilink")(u32\* outaddr, u32 addr0, u32 addr1, u32 size, [MemoryOperation](Memory_Management#enum_MemoryOperation "wikilink") operation, [MemoryPermission](Memory_Management#enum_MemoryPermission "wikilink") permissions)      | Outaddr is usually the same as the input addr0.                                                                                                                                                                                                   |
| 0x02 | Yes      | No      | No       | Result [QueryMemory](Memory_Management "wikilink")([MemoryInfo](Memory_Management#struct_MemoryInfo "wikilink")\* info, [PageInfo](Memory_Management#struct_PageInfo "wikilink")\* out, u32 Addr)                                                                            |                                                                                                                                                                                                                                                   |
| 0x03 | Yes      | No      | No       | void ExitProcess(void)                                                                                                                                                                                                                                                       |                                                                                                                                                                                                                                                   |
| 0x04 | Yes      | No      | No       | Result GetProcessAffinityMask(u8\* affinitymask, Handle process, s32 processorcount)                                                                                                                                                                                         |                                                                                                                                                                                                                                                   |
| 0x05 | Yes      | No      | No       | Result SetProcessAffinityMask(Handle process, u8\* affinitymask, s32 processorcount)                                                                                                                                                                                         |                                                                                                                                                                                                                                                   |
| 0x06 | Yes      | No      | No       | Result GetProcessIdealProcessor(s32 \*idealprocessor, Handle process)                                                                                                                                                                                                        |                                                                                                                                                                                                                                                   |
| 0x07 | Yes      | No      | No       | Result SetProcessIdealProcessor(Handle process, s32 idealprocessor)                                                                                                                                                                                                          |                                                                                                                                                                                                                                                   |
| 0x08 | Yes      | Yes     | Yes      | Result [CreateThread](Multi-threading#CreateThread "wikilink")(Handle\* thread, func entrypoint, u32 arg, u32 stacktop, s32 threadpriority, s32 processorid)                                                                                                                 |                                                                                                                                                                                                                                                   |
| 0x09 | Yes      | Yes     | Yes      | void [ExitThread](Multi-threading#ExitThread "wikilink")(void)                                                                                                                                                                                                               |                                                                                                                                                                                                                                                   |
| 0x0A | Yes      | Yes     | Yes      | void [SleepThread](Multi-threading#SleepThread "wikilink")(s64 nanoseconds)                                                                                                                                                                                                  |                                                                                                                                                                                                                                                   |
| 0x0B | Yes      | Yes     | Yes      | Result [GetThreadPriority](Multi-threading#GetThreadPriority "wikilink")(s32\* priority, Handle thread)                                                                                                                                                                      |                                                                                                                                                                                                                                                   |
| 0x0C | Yes      | Yes     | Yes      | Result [SetThreadPriority](Multi-threading#SetThreadPriority "wikilink")(Handle thread, s32 priority)                                                                                                                                                                        |                                                                                                                                                                                                                                                   |
| 0x0D | Yes      | No      | No       | Result [GetThreadAffinityMask](Multi-threading#GetThreadAffinityMask "wikilink")(u8\* affinitymask, Handle thread, s32 processorcount)                                                                                                                                       |                                                                                                                                                                                                                                                   |
| 0x0E | Yes      | No      | No       | Result [SetThreadAffinityMask](Multi-threading#SetThreadAffinityMask "wikilink")(Handle thread, u8\* affinitymask, s32 processorcount)                                                                                                                                       | Replaced with a stub in ARM11 NATIVE_FIRM kernel beginning with [8.0.0-18](8.0.0-18 "wikilink").                                                                                                                                                  |
| 0x0F | Yes      | No      | No       | Result [GetThreadIdealProcessor](Multi-threading#GetThreadIdealProcessor "wikilink")(s32\* processorid, Handle thread)                                                                                                                                                       |                                                                                                                                                                                                                                                   |
| 0x10 | Yes      | No      | No       | Result [SetThreadIdealProcessor](Multi-threading#SetThreadIdealProcessor "wikilink")(Handle thread, s32 processorid)                                                                                                                                                         | Replaced with a stub in ARM11 NATIVE_FIRM kernel beginning with [8.0.0-18](8.0.0-18 "wikilink").                                                                                                                                                  |
| 0x11 | Yes      | No      | No       | s32 GetCurrentProcessorNumber(void)                                                                                                                                                                                                                                          |                                                                                                                                                                                                                                                   |
| 0x12 | Yes      | No      | No       | Result [Run](Multi-threading#Run "wikilink")(Handle process, StartupInfo\* info)                                                                                                                                                                                             | This starts the main() thread. Buf+0 is main-thread priority, Buf+4 is main-thread stack-size.                                                                                                                                                    |
| 0x13 | Yes      | Yes     | Yes      | Result [CreateMutex](Multi-threading#CreateMutex "wikilink")(Handle\* mutex, bool initialLocked)                                                                                                                                                                             |                                                                                                                                                                                                                                                   |
| 0x14 | Yes      | Yes     | Yes      | Result [ReleaseMutex](Multi-threading#ReleaseMutex "wikilink")(Handle mutex)                                                                                                                                                                                                 |                                                                                                                                                                                                                                                   |
| 0x15 | Yes      | Yes     | Yes      | Result [CreateSemaphore](Multi-threading#CreateSemaphore "wikilink")(Handle\* semaphore, s32 initialCount, s32 maxCount)                                                                                                                                                     |                                                                                                                                                                                                                                                   |
| 0x16 | Yes      | Yes     | Yes      | Result [ReleaseSemaphore](Multi-threading#ReleaseSemaphore "wikilink")(s32\* count, Handle semaphore, s32 releaseCount)                                                                                                                                                      |                                                                                                                                                                                                                                                   |
| 0x17 | Yes      | Yes     | Yes      | Result [CreateEvent](Multi-threading#CreateEvent "wikilink")(Handle\* event, ResetType resettype)                                                                                                                                                                            |                                                                                                                                                                                                                                                   |
| 0x18 | Yes      | Yes     | Yes      | Result [SignalEvent](Multi-threading#SignalEvent "wikilink")(Handle event)                                                                                                                                                                                                   |                                                                                                                                                                                                                                                   |
| 0x19 | Yes      | Yes     | Yes      | Result [ClearEvent](Multi-threading#ClearEvent "wikilink")(Handle event)                                                                                                                                                                                                     |                                                                                                                                                                                                                                                   |
| 0x1A | Yes      | Yes     | Yes      | Result CreateTimer(Handle\* timer, ResetType resettype)                                                                                                                                                                                                                      |                                                                                                                                                                                                                                                   |
| 0x1B | Yes      | Yes     | Yes      | Result SetTimer(Handle timer, s64 initial_nanoseconds, s64 interval)                                                                                                                                                                                                         |                                                                                                                                                                                                                                                   |
| 0x1C | Yes      | Yes     | Yes      | Result CancelTimer(Handle timer)                                                                                                                                                                                                                                             |                                                                                                                                                                                                                                                   |
| 0x1D | Yes      | Yes     | Yes      | Result ClearTimer(Handle timer)                                                                                                                                                                                                                                              |                                                                                                                                                                                                                                                   |
| 0x1E | Yes      | No      | No       | Result [CreateMemoryBlock](Memory_Management "wikilink")(Handle\* memblock, u32 addr, u32 size, [MemoryPermission](Memory_Management#enum_MemoryPermission "wikilink") mypermission, [MemoryPermission](Memory_Management#enum_MemoryPermission "wikilink") otherpermission) |                                                                                                                                                                                                                                                   |
| 0x1F | Yes      | No      | No       | Result [MapMemoryBlock](Memory_Management "wikilink")(Handle memblock, u32 addr, [MemoryPermission](Memory_Management#enum_MemoryPermission "wikilink") mypermissions, [MemoryPermission](Memory_Management#enum_MemoryPermission "wikilink") otherpermission)               |                                                                                                                                                                                                                                                   |
| 0x20 | Yes      | No      | No       | Result [UnmapMemoryBlock](Memory_Management "wikilink")(Handle memblock, u32 addr)                                                                                                                                                                                           |                                                                                                                                                                                                                                                   |
| 0x21 | Yes      | Yes     | Yes      | Result [CreateAddressArbiter](Multi-threading#Address_Arbiters "wikilink")(Handle\* arbiter)                                                                                                                                                                                 |                                                                                                                                                                                                                                                   |
| 0x22 | Yes      | Yes     | Yes      | Result [ArbitrateAddress](Multi-threading#Address_Arbiters "wikilink")(Handle arbiter, u32 addr, ArbitrationType type, s32 value, s64 nanoseconds)                                                                                                                           |                                                                                                                                                                                                                                                   |
| 0x23 | Yes      | Yes     | Yes      | Result CloseHandle(Handle handle)                                                                                                                                                                                                                                            |                                                                                                                                                                                                                                                   |
| 0x24 | Yes      | Yes     | Yes      | Result WaitSynchronization1(Handle handle, s64 timeout_nanoseconds)                                                                                                                                                                                                          |                                                                                                                                                                                                                                                   |
| 0x25 | Yes      | Yes     | Yes      | Result WaitSynchronizationN(s32\* out, Handle\* handles, s32 handlecount, bool waitAll, s64 timeout_nanoseconds)                                                                                                                                                             |                                                                                                                                                                                                                                                   |
| 0x26 | Yes      | No      | No       | Result SignalAndWait(s32\* out, Handle signal, Handle\* handles, s32 handleCount, bool waitAll, s64 nanoseconds)                                                                                                                                                             | Stubbed                                                                                                                                                                                                                                           |
| 0x27 | Yes      | Yes     | Yes      | Result DuplicateHandle(Handle\* out, Handle original)                                                                                                                                                                                                                        |                                                                                                                                                                                                                                                   |
| 0x28 | Yes      | Yes     | Yes      | s64 GetSystemTick(void) (This returns the total CPU ticks elapsed since the CPU was powered-on)                                                                                                                                                                              |                                                                                                                                                                                                                                                   |
| 0x29 | Yes      | No      | No       | Result GetHandleInfo(s64\* out, Handle handle, HandleInfoType type)                                                                                                                                                                                                          |                                                                                                                                                                                                                                                   |
| 0x2A | Yes      | Yes     | Yes      | Result GetSystemInfo(s64\* out, SystemInfoType type, s32 param)                                                                                                                                                                                                              |                                                                                                                                                                                                                                                   |
| 0x2B | Yes      | Yes     | Yes      | Result GetProcessInfo(s64\* out, Handle process, ProcessInfoType type)                                                                                                                                                                                                       |                                                                                                                                                                                                                                                   |
| 0x2C | Yes      | Yes     | Yes      | Result [GetThreadInfo](Multi-threading#GetThreadInfo "wikilink")(s64\* out, Handle thread, ThreadInfoType type)                                                                                                                                                              |                                                                                                                                                                                                                                                   |
| 0x2D | Yes      | No      | No       | Result [ConnectToPort](IPC "wikilink")(Handle\* out, const char\* portName)                                                                                                                                                                                                  |                                                                                                                                                                                                                                                   |
| 0x2E | Yes      | No      | No       | Result SendSyncRequest1(Handle session)                                                                                                                                                                                                                                      | Stubbed                                                                                                                                                                                                                                           |
| 0x2F | Yes      | No      | No       | Result SendSyncRequest2(Handle session)                                                                                                                                                                                                                                      | Stubbed                                                                                                                                                                                                                                           |
| 0x30 | Yes      | No      | No       | Result SendSyncRequest3(Handle session)                                                                                                                                                                                                                                      | Stubbed                                                                                                                                                                                                                                           |
| 0x31 | Yes      | No      | No       | Result SendSyncRequest4(Handle session)                                                                                                                                                                                                                                      | Stubbed                                                                                                                                                                                                                                           |
| 0x32 | Yes      | No      | No       | Result [SendSyncRequest](IPC "wikilink")(Handle session)                                                                                                                                                                                                                     |                                                                                                                                                                                                                                                   |
| 0x33 | Yes      | No      | No       | Result OpenProcess(Handle\* process, u32 processId)                                                                                                                                                                                                                          |                                                                                                                                                                                                                                                   |
| 0x34 | Yes      | No      | No       | Result [OpenThread](Multi-threading#OpenThread "wikilink")(Handle\* thread, Handle process, u32 threadId)                                                                                                                                                                    |                                                                                                                                                                                                                                                   |
| 0x35 | Yes      | No      | Yes      | Result GetProcessId(u32\* processId, Handle process)                                                                                                                                                                                                                         |                                                                                                                                                                                                                                                   |
| 0x36 | Yes      | No      | No       | Result [GetProcessIdOfThread](Multi-threading#GetProcessIdOfThread "wikilink")(u32\* processId, Handle thread)                                                                                                                                                               |                                                                                                                                                                                                                                                   |
| 0x37 | Yes      | Yes     | Yes      | Result [GetThreadId](Multi-threading#GetThreadId "wikilink")(u32\* threadId, Handle thread)                                                                                                                                                                                  |                                                                                                                                                                                                                                                   |
| 0x38 | Yes      | No      | No       | Result GetResourceLimit(Handle\* resourceLimit, Handle process)                                                                                                                                                                                                              |                                                                                                                                                                                                                                                   |
| 0x39 | Yes      | No      | No       | Result GetResourceLimitLimitValues(s64\* values, Handle resourceLimit, LimitableResource\* names, s32 nameCount)                                                                                                                                                             |                                                                                                                                                                                                                                                   |
| 0x3A | Yes      | No      | No       | Result GetResourceLimitCurrentValues(s64\* values, Handle resourceLimit, LimitableResource\* names, s32 nameCount)                                                                                                                                                           |                                                                                                                                                                                                                                                   |
| 0x3B | Yes      | No      | No       | Result [GetThreadContext](Multi-threading#GetThreadContext "wikilink")(ThreadContext\* context, Handle thread)                                                                                                                                                               | Stubbed                                                                                                                                                                                                                                           |
| 0x3C | Yes      | Yes     | Yes      | Break(BreakReason reason) Break(BreakReason debugReason, const void\* croInfo, u32 croInfoSize)                                                                                                                                                                              |                                                                                                                                                                                                                                                   |
| 0x3D | Yes      | Yes     | Yes      | OutputDebugString(void const, int)                                                                                                                                                                                                                                           | Does nothing on non-debug units.                                                                                                                                                                                                                  |
| 0x3E | Yes      | No      | No       | ControlPerformanceCounter(unsigned long long, int, unsigned int, unsigned long long)                                                                                                                                                                                         |                                                                                                                                                                                                                                                   |
| 0x47 | Yes      | No      | No       | Result [CreatePort](IPC "wikilink")(Handle\* portServer, Handle\* portClient, const char\* name, s16 maxSessions)                                                                                                                                                            | Setting name=NULL creates a private port not accessible from svcConnectToPort.                                                                                                                                                                    |
| 0x48 | Yes      | No      | No       | Result [CreateSessionToPort](IPC "wikilink")(Handle\* session, Handle port)                                                                                                                                                                                                  |                                                                                                                                                                                                                                                   |
| 0x49 | Yes      | No      | No       | Result [CreateSession](IPC "wikilink")(Handle\* sessionServer, Handle\* sessionClient)                                                                                                                                                                                       |                                                                                                                                                                                                                                                   |
| 0x4A | Yes      | No      | No       | Result [AcceptSession](IPC "wikilink")(Handle\* session, Handle port)                                                                                                                                                                                                        |                                                                                                                                                                                                                                                   |
| 0x4B | Yes      | No      | No       | Result ReplyAndReceive1(s32\* index, Handle\* handles, s32 handleCount, Handle replyTarget)                                                                                                                                                                                  | Stubbed.                                                                                                                                                                                                                                          |
| 0x4C | Yes      | No      | No       | Result ReplyAndReceive2(s32\* index, Handle\* handles, s32 handleCount, Handle replyTarget)                                                                                                                                                                                  | Stubbed.                                                                                                                                                                                                                                          |
| 0x4D | Yes      | No      | No       | Result ReplyAndReceive3(s32\* index, Handle\* handles, s32 handleCount, Handle replyTarget)                                                                                                                                                                                  | Stubbed.                                                                                                                                                                                                                                          |
| 0x4E | Yes      | No      | No       | Result ReplyAndReceive4(s32\* index, Handle\* handles, s32 handleCount, Handle replyTarget)                                                                                                                                                                                  | Stubbed.                                                                                                                                                                                                                                          |
| 0x4F | Yes      | No      | No       | Result [ReplyAndReceive](IPC#svcReplyAndReceive "wikilink")(s32\* index, Handle\* handles, s32 handleCount, Handle replyTarget)                                                                                                                                              |                                                                                                                                                                                                                                                   |
| 0x50 | Yes      | Yes     | Yes      | Result [BindInterrupt](#Interrupt_Handling "wikilink")(Interrupt name, Handle eventOrSemaphore, s32 priority, bool isLevelHighActive)                                                                                                                                        |                                                                                                                                                                                                                                                   |
| 0x51 | Yes      | Yes     | Yes      | Result UnbindInterrupt(Interrupt name, Handle eventOrSemaphore)                                                                                                                                                                                                              |                                                                                                                                                                                                                                                   |
| 0x52 | Yes      | Yes     | Yes      | Result InvalidateProcessDataCache(Handle process, void\* addr, u32 size)                                                                                                                                                                                                     |                                                                                                                                                                                                                                                   |
| 0x53 | Yes      | Yes     | Yes      | Result StoreProcessDataCache(Handle process, void const\* addr, u32 size)                                                                                                                                                                                                    |                                                                                                                                                                                                                                                   |
| 0x54 | Yes      | Yes     | Yes      | Result FlushProcessDataCache(Handle process, void const\* addr, u32 size)                                                                                                                                                                                                    |                                                                                                                                                                                                                                                   |
| 0x55 | Yes      | Yes     | Yes      | Result [StartInterProcessDma](Corelink_DMA_Engines "wikilink")(Handle\* dma, Handle dstProcess, void\* dst, Handle srcProcess, const void\* src, u32 size, const DmaConfig\* config)                                                                                         |                                                                                                                                                                                                                                                   |
| 0x56 | Yes      | Yes     | Yes      | Result StopDma(Handle dma)                                                                                                                                                                                                                                                   |                                                                                                                                                                                                                                                   |
| 0x57 | Yes      | Yes     | Yes      | Result GetDmaState(DmaState\* state, Handle dma)                                                                                                                                                                                                                             |                                                                                                                                                                                                                                                   |
| 0x58 | Yes      | Yes     | Yes      | RestartDma(Handle, void \*, void const\*, unsigned int, signed char)                                                                                                                                                                                                         |                                                                                                                                                                                                                                                   |
| 0x59 | Yes      | No?     | No       | SetGpuProt(s8 input_flag). Implemented with [11.3.0-X](11.3.0-36 "wikilink"), see below.                                                                                                                                                                                     |                                                                                                                                                                                                                                                   |
| 0x5A | Yes      | No?     | No       | SetWifiEnabled(s0 input_flag). Implemented with [11.4.0-X](11.4.0-37 "wikilink"), see below.                                                                                                                                                                                 |                                                                                                                                                                                                                                                   |
| 0x60 | Yes      | No      | No       | Result DebugActiveProcess(Handle\* debug, u32 processID)                                                                                                                                                                                                                     |                                                                                                                                                                                                                                                   |
| 0x61 | Yes      | No      | No       | Result BreakDebugProcess(Handle debug)                                                                                                                                                                                                                                       |                                                                                                                                                                                                                                                   |
| 0x62 | Yes      | No      | No       | Result TerminateDebugProcess(Handle debug)                                                                                                                                                                                                                                   |                                                                                                                                                                                                                                                   |
| 0x63 | Yes      | No      | No       | Result GetProcessDebugEvent(DebugEventInfo\* info, Handle debug)                                                                                                                                                                                                             |                                                                                                                                                                                                                                                   |
| 0x64 | Yes      | No      | No       | Result ContinueDebugEvent(Handle debug, u32 flags)                                                                                                                                                                                                                           |                                                                                                                                                                                                                                                   |
| 0x65 | Yes      | No      | No       | Result GetProcessList(s32\* processCount, u32\* processIds, s32 processIdMaxCount)                                                                                                                                                                                           |                                                                                                                                                                                                                                                   |
| 0x66 | Yes      | No      | No       | Result GetThreadList(s32\* threadCount, u32\* threadIds, s32 threadIdMaxCount, Handle domain)                                                                                                                                                                                |                                                                                                                                                                                                                                                   |
| 0x67 | Yes      | No      | No       | Result GetDebugThreadContext(ThreadContext\* context, Handle debug, u32 threadId, u32 controlFlags)                                                                                                                                                                          |                                                                                                                                                                                                                                                   |
| 0x68 | Yes      | No      | No       | Result SetDebugThreadContext(Handle debug, u32 threadId, const ThreadContext\* context, u32 controlFlags)                                                                                                                                                                    |                                                                                                                                                                                                                                                   |
| 0x69 | Yes      | No      | No       | Result QueryDebugProcessMemory(MemoryInfo\* blockInfo, PageInfo\* pageInfo, Handle debug, u32 addr)                                                                                                                                                                          |                                                                                                                                                                                                                                                   |
| 0x6A | Yes      | No      | No       | Result ReadProcessMemory(void\* buffer, Handle debug, u32 addr, u32 size)                                                                                                                                                                                                    |                                                                                                                                                                                                                                                   |
| 0x6B | Yes      | No      | No       | Result WriteProcessMemory(Handle debug, void const\* buffer, u32 addr, u32 size)                                                                                                                                                                                             |                                                                                                                                                                                                                                                   |
| 0x6C | Yes      | No      | No       | Result SetHardwareBreakPoint(s32 registerId, u32 control, u32 value)                                                                                                                                                                                                         |                                                                                                                                                                                                                                                   |
| 0x6D | Yes      | No      | No       | [GetDebugThreadParam](Multi-threading#GetDebugThreadParam "wikilink")(s64\* unused, u32\* out, Handle kdebug, u32 threadId, DebugThreadParameter param)                                                                                                                      |                                                                                                                                                                                                                                                   |
| 0x70 | Yes      | No      | No       | Result ControlProcessMemory(Handle KProcess, unsigned int Addr0, unsigned int Addr1, unsigned int Size, unsigned int Type, unsigned int Permissions)                                                                                                                         |                                                                                                                                                                                                                                                   |
| 0x71 | Yes      | No      | No       | Result [MapProcessMemory](Memory_Management#Memory_Mapping "wikilink")(Handle process, u32 startAddr, u32 size)                                                                                                                                                              |                                                                                                                                                                                                                                                   |
| 0x72 | Yes      | No      | No       | Result [UnmapProcessMemory](Memory_Management#Memory_Mapping "wikilink")(Handle process, u32 startAddr, u32 size)                                                                                                                                                            |                                                                                                                                                                                                                                                   |
| 0x73 | Yes      | No      | No       | Result [CreateCodeSet](Multi-threading#CreateCodeSet "wikilink")(Handle\* handle_out, struct CodeSetInfo, u32 code_ptr, u32 ro_ptr, u32 data_ptr)                                                                                                                            |                                                                                                                                                                                                                                                   |
| 0x74 | Yes      | No      | No       | Result RandomStub()                                                                                                                                                                                                                                                          | Stubbed                                                                                                                                                                                                                                           |
| 0x75 | Yes      | No      | No       | Result [CreateProcess](Multi-threading#CreateProcess "wikilink")(Handle\* handle_out, Handle codeset_handle, u32 [arm11kernelcaps_ptr](NCCH/Extended_Header#ARM11_Kernel_Capabilities "wikilink"), u32 arm11kernelcaps_num)                                                  |                                                                                                                                                                                                                                                   |
| 0x76 | Yes      | No      | No       | TerminateProcess(Handle)                                                                                                                                                                                                                                                     |                                                                                                                                                                                                                                                   |
| 0x77 | Yes      | No      | No       | Result SetProcessResourceLimits(Handle KProcess, Handle KResourceLimit)                                                                                                                                                                                                      |                                                                                                                                                                                                                                                   |
| 0x78 | Yes      | No      | No       | Result CreateResourceLimit(Handle \*KResourceLimit)                                                                                                                                                                                                                          |                                                                                                                                                                                                                                                   |
| 0x79 | Yes      | No      | No       | Result SetResourceLimitLimitValues(Handle res_limit, LimitableResource\* resource_type_list, s64\* resource_list, u32 count)                                                                                                                                                 |                                                                                                                                                                                                                                                   |
| 0x7A | Yes      | No      | Yes      | AddCodeSegment (unsigned int Addr, unsigned int Size)                                                                                                                                                                                                                        | Stubbed on NATIVE_FIRM beginning with [2.0.0-2](2.0.0-2 "wikilink"). Used during TWL_FIRM boot.                                                                                                                                                   |
| 0x7B | Yes      | Yes     | No       | Backdoor(unsigned int CodeAddress)                                                                                                                                                                                                                                           | This is used on ARM9 NATIVE_FIRM. No ARM11 processes have access to it without some form of kernelhax, and this was removed on [11.0.0-33](11.0.0-33 "wikilink") (for ARM11).                                                                     |
| 0x7C | Yes      | Yes     | Yes      | KernelSetState(unsigned int Type, ...)                                                                                                                                                                                                                                       | The type determines the args to be passed                                                                                                                                                                                                         |
| 0x7D | Yes      | No      | No       | Result QueryProcessMemory(MemInfo \*Info, unsigned int \*Out, Handle KProcess, unsigned int Addr)                                                                                                                                                                            |                                                                                                                                                                                                                                                   |
| 0xFF | Yes      | Yes     | Yes      | Stop point                                                                                                                                                                                                                                                                   | The svcaccesscontrol mask doesn't apply for this SVC. This svc doesn't check the "debug mode enabled" flag either. Does nothing if there is no [KDebug](KDebug "wikilink") object associated to the current process. Stubbed on ARM9 NATIVE_FIRM. |

NF: NATIVE_FIRM. TF: TWL_FIRM.

Note that "stubbed" here means that the SVC only returns an error, as in
the following snippet:

    ROM:FFF04D98                 LDR             R0, =0xF8C007F4
    ROM:FFF04D9C                 BX              LR

# Types and structures

## enum ResetType

| Reset type | Id  |
|------------|-----|
| ONESHOT    | 0   |
| STICKY     | 1   |
| PULSE      | 2   |

Timers/Events may be waited on by a thread using svcWaitSynchronization.
Once the timer runs out/the event gets signaled, threads waiting on the
respective handles until the timer/event is reset. STICKY timers/events
wake up threads until they are explicitly reset by some thread. ONESHOT
timers/events will wake up exactly one thread and then are reset
automatically. PULSE timers will be reset after waking up one thread
too, but will also be started again immediately. It's unknown whether
PULSE is a valid reset type for events.

## struct StartupInfo

| Type  | Field      |
|-------|------------|
| s32   | Priority   |
| u32   | Stack size |
| s32   | argc       |
| s16\* | argv       |
| s16\* | envp       |

## enum BreakReason

| Break Reason | Value |
|--------------|-------|
| PANIC        | 0     |
| ASSERT       | 1     |
| USER         | 2     |

## struct DebugEventInfo

Size: 0x28 bytes

When using svcGetProcessDebugEvent, the kernel fetches the first
[KEventInfo](KEventInfo "wikilink") instance of the process's
[KDebug](KDebug "wikilink"). The debug event is handled and parsed into
this structure.

| Type     | Field                                                                                     |
|----------|-------------------------------------------------------------------------------------------|
| u32      | Event type                                                                                |
| u32      | Thread ID (not used in all events)                                                        |
| u32      | Flags. Bit0 means that svcContinueDebugEvent needs to be called for this event            |
| u8\[4\]  | Remnants of the corresponding flags in [KEventInfo](KEventInfo "wikilink"), always 0 here |
| u32\[6\] | Event-specific data (see below)                                                           |

| Event type           | Id  |
|----------------------|-----|
| ATTACH PROCESS       | 0   |
| ATTACH THREAD        | 1   |
| EXIT THREAD          | 2   |
| EXIT PROCESS (1)     | 3   |
| EXCEPTION            | 4   |
| DLL LOAD (3)         | 5   |
| DLL UNLOAD (3)       | 6   |
| SCHEDULE IN (1) (2)  | 7   |
| SCHEDULE OUT (1) (2) | 8   |
| SYSCALL IN (1) (2)   | 9   |
| SYSCALL OUT (1) (2)  | 10  |
| OUTPUT STRING        | 11  |
| MAP (1) (2)          | 12  |

\(1\) Non-blocking: all other events preempt and block all the threads
of their process until they are continued.

\(2\) There is handling code in the kernel but nothing signal those
events.

\(3\) Completely removed from the kernel, but referenced in DMNT.
Stubbed relocation code (e.g., in Process9 and in PXI sysmodule) and
even whole libraries (e.g., in PXI sysmodule's .rodata section) seem to
indicate that Nintendo used dynamic libraries early in system
development.

When calling svcDebugActiveProcess, an ATTACH PROCESS debug event is
signaled, then ATTACH THREAD for each of its opened threads, then
finally ATTACH BREAK.

ATTACH THREAD events are also emitted when a thread is created from an
attached process.

### ATTACH PROCESS event

| Type      | Field                                               |
|-----------|-----------------------------------------------------|
| u64       | Program ID                                          |
| char\[8\] | Process name                                        |
| u32       | Process ID                                          |
| u32       | "Other" flag. Always 0 in available kernel versions |

### ATTACH THREAD event

| Type    | Field                                                      |
|---------|------------------------------------------------------------|
| u32     | Creator thread ID (0 if attached by svcDebugActiveProcess) |
| void \* | Thread local storage                                       |
| u32 \*  | Entrypoint = .text load address of the parent process      |

### EXIT THREAD/PROCESS events

A single u32 reason field is used.

Thread exit reasons:

| Reason            | Id  |
|-------------------|-----|
| (None)            | 0   |
| TERMINATE         | 1   |
| EXIT PROCESS      | 2   |
| TERMINATE PROCESS | 3   |

Process exit reasons:

| Reason          | Id  |
|-----------------|-----|
| (None)          | 0   |
| TERMINATE       | 1   |
| DEBUG TERMINATE | 2   |

### EXCEPTION event

| Type     | Field                         |
|----------|-------------------------------|
| u32      | Exception type                |
| u32      | Exception address             |
| u32\[4\] | Type-specific data, see below |

Exception types:

| Exception type        | Id  |
|-----------------------|-----|
| UNDEFINED INSTRUCTION | 0   |
| PREFETCH ABORT        | 1   |
| DATA ABORT            | 2   |
| UNALIGNED DATA ACCESS | 3   |
| ATTACH BREAK          | 4   |
| STOP POINT            | 5   |
| USER BREAK            | 6   |
| DEBUGGER BREAK        | 7   |
| UNDEFINED SYSCALL     | 8   |

#### UNDEFINED INSTRUCTION/PREFETCH ABORT/DATA ABORT/UNALIGNED DATA ACCESS/UNDEFINED SYSCALL events

| Type | Field                                                                                                                                       |
|------|---------------------------------------------------------------------------------------------------------------------------------------------|
| u32  | Fault information: Fault Address Register (for DATA ABORT and UNALIGNED DATA ACCESS), attempted SVC ID (for UNDEFINED SYSCALL), otherwise 0 |

#### STOP POINT event

| Type | Field                                                                               |
|------|-------------------------------------------------------------------------------------|
| u32  | Stop point type that caused the event: 0 = svc 0xFF, 1 = breakpoint, 2 = watchpoint |
| u32  | Fault information: FAR for watchpoints, 0 otherwise                                 |

#### USER BREAK event

| Type     | Field                          |
|----------|--------------------------------|
| u32      | Break reason                   |
| u32\[2\] | Info for LOAD_RO and UNLOAD_RO |

User break types:

| Reason    | Id  |
|-----------|-----|
| PANIC     | 0   |
| ASSERT    | 1   |
| USER      | 2   |
| LOAD_RO   | 3   |
| UNLOAD_RO | 4   |

#### DEBUGGER BREAK event

| Type     | Field                                                                                                                                                                           |
|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| s32\[4\] | IDs of the attached process's threads that were running on each core at the time of the @ref svcBreakDebugProcess call, or -1 (only the first 2 values are meaningful on O3DS). |

### SCHEDULE/SYSCALL IN/OUT events

| Type | Field                                             |
|------|---------------------------------------------------|
| u64  | Clock tick                                        |
| u32  | CPU ID (SCHEDULE events) Syscall (SYSCALL events) |

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

## struct ThreadContext

Size: 0xCC bytes

| Offset | Type         | Description                                    |
|--------|--------------|------------------------------------------------|
| 0x0    | CpuRegisters | Saved CPU registers (r0-r12, sp, lr, pc, cpsr) |
| 0x44   | FpuRegisters | Saved FPU registers (d0-d15, fpscr, fpexc)     |

The user needs to adjust pc for exceptions that occured while in Thumb
mode.

**Flags for svcGetDebugThreadContext/svcSetDebugThreadContext**:

| Bit | Description                           |
|-----|---------------------------------------|
| 0   | Get/set CPU GPRs (r0-r12)             |
| 1   | Get/set CPU SPRs (sp, lr, pc, cpsr)   |
| 2   | Get/set FPU GPRs (d0-d15 aka. f0-f31) |
| 3   | Get/set FPU SPRs (fpscr, fpexc)       |

When setting CPSR, the following assignment is done:
`ctx->cpsr = ctx->cpsr & 0x7F0FDFF | userCtx->cpuRegisters.cpsr & 0xF80F0200;`.
This is to avoid obvious security issues.

## enum DebugThreadParameter

| Parameter           | Id  |
|---------------------|-----|
| PRIORITY            | 0   |
| SCHEDULING_MASK_LOW | 1   |
| CPU_IDEAL           | 2   |
| CPU_CREATOR         | 3   |

## typedef Handle

User-visible references to internal objects are represented by 32-bit
integers called handles. Handles are only valid in the process they have
been created in; hence, they cannot be exchanged between processes
directly (the [IPC](IPC "wikilink") functions provide a mean to copy
handles to other processes, though).

There are a number of special-purpose handles, which provide easy access
to information on objects in the current process:

| Handle     | Description                  |
|------------|------------------------------|
| 0xFFFF8000 | Handle to the active thread  |
| 0xFFFF8001 | Handle to the active process |

# svcSetHardwareBreakPoint

This is essentially an interface for writing values to the debug-unit
(B/W)RP registers. registerId range 0..5 = breakpoints(BRP0-5),
0x100..0x101 = watchpoints(WRP0-1), anything outside of these ranges
will result in an error. This is used for both adding and
removing/disabling breakpoints/watchpoints, hence the raw control value
parameter.

Here the kernel sets bit15 in the DSCR, to enable monitor-mode
debugging.

Regardless of whether this is for a BRP, when bit21 is set in the
control input parameter(BRP type = contextID), the kernel will load the
target process [contextID](KProcess "wikilink") and use that internally
for the value field. The target process is specified via a
[KDebug](KDebug "wikilink") handle passed as the "value" parameter.

Lastly, the kernel disables the specified (B/W)RP, then writes the value
parameter / loaded contextID to the (B/W)VR, then writes the input
control value to the (B/W)CR.

# [DMA](DMA "wikilink")

The CTRSDK code for using svcStartInterProcessDma will execute svcBreak
when svcStartInterProcessDma returns an error(except for certain error
value(s)). Therefore on retail, triggering a svcStartInterProcessDma via
a system-module which results in an error from svcStartInterProcessDma
will result in the system-module terminating.

# Interrupt Handling

svcBindInterrupt registers the given event or semaphore corresponding to
the handle to the global ["interrupt
table"](ARM11_Interrupts#Interrupt_Table_.28New3DS.29 "wikilink") for
the given interrupt ID. Interrupts 0-14 and 16-31 can never be mapped
regardless of the [interrupt flags of the process's
exheader](NCCH/Extended_Header#ARM11_Kernel_Capabilities "wikilink"),
and the latter are not checked when mapping interrupt 15. The "is level
high active"/"is manual clear" parameter must be false when binding a
semaphore handle (otherwise 0xD8E007EE "invalid combination" is
returned).

If something was already registered for the given ID, svcBindInterrupt
returns error 0xD8E007F0. See
[KBaseInterruptEvent](KBaseInterruptEvent "wikilink") for more
information on what happens on receipt of an interrupt.

Applications hence can wait for specific interrupts to happen by calling
WaitSynchronization(N) on the event or semaphore handles.

The set of existing ARM11 interrupts is listed on [this
page](ARM11_Interrupts "wikilink").

# Debugging

DebugActiveProcess is used to attach to a process for debugging. This
SVC can only be used when the target process' ARM11 descriptors stored
in the exheader have the kernel flag for "Enable debug" set. Otherwise
when that flag is clear, the kernel flags for the process using this SVC
must have the "Force debug" flag set.

This SVC can only be used when a certain kernel state debug flag is
non-zero(it's set to zero for retail).

# KernelSetState

KernelSetState uses the 6th [software-generated
interrupt](ARM11_Interrupts#Private_Interrupts "wikilink") for any
operation involving synchronization between cores.

<table>
<thead>
<tr class="header">
<th><p>Type</p></th>
<th><p>Enabled for the NATIVE_FIRM ARM11 kernel</p></th>
<th><p>Enabled for the TWL_FIRM ARM11 kernel</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
<td><p>Arguments : <code>u64 firmTitleID</code> (the high 32-bits of
that title ID (0 when using N3DS pm) have a special meaning on N3DS,
they're otherwise ignored, see below). This initializes the programID
for launching <a href="FIRM" title="wikilink">FIRM</a>, then triggers
launching <a href="FIRM" title="wikilink">FIRM</a>. With New3DS kernel,
it forces the firm title ID to be the New3DS NATIVE_FIRM, when the input
firm title ID is 2. The high firm title ID is always set to 0x40138. On
New3DS, the kernel disables the additional New3DS cache hw prior to
calling the firmlaunch function from the
<handler for the KernelSetState-types called via funcptr>.</p></td>
</tr>
<tr class="even">
<td><p>1</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Does nothing.</p></td>
</tr>
<tr class="odd">
<td><p>2</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Powers down the GPU and syncs with Process9 (waits for
<code>*(vu8 *)PXI_SYNC11</code> to be 1) during the process. On New3DS,
the kernel disables the additional New3DS cache hw, when it's actually
enabled, prior to executing the rest of the code from the
<handler for the KernelSetState-types called via funcptr>.</p></td>
</tr>
<tr class="even">
<td><p>3</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
<td><p>Arguments: <code>0, void* address</code> or <code>1</code> This
used for initializing the 0x1000-byte buffer used by the launched <a
href="FIRM" title="wikilink">FIRM</a>. When the first parameter is 1,
this buffer is copied to the beginning of FCRAM at 0xE0000000. When it
is 0, this kernel buffer is mapped to the process address specified by
the second argument.</p></td>
</tr>
<tr class="odd">
<td><p>4</p></td>
<td><p>No</p></td>
<td><p>Yes</p></td>
<td><p>This unmaps(?) the following virtual memory by writing value
physaddr (where physaddr base is 0x80000000) to the L1 MMU table
entries: 0x00300000..0x04300000, 0x08000000..0x0FE00000, and
0x10000000..0xF8000000.</p></td>
</tr>
<tr class="even">
<td><p>5</p></td>
<td><p>Yes</p></td>
<td><p>Yes</p></td>
<td><p>Power state change. Takes one u32 parameter.</p>
<p>0: shutdown/reboot. hangs the Arm11. Used by kernelpanic and PTM.
This makes all cores enter a WFI/B infinite loop.</p></td>
</tr>
<tr class="odd">
<td><p>6</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
<td><p>Arguments: <code>u32 what, u64 val</code> UNITINFO needs to be
non-zero for <code>what</code> 1 and 2.</p>
<p>If <code>what</code> is 0 or any invalid value, nothing is done.</p>
<p>If it is 1, <code>val != 0</code> is written to the global variable
enabling ERR:F-format register dumps on user-mode CPU/VFP exceptions
(the VFP exception handler acts as if this variable was always true and
works on retail environments). The user handler, stack pointer to use
for exception handling, and pointer to use for the exception info
structure are contiguously located in either the thread's TLS, or if the
handler is NULL, in the main thread's TLS, at offset 0x40. If the
specified stack pointer is 1, sp_usr - 0x5c is used instead; if the
specified exception info buffer is 1, sp_usr - 0x5c is used instead, and
if it is 0, <specified stack> - 0x5c is used (0x5c is the size of the
exception info structure that is being pushed). Configured by NS on
startup on dev-units (default being 0 on non-debugger/jtag units) using
the 0x000F0000 configuration block in the <a href="Config_Savegame"
title="wikilink">config savegame</a>.</p>
<p>If 2, kernelpanic will be called when svcBreak is used by a
non-attached process. Configured by NS on startup on dev-units (default
being 0 on non-debugger/jtag units) using the 0x000F0000 configuration
block in the <a href="Config_Savegame" title="wikilink">config
savegame</a>.</p>
<p>If 3, this changes the scheduling/preemption mode (when no threads
are being preempted, otherwise returns error 0xC8A01414), see <a
href="KResourceLimit" title="wikilink">KResourceLimit</a> for more
details.</p></td>
</tr>
<tr class="even">
<td><p>7</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
<td><p>This triggers an MCU (hard) reboot. This reboot is triggered via
device address 0x4A on the second <a href="I2C" title="wikilink">I2C</a>
bus (the MCU). Register address 0x20 is written to with value 4. This
code will not return. On New3DS, the kernel disables the additional
New3DS cache hw prior to calling the reboot function from the
<handler for the KernelSetState-types called via funcptr>.</p></td>
</tr>
<tr class="odd">
<td><p>8</p></td>
<td><p>Yes</p></td>
<td><p>No</p></td>
<td><p>Hangs the Arm9, using a code path similar to the one used on
firmlaunch. Used by PTM on shutdown/reboot.</p></td>
</tr>
<tr class="even">
<td><p>9</p></td>
<td><p>Yes, implemented at some point after system-version
v4.5.</p></td>
<td><p>?</p></td>
<td><p>Argumens: <code>u64 titleID</code>. When creating a process, if
the process has a non-zero TID equal to the parameter above (which is
stored in a global variable), then KProcessHwInfo+0x32 ("process is the
currently running app") is set to <code>true</code>. Used by NS
conditionally based on the contents of the <a href="NS_CFA"
title="wikilink">NS CFA</a>.</p></td>
</tr>
<tr class="odd">
<td><p>10</p></td>
<td><p>Yes</p></td>
<td><p>?</p></td>
<td><p>Arguments: <code>u32 config</code> ConfigureNew3DSCPU. Only
available for the <a href="New_3DS" title="wikilink">New_3DS</a> kernel.
The actual code for processing this runs under the
<handler for the KernelSetState-types called via funcptr>, which runs on
all ARM11 cores. Only bit0-1 of the argument are used here. Bit 0
enables higher core clock, and bit 1 enables additional (L2) cache. This
configures the hardware <a href="PDN_Registers"
title="wikilink">register</a> for the flags listed <a
href="NCCH/Extended_Header#Flag1" title="wikilink">here</a>, among other
code which uses the MPCore private memory region registers.</p></td>
</tr>
</tbody>
</table>

# GetSystemInfo

| SystemInfoType value | s32 param | Description                                                                                                                                                                                                   |
|----------------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0                    | 0         | This writes the total used memory size in the following memory regions to out: APPLICATION, SYSTEM, and BASE.                                                                                                 |
| 0                    | 1         | This writes the total used memory size in the APPLICATION memory region to out.                                                                                                                               |
| 0                    | 2         | This writes the total used memory size in the SYSTEM memory region to out.                                                                                                                                    |
| 0                    | 3         | This writes the total used memory size in the BASE memory region to out.                                                                                                                                      |
| 2                    | Unused    | This writes the FCRAM memory [used by the kernel](Memory_Allocation#FCRAM_Region_Data "wikilink") to out.                                                                                                     |
| 25                   | Unused    | This writes the total number of threads which were directly launched by the kernel, to out. No longer exists with some kernel version?                                                                        |
| 26                   | Unused    | This writes the total number of processes which were directly launched by the kernel, to out. For the NATIVE_FIRM/SAFE_MODE_FIRM ARM11 kernel, this is normally 5, for processes sm, fs, pm, loader, and pxi. |

# GetProcessInfo

Input:

`R0 = unused`
`R1 = Handle process`
`R2 = ProcessInfoType type`

Output:

`R0 = Result`
`R1 = output value lower word`
`R2 = output value upper word`

| ProcessInfoType value | Available since system version                                                           | Description                                                                                                                                                                                                                                                                                     |
|-----------------------|------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0                     |                                                                                          | Returns the amount of private (code, data, regular heap) and shared memory used by the process + total supervisor-mode stack size + page-rounded size of the external handle table. This is the amount of physical memory the process is using, minus TLS, main thread stack and linear memory. |
| 1                     |                                                                                          | Returns the amount of <related unused field> + total supervisor-mode stack size + page-rounded size of the external handle table                                                                                                                                                                |
| 2                     |                                                                                          | Returns the amount of private (code, data, heap) memory used by the process + total supervisor-mode stack size + page-rounded size of the external handle table                                                                                                                                 |
| 3                     |                                                                                          | Returns the amount of <related unused field> + total supervisor-mode stack size + page-rounded size of the external handle table                                                                                                                                                                |
| 4                     |                                                                                          | Returns the amount of handles in use by the process.                                                                                                                                                                                                                                            |
| 5                     |                                                                                          | Returns the highest count of handles that have been open at once by the process                                                                                                                                                                                                                 |
| 6                     |                                                                                          | Returns `*(u32*)(KProcess+0x234)` which is always 0                                                                                                                                                                                                                                             |
| 7                     |                                                                                          | Returns the number of threads of the process                                                                                                                                                                                                                                                    |
| 8                     |                                                                                          | Returns the maximum number of threads which can be opened by this process (always 0)                                                                                                                                                                                                            |
| 9-18                  | [8.0.0-18](8.0.0-18 "wikilink")                                                          | This only returns error 0xD8E007ED.                                                                                                                                                                                                                                                             |
| 19                    | Stub: [8.0.0-18](8.0.0-18 "wikilink"). Implementation: [11.3.0-X](11.3.0-36 "wikilink"). | Originally this only returned 0xD8E007ED. Now with v11.3 this returns the memregion for the process: out low u32 = [KProcess](KProcess "wikilink") "Kernel flags from the exheader kernel descriptors" & 0xF00 (memory region flag). High out u32 = 0.                                          |
| 20                    | [8.0.0-18](8.0.0-18 "wikilink")                                                          | low u32 = (0x20000000 - <LINEAR virtual-memory base for this process>). That is, the output value is the value which can be added to LINEAR memory vaddrs for converting to physical-memory addrs.                                                                                              |
| 21                    | [8.0.0-18](8.0.0-18 "wikilink"). N3DS only.                                              | Returns the VA -\> PA conversion offset for the QTM static mem block reserved in the exheader (0x800000), otherwise 0 (+ error 0xE0E01BF4) if it doesn't exist                                                                                                                                  |
| 22                    | [8.0.0-18](8.0.0-18 "wikilink"). N3DS only.                                              | Returns the base VA of the QTM static mem block reserved in the exheader, otherwise 0 (+ error 0xE0E01BF4) if it doesn't exist                                                                                                                                                                  |
| 23                    | [8.0.0-18](8.0.0-18 "wikilink"). N3DS only.                                              | Returns the size of the QTM static mem block reserved in the exheader, otherwise 0 (+ error 0xE0E01BF4) if it doesn't exist                                                                                                                                                                     |

# GetHandleInfo

| HandleInfoType value | Description                                                                                                                                                                         |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0                    | This returns the time in ticks the KProcess referenced by the handle was created. If a KProcess handle was not given, it will write whatever was in r5, r6 when the svc was called. |
| 1                    | Get internal refcount for kernel object (not counting the one this SVC adds internally to operate), sign-extended to 64 bits.                                                       |
| 2                    | Unimplemented, returns an uninitialized u64 variable (corresponding to r5-r6, which were not altered outside of userland).                                                          |
| 0x32107              | Returns (u64) 0.                                                                                                                                                                    |

# svc7B Backdoor

This saves SVC-mode SP+LR on the user-mode stack, then sets the SVC-mode
SP to the user-mode SP. This then calls the specified code in SVC-mode.
Once the called code returns, this pops the saved SP+LR off the stack
for restoring the SVC-mode SP, then returns from the svc7b handler. Note
that this svc7b handler does not disable IRQs, if any
IRQs/context-switches occur while the SVC-mode SP is set to the
user-mode one here, the ARM11-kernel will crash(which hangs the whole
ARM11-side system).

# svc 0x59

Implemented with [11.3.0-X](11.3.0-36 "wikilink"). Used with GSP module
starting with that version. This always returns 0.

When input_flag is not 0x1, it will use value 0x0 internally. When a
state field already matches input_flag, this will immediately return.
Otherwise, after this SVC finishes running, it will write input_flag to
this state field. GSP module uses 0x0 for APPLICATION-memregionid and
0x1 for non-APPLICATION-memregionid.

This writes "0x100 \| \<val\>" to
[pdnregbase+0x140](CONFIG11_Registers#CFG11_GPUPROT "wikilink"), where
val depends on input_flag and a kernel state field for
[APPMEMTYPE](Configuration_Memory "wikilink").

When input_flag is 0x1 val is fixed:

- Old3DS: 0x3
- New3DS: 0x460

Otherwise, val depends on the kernel APPMEMTYPE state field:

| FIRM   | [APPMEMTYPE](Memory_layout "wikilink") | val   |
|--------|----------------------------------------|-------|
| Old3DS | 2                                      | 0x3   |
| Old3DS | 3                                      | 0x5   |
| Old3DS | 4                                      | 0x6   |
| Old3DS | Non-value-{2/3/4}                      | 0x7   |
| New3DS | 7                                      | 0x490 |
| New3DS | Non-value-7                            | 0x4F0 |

This same register is also initialized during kernel boot starting with
[3.0.0-5](3.0.0-5 "wikilink"), with the following values:

- Old3DS: 0x103
- New3DS: 0x550

# svc 0x5A

Like what NWM did previously, this one does the following:

` if (in_flag)`
`    CFG11_WIFICNT |= 1;`
` else`
`    CFG11_WIFICNT &= ~1;`

# Kernel error-codes

See [Error codes](Error_codes "wikilink").

| Error-code value | Description                                                                                                                                                                             |
|------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x09401BFE       | Timeout occurred with svcWaitSynchronization\*, when timeout is not ~0.                                                                                                                 |
| 0xC8601801       | No more unused/free synchronization objects left to use in a given object's linked list. (KEvent, KMutex, KTimer, KSemaphore, KAddressArbiter, KThread)                                 |
| 0xC8601802       | No more unused/free KSharedMemory objects left to use in the KSharedMemory linked list - out of blocks                                                                                  |
| 0xC8601809       | No more unused/free KSessions left to use in the KSession linked list - out of sessions                                                                                                 |
| 0xC860180A       | Not enough free memory available for memory allocation.                                                                                                                                 |
| 0xC920181A       | The session was closed by the other process..                                                                                                                                           |
| 0xD0401834       | Max connections to port have been exceeded                                                                                                                                              |
| 0xD8609013       | Unknown, probably reslimit related?                                                                                                                                                     |
| 0xD88007FA       | Returned if no KObjectName object in the linked list of such objects matches the port name provided to the svc.                                                                         |
| 0xD8E007ED       | This indicates that a value is outside of the enum being used.                                                                                                                          |
| 0xD8E007F1       | This error indicates Misaligned address.                                                                                                                                                |
| 0xD8E007F7       | This error indicates that the input handle used with the SVC does not exist in the process handle-table, or that the handle kernel object type does not match the type used by the SVC. |
| 0xD9000402       | Invalid memory permissions for input/output buffers, for svcStartInterProcessDma.                                                                                                       |
| 0xD9001814       | Failed unprivileged load or store - wrong permissions on memory                                                                                                                         |
| 0xD9001BF7       | This error is returned when the kernel retrieves a pointer to a kernel object, but the object type doesn't match the desired one.                                                       |
| 0xD92007EA       | This error is returned when a process attempts to use svcCreateMemoryBlock when the process memorytype is the application memorytype, and when addr=0.                                  |
| 0xE0E01BF5       | This indicates an invalid address was used.                                                                                                                                             |
| 0xF8C007F4       | Invalid type/param0-param3 input for svcKernelSetState. This is also returned for those syscalls marked as stubs.                                                                       |