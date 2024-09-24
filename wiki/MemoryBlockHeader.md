This is the header stored at the beginning of unused blocks of FCRAM
memory. The kernel maintains these structures to keep a list of free
blocks and their sizes.

By overwriting the pointers in instances of this struct (e.g. using an
attack like gspwn) and then (de)allocating memory, one can achieve a
controlled ARM11 kernel-mode write on system versions up to 9.2
([memchunkhax](3DS_System_Flaws#Kernel11 "wikilink")).

Size : 0xC bytes

| Offset | Type                | Description   |
|--------|---------------------|---------------|
| 0x0    | u32                 | Size in pages |
| 0x4    | MemoryBlockHeader\* | Next          |
| 0x8    | MemoryBlockHeader\* | Prev          |