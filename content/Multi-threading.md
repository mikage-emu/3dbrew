+++
title = 'Multi Threading'
+++

This page documents all kernel functionality for managing multiple
processes and threads as well as handling synchronization between them.

# Processes

Each process is given an array of [kernel capability
descriptors](NCCH/Extended_Header#arm11_kernel_capabilities "wikilink")
upon creation (see CreateProcess). Official software forwards the
descriptors specified in the [NCCH
exheader](NCCH#extended_header "wikilink").

Any process can only use SVCs which are enabled in its kernel capability
descriptors. This is enforced by the ARM11 kernel SVC handler by
checking the syscall access control mask stored on the SVC-mode stack.
If the SVC isn't enabled, a kernelpanic() is triggered. Each process has
a separate SVC-mode stack; this stack and the syscall access mask stored
here are initialized when the process is started. Applications normally
only have access to SVCs \<=0x3D, however not all SVCs \<=0x3D are
accessible to the application. The majority of the SVCs accessible to
applications are unused by the application.

Each process has a separate handle-table, the size of which is stored in
the kernel capability descriptor. The handles in a handle-table can't be
used in the context of other processes, since those handles don't exist
in other handle-tables.

0xFFFF8001 is a handle alias for the current process.

Calling svcBreak on retail will only terminate the process which called
this SVC.

## Usage

### CreateCodeSet

(behavior unconfirmed)

Allocates memory for a process according to the given CodeSetInfo
contents and copies the segment data from the given memory locations to
the allocated memory.

### CreateProcess

(behavior unconfirmed)

Sets up a process using the segments managed by the given CodeSet
handle.

This system call furthermore processes the [kernel
capabilities](NCCH/Extended_Header#arm11_kernel_capabilities "wikilink")
from the [ExHeader](NCCH/Extended_Header "wikilink"), hence setting up
virtual address mappings, CPU clock frequency/L2 cache configuration,
and other things.

### Run

(behavior unconfirmed)

Sets up the main process thread and appends it to the scheduler queue.

The argc, argv, and envp fields from the given StartupInfo structure are
ignored.

## struct CodeSetInfo

All addresses are given virtual for the process to be created. All sizes
are given in 0x1000-pages.

| Type    | Field                                              |
|---------|----------------------------------------------------|
| u8\[8\] | Codeset Name                                       |
| u16     | Unknown, this is written to field 0x5A of KCodeSet |
| u16     | Unknown/padding                                    |
| u32     | Unknown/padding                                    |
| u32     | .text addr                                         |
| u32     | .text size                                         |
| u32     | .rodata start                                      |
| u32     | .rodata size                                       |
| u32     | RW addr (.data + .bss)                             |
| u32     | RW size (.data + .bss)                             |
| u32     | Total .text pages                                  |
| u32     | Total .rodata pages                                |
| u32     | Total RW pages (.data + .bss)                      |
| u32     | Unknown/padding                                    |
| u8\[8\] | Program ID                                         |

# Threads

For Kernel implementation details, see [KThread](KThread "wikilink").

Though it is possible to run multi-threaded programs, running those on
different cores is not possible "as-is". One core is always dedicated to
the OS, hence you will never get 100% of both cores.

Using CloseHandle() with a KThread handle will terminate the specified
thread only if the reference count reaches 0.

Lower priority values give the thread higher priority. For userland
apps, priorities between 0x18 and 0x3F are allowed. The priority of the
app's main thread seems to be 0x30.

The [appcore](Glossary#appcore "wikilink") thread scheduler, in typical
real-time operating system fashion, implements a simple preemptive
algorithm based around multiple thread priority levels. This algorithm
guarantees that the currently executing thread is always the highest
priority runnable thread (also known as SCHED_FIFO). In other words, a
thread will be interrupted (preempted) if and only if a higher priority
thread is woken up, by means of an event (i.e. svcSendSyncRequest) or
similar. Contrary to typical desktop operating systems, no
timeslice-based scheduling is performed, which means that if a thread
uses up all available CPU time (for example if it enters an endless
loop), all other threads with equal or lower priority that run on the
same CPU core won't get a chance to run. Yielding to other threads is
otherwise done by means of synchronization primitives (thread sleep,
mutex, address arbiter, etc.). Address arbiters can be used to implement
process-local synchronization primitives.

0xFFFF8000 is a handle alias for the currently active thread.

## Usage

### CreateThread

**svc** : 0x08

**Signature**

```
Result CreateThread(Handle* thread, func entrypoint, u32 arg, u32 stacktop, s32 threadpriority, s32 processorid);
```

**Configuration**

```
R0=s32 threadpriority
R1=func entrypoint
R2=u32 arg
R3=u32 stacktop
R4=s32 processorid
```

```
Result result=R0
Handle* thread=R1
```

**Details**

Creates a new thread in the current process which will begin execution
at the given entrypoint. The SP CPU register will be initialized to
stacktop, while r0 will be initialized to the given arg.

The input address used for Entrypoint_Param and StackTop are normally
the same, but they may be chosen arbitrarily. For the main thread
(created in svcRun), the Entrypoint_Param is value 0.

The stacktop must be aligned to 0x8-bytes, otherwise when not aligned to
0x8-bytes the ARM11 kernel clears the low 3-bits of the stacktop
address.

The processorid parameter specifies which processor the thread can run
on. Non-negative values correspond to a specific CPU. (e.g. 0 for the
Appcore and 1 for the Syscore on Old3DS. On New3DS, IDs 2 and 3 are also
valid, referring to the 2 additional CPU cores) Special value -1 means
all CPUs, and -2 means the default CPU for the process (Read from the
[Exheader](NCCH/Extended_Header "wikilink"), usually 0 for applications,
1 for system services). Games usually create threads using -2.

The thread priority value must be in the range 0x0..0x3F. Otherwise,
error 0xE0E01BFD is returned.

With the Old3DS kernel, the s32 processorid must be \<=2 (for the
processorid validation check in the kernel). With the New3DS kernel, the
processorid validation check requires processorid to be less than or
equal to \<total cores(MPCore "SCU Configuration Register" CPU number
value + 1)\>, and a number of additional constraints apply: When
processorid==0x2 and the process is not a BASE mem-region process,
exheader kernel-flags bitmask 0x2000 must be set (otherwise error
0xD9001BEA is returned). When processorid==0x3 and the process is not a
BASE mem-region process, error 0xD9001BEA is returned. These are the
only restriction checks done by the kernel for processorid.

### ExitThread

**svc** : 0x09

**Signature**

```
void ExitThread(void);
```

**Details**

Makes the currently running thread exit. When a thread exits, all mutex
objects it owns are released and made available to other threads.

### SleepThread

**svc** : 0x0A

**Signature**

```
void SleepThread(s64 nanoseconds);
```

### GetThreadPriority

**svc** : 0x0B

**Signature**

```
Result GetThreadPriority(s32* priority, Handle thread);
```

**asm**

```
.global svcGetThreadPriority
.type svcGetThreadPriority, %function
svcGetThreadPriority:
   str r0, [sp, #-0x4]!
   svc 0x0B
   ldr r3, [sp], #4
   str r1, [r3]
   bx  lr
```

### SetThreadPriority

**svc** : 0x0C

**Signature**

```
Result SetThreadPriority(Handle thread, s32 priority);
```

### OpenThread

**svc** : 0x34

**Signature**

```
Result OpenThread(Handle* thread, Handle process, u32 threadId);
```

### GetProcessIdOfThread

**svc** : 0x36

**Signature**

```
Result GetProcessIdOfThread(u32* processId, Handle thread);
```

### GetThreadId

**svc** : 0x37

**Signature**

```
Result GetThreadId(u32* threadId, Handle thread);
```

### GetThreadInfo

**svc** : 0x2C

**Signature**

```
Result GetThreadInfo(s64* out, Handle thread, ThreadInfoType type);
```

**Details** This requests always return an error when called, it only
checks if the handle is a thread or not. Hence, it will return
0xD8E007ED (BAD_ENUM) if the Handle is a Thread Handle, 0xD8E007F7
(BAD_HANDLE) if it isn't.

### GetThreadContext

**svc** : 0x3B

**Signature**

```
Result GetThreadContext(ThreadContext* context, Handle thread);
```

**Details** Stubbed?

## Core affinity

The cores are numbered from 0 to 1 for Old 3DS and 0 to 3 for the new
3DS.

### GetThreadAffinityMask

**svc** : 0x0D

**Signature**

```
Result GetThreadAffinityMask(u8* affinitymask, Handle thread, s32 processorcount);
```

### SetThreadAffinityMask

**svc** : 0x0E

**Signature**

```
Result SetThreadAffinityMask(Handle thread, u8* affinitymask, s32 processorcount);
```

### GetThreadIdealProcessor

**svc** : 0x0F

**Signature**

```
Result GetThreadIdealProcessor(s32* processorid, Handle thread);
```

### SetThreadIdealProcessor

**svc** : 0x10

### <APT:SetApplicationCpuTimeLimit>

See
[<APT:SetApplicationCpuTimeLimit>](APT:SetApplicationCpuTimeLimit "wikilink").

You are not able to use the system core (core1) by default. You have to
first assign the amount of time dedicated to the system. The value is in
percent, the higher it is, the more the system will be available for
your application.

For example if you set this value to 25%, it means that your application
will be able to use 25% of the system core at most, even if you never
issue system calls.

If you set the value to a non-zero value, you will not be able to set it
back to 0%. Keep in mind that if your application is heavily dependant
on the system, setting a high value for your application might yield
poorer performance than if you had set a low value.

### <APT:GetApplicationCpuTimeLimit>

See
[<APT:GetApplicationCpuTimeLimit>](APT:GetApplicationCpuTimeLimit "wikilink").

## Debug

### GetThreadList

### GetDebugThreadContext

### SetDebugThreadContext

### GetDebugThreadParam

# Synchronization

Synchronization can be performed via WaitSynchronization on any handles
deriving from
[KSynchronizationObject](KSynchronizationObject "wikilink"). The
semantic meaning of the call depends on the particular object type
referred to by the given handle:

- KClientPort: Wakes if max sessions not reached (free session
  available)
- KClientSession: Always false?
- KDebug: Waits until a debug event is signaled (the user should then
  use svcGetProcessDebugEvent to get the debug event info)
- KDmaObject: ???
- KEvent: Waits until the event is signaled
- KMutex: Acquires a lock on the mutex (blocks until this succeeds)
- KProcess: Waits until the process exits/is terminated
- KSemaphore: This consumes a value from the semaphore count, if
  possible, otherwise continues to wait
- KServerPort: Waits for a new client connection, upon which
  svcAcceptSession is ready to be called
- KServerSession: Waits for an IPC command to be submitted to the server
  process
- KThread: Waits until the thread terminates
- KTimer: Wakes when timer activates (this also clears the timer if it
  is oneshot)

Most synchronization systems seem to have both a "normal" and
"light-weight" version

## Mutex

For Kernel implementation details, see [KMutex](KMutex "wikilink")

### CreateMutex

/!\\ It seems that the mutex will not be available once the thread that
created it is destroyed

### ReleaseMutex

## Semaphore

## Event

## Address Arbiters

Address arbiters are a low-level primitive to implement synchronization
based on a counter stored at some user-specified virtual memory address.
Address arbiters are used to put the current thread to sleep until the
counter is signaled. Both of these tasks are implemented in
ArbitrateAddress.

Address arbiters are implemented by
[KAddressArbiter](KAddressArbiter "wikilink").

### CreateAddressArbiter

```
Result CreateAddressArbiter(Handle* arbiter)
```

Creates an address arbiter handle for use with ArbitrateAddress.

### ArbitrateAddress

```
Result ArbitrateAddress(Handle arbiter, u32 addr, ArbitrationType type, s32 value, s64 nanoseconds)
```

if `type` is SIGNAL, the ArbitrateAddress call will resume up to `value`
of the threads waiting on `addr` using an arbiter, starting with the
highest-priority threads. If `value` is negative, all of these threads
are released. `nanoseconds` remains unused in this mode.

The other modes are used to (conditionally) put the current thread to
sleep based on the memory word at virtual address `addr` until another
thread signals that address using ArbitrateAddress with the `type`
SIGNAL. WAIT_IF_LESS_THAN will put the current thread to sleep if that
word is smaller than `value`. DECREMENT_AND_WAIT_IF_LESS_THAN will
furthermore decrement the memory value before the comparison.
WAIT_IF_LESS_THAN_TIMEOUT and DECREMENT_AND_WAIT_IF_LESS_THAN_TIMEOUT
will do the same as their counterparts, but will have thread execution
resume if `nanoseconds` nanoseconds pass without `addr` being signaled.

### enum ArbitrationType

| Address arbitration type                | Value |
|-----------------------------------------|-------|
| SIGNAL                                  | 0     |
| WAIT_IF_LESS_THAN                       | 1     |
| DECREMENT_AND_WAIT_IF_LESS_THAN         | 2     |
| WAIT_IF_LESS_THAN_TIMEOUT               | 3     |
| DECREMENT_AND_WAIT_IF_LESS_THAN_TIMEOUT | 4     |
