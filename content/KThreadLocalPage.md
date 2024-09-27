+++
title = 'KThreadLocalPage'
categories = ["Kernel objects"]
+++

Size : 0x18 bytes

| Offset | Type       | Description                                                                               |
|--------|------------|-------------------------------------------------------------------------------------------|
| 0x0    | u32        | Pointer to memory page used for thread local regions for threads owned by a given process |
| 0x4    | KProcess\* | Owner process                                                                             |
| 0x8    | u32        | Number of threads owned by the process                                                    |
| 0xC    | char\[8\]  | Used to track the usage of thread local regions in the local page.                        |
| 0x14   | u32        | Zero                                                                                      |

The 8-byte array used to track the regions in use in the page works like
so:

Each char is either 1 or 0, and there's one char per thread local
region. 0x200 bytes per region \* 8 regions is 0x1000 bytes or 1 full
page. The chars are set to 1 to indicate the region is unused and 0 to
indicate the region is in use.

Processes with more than 8 threads have multiple associated
KThreadLocalPages which are linked together with KLinkedListNodes.

[Category:Kernel objects](Category:Kernel_objects "wikilink")
