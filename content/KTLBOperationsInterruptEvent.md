+++
title = 'KTLBOperationsInterruptEvent'
categories = ["Kernel interrupt events"]
+++

class
[KTLBOperationsInterruptEvent](KTLBOperationsInterruptEvent "wikilink")
extends [KBaseInterruptEvent](KBaseInterruptEvent "wikilink")

There is one instance of this object per core.

Size : 0x10 bytes

| Offset | Type                                          | Description                       |
|--------|-----------------------------------------------|-----------------------------------|
| 0x0    | void \*\*                                     | Pointer to vtable                 |
| 0x4    | [KProcessHwInfo](KProcessHwInfo "wikilink")\* | Context info (for operation 1)    |
| 0x8    | void \*                                       | Virtual address (for operation 2) |
| 0xC    | u32                                           | Current operation                 |

Possible operations (any other value leads to a kernel panic):

| Operation | Description                                                                          |
|-----------|--------------------------------------------------------------------------------------|
| 0         | No operation (when an operation is completed, the interrupt handler sets this value) |
| 1         | Invalidate unified TLB entries on context ID match                                   |
| 2         | Invalidate entire unified TLB                                                        |
| 3         | Invalidate unified TLB entries on VA match                                           |
| 4         | Reset context: sets the context ID to 0 and TTB0 to <end of userland memory>         |

[Category:Kernel interrupt
events](Category:Kernel_interrupt_events "wikilink")
