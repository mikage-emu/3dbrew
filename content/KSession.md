+++
title = 'KSession'
categories = ["Kernel auto objects"]
+++

class [KSession](KSession "wikilink") extends
[KAutoObject](KAutoObject "wikilink");

Size : 0x4C bytes

| Offset | Type                            | Description       |
|--------|---------------------------------|-------------------|
| 0x0    | u32                             | Pointer to vtable |
| 0x4    | u32                             | Reference count   |
| 0x20   | [KThread](KThread "wikilink")\* | X ?               |
| 0x24   | [KThread](KThread "wikilink")\* | Y ?               |
| 0x2C   | [KThread](KThread "wikilink")\* | Z ?               |

It seems X=Y=Z. X, Y and Z can be NULL.

Structure for at least [5.0.0-11](5.0.0-11 "wikilink") NATIVE_FIRM
upward:

Size : 0x4C bytes ([KAutoObject](KAutoObject "wikilink"),
[KServerSession](KServerSession "wikilink"),
[KClientSession](KClientSession "wikilink"), sequentially):

| Offset | Type                                        |                                                 |
|--------|---------------------------------------------|-------------------------------------------------|
| 0x0    | [KAutoObject](KAutoObject "wikilink")       | u32                                             |
| 0x4    |                                             | u32                                             |
| 0x8    | [KServerSession](KServerSession "wikilink") | u32                                             |
| 0xC    |                                             | u32                                             |
| 0x10   |                                             | u32                                             |
| 0x14   |                                             | [KLinkedListNode](KLinkedListNode "wikilink")\* |
| 0x18   |                                             | [KLinkedListNode](KLinkedListNode "wikilink")\* |
| 0x1C   |                                             | KSession\*                                      |
| 0x20   |                                             | [KThread](KThread "wikilink")\*                 |
| 0x24   |                                             | [KThread](KThread "wikilink")\*                 |
| 0x28   |                                             | [KThread](KThread "wikilink")\*                 |
| 0x2C   | [KClientSession](KClientSession "wikilink") | u32                                             |
| 0x30   |                                             | u32                                             |
| 0x34   |                                             | u32                                             |
| 0x38   |                                             | [KLinkedListNode](KLinkedListNode "wikilink")\* |
| 0x3C   |                                             | [KLinkedListNode](KLinkedListNode "wikilink")\* |
| 0x40   |                                             | KSession\*                                      |
| 0x44   |                                             | u32                                             |
| 0x48   |                                             | [KClientPort](KClientPort "wikilink")\*         |
|        |                                             |                                                 |

Session status:

1: open
2: closed by client
3: closed by server?

[Category:Kernel auto objects](Category:Kernel_auto_objects "wikilink")
