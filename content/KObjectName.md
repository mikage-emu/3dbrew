+++
title = 'KObjectName'
categories = ["Kernel objects"]
+++

Size : 0x10 bytes

| Offset | Type          | Description                                                       |
|--------|---------------|-------------------------------------------------------------------|
| 0x0    | char\[12\]    | Object name                                                       |
| 0xC    | KClientPort\* | KClientPort that's part of the parent KPort that uses this module |

[Category:Kernel objects](Category:Kernel_objects "wikilink")
