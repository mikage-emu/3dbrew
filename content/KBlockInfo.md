Size : 0x8 bytes

| Offset | Type | Description                                                          |
|--------|------|----------------------------------------------------------------------|
| 0x0    | u32  | Pointer to memory section start in FCRAM using kernel vmem addresses |
| 0x4    | u32  | Page count                                                           |

KBlockInfo objects start with the FS KProcess on the kernel heap and
continue in order. Each KProcess gets 3 or more KBlockInfo objects for
(in order) .text pointer and page count, .rodata pointer and page count,
and .data pointer and page count. Apps that require more space than is
available in a given block will get multiple KBlockInfo objects for each
section to split it up into open spaces.

When KBlockInfo data is destroyed, the page for page reference counts
for each page in the block are updated. At the beginning of base memory,
the first 0x20000 bytes make up 0x8000 words. Each word represents the
reference count for 1 page of FCRAM, in order from beginning to end. As
the pages are checked for freeing up, each reference count is
decremented and the pages with a reference count of 0 are released.

[Category:Kernel objects](Category:Kernel_objects "wikilink")