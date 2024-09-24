+++
title = 'Kernel'
+++

The kernel is the core of the operating system(s) running on the ARM9
and ARM11 CPUs. Among other things, it is responsible for memory
management, access control, and process scheduling. It furthermore
provides userland applications with fundamental functionality like
[memory allocation](Memory_Allocation "wikilink"),
[multithreading](Multi-threading "wikilink"), and [interprocess
communication](IPC "wikilink").

The kernel is part of the [system firmware](FIRM "wikilink") and as such
is initialized during the [boot procedure](Bootloader "wikilink").

The functionality provided by the kernel to userland applications is
exposed via [supervisor calls](SVC "wikilink"). Internally, the
implementation of this ABI uses an object-oriented hierarchy of
[objects](:Category:Kernel_objects "wikilink").

Low-level system information is exposed by the kernel via mapping the
[Configuration Memory](Configuration_Memory "wikilink") page in all
processes.

# Scheduler

Little is known about the scheduler behavior of the 3DS kernel.

Threads on the [ARM11 appcore](Glossary#appcore "wikilink") seem to use
cooperative multithreading, i.e. the only way for a CPU to be assigned
to another thread is by invoking a system call. Most system calls
trigger the scheduler, although some of them only conditionally do.

Threads on the [ARM11 syscore](Glossary#syscore "wikilink") have been
hypothesized to use preemptive multithreading, but this is unconfirmed
so far.

It is unknown how the ARM9 CPU core and the two remaining New3DS ARM11
cores are scheduled.
