+++
title = 'GPIO:BindInterrupt'
+++

# Request

| Index Word | Description                                                                              |
|------------|------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00090082\]                                                               |
| 1          | u32, interrupt bitmask                                                                   |
| 2          | s32, priority                                                                            |
| 3          | Must be value [0x00000000](IPC#Message_Structure "wikilink"), otherwise error 0xD9001830 |
| 4          | Handle syncObject                                                                        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This binds an interrupt in gpio-module's [interrupt
ACL](NCCH/Extended_Header#ARM11_Kernel_Capabilities "wikilink") to the
specified syncObject (using [svcBindInterrupt](SVC "wikilink")).

# Supported values

| Bitmask | Interrupt |
|---------|-----------|
| 0x2     | 0x63      |
| 0x4     | 0x60      |
| 0x8     | 0x64      |
| 0x10    | 0x66      |
| 0x40    | 0x68      |
| 0x80    | 0x69      |
| 0x100   | 0x6A      |
| 0x200   | 0x6B      |
| 0x400   | 0x6C      |
| 0x800   | 0x6D      |
| 0x1000  | 0x6E      |
| 0x2000  | 0x6F      |
| 0x4000  | 0x70      |
| 0x8000  | 0x71      |
| 0x10000 | 0x72      |
| 0x20000 | 0x73      |

See also [ARM11 Interrupts](ARM11_Interrupts "wikilink").

# Interrupts bound by modules

| Module                             | Bound interrupts (bitmask) |
|------------------------------------|----------------------------|
| [codec](Codec_Services "wikilink") | 0x8                        |
| [hid](HID_Services "wikilink")     | 0x100                      |
| [ir](IR_Services "wikilink")       | 0x40                       |
| [mcu](MCU_Services "wikilink")     | 0x8000                     |

See
[GPIO:BindInterrupt#Supported_values](GPIO:BindInterrupt#Supported_values "wikilink")
for the bitmask \<-\> IRQ number correspondence table.
