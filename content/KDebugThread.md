+++
title = 'KDebugThread'
categories = ["Kernel objects"]
+++

Size : 0x18 bytes

| Offset | Type                             | Description                                                                |
|--------|----------------------------------|----------------------------------------------------------------------------|
| 0x0    | [KThread](KThread "wikilink") \* | Pointer to KThread object this KDebugThread is linked to                   |
| 0x4    | u8                               | Indicates that svcBreak was used with type != (UN)LOAD_RO                  |
| 0x5    | u8                               | Indicates that the thread has been locked by KDebug-related functions      |
| 0x6    | u8                               | Indicates that the thread shall be locked, set by KDebug-related functions |
| 0x7    | u8                               | For SCHEDULE IN/OUT debug events: 0 for IN, 1 for OUT                      |
| 0x8    | u8                               | Thread is attached                                                         |
| 0x9    | u8                               | For SYSCALL IN/OUT debug events: 0 for IN, 1 for OUT                       |
| 0xA    | u8\[2\]                          | Padding                                                                    |
| 0xC    | u32                              | Thread exit reason                                                         |
| 0x10   | u32                              | ID of the creator thread                                                   |
| 0x14   | u32                              | Fault Address Register (when applicable)                                   |

[Category:Kernel objects](Category:Kernel_objects "wikilink")
