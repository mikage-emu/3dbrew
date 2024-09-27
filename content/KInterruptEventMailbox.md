+++
title = 'KInterruptEventMailbox'
categories = [" Kernel objects"]
+++

Size : 0x14 bytes

There are only two instances of this class. The first mailbox contains
pointers to [KProcess](KProcess "wikilink") instances (viewed as
[KSendableInterruptEvent](KSendableInterruptEvent "wikilink")), and its
handling thread has a priority of 0; whereas the second mailbox contains
pointers to [KThread](KThread "wikilink") instances (viewed as
[KSendableInterruptEvent](KSendableInterruptEvent "wikilink")), and
DMA-related interrupt events, and its handling thread has a priority of
16.

The handling thread executes the handler function, i.e. the first
virtual function (then removes the interrupt event from the list) of all
the [KSendableInterruptEvent](KSendableInterruptEvent "wikilink")
instances the mailbox contains. When that list is empty, it sets the
mailbox's "is busy" flag and unschedules itself.

| Offset | Type                                                             | Description                        |
|--------|------------------------------------------------------------------|------------------------------------|
| 0x0    | u32                                                              | Mailbox ID                         |
| 0x4    | [KSendableInterruptEvent](KSendableInterruptEvent "wikilink") \* | First interrupt event              |
| 0x8    | [KSendableInterruptEvent](KSendableInterruptEvent "wikilink") \* | Last interrupt event               |
| 0xC    | u8                                                               | Mailbox is busy (and not empty)    |
| 0xD    | u8\[3\]                                                          | Padding                            |
| 0x10   | [KThread](KThread "wikilink") \* const                           | Kernel thread handling this object |

[Category: Kernel objects](Category:_Kernel_objects "wikilink")