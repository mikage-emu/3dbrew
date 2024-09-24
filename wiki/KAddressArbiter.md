class [KAddressArbiter](KAddressArbiter "wikilink") extends
[KAutoObject](KAutoObject "wikilink");

Size : 0x14 bytes

| Offset | Type                              | Description       |
|--------|-----------------------------------|-------------------|
| 0x0    | u32                               | Pointer to vtable |
| 0x4    | u32                               | Reference count   |
| 0x8    | [KThread](KThread "wikilink")\*   | Last              |
| 0xC    | [KThread](KThread "wikilink")\*   | First             |
| 0x10   | [KProcess](KProcess "wikilink")\* | Process           |

[Category:Kernel auto objects](Category:Kernel_auto_objects "wikilink")