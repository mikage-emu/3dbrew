+++
title = 'GPIO:UnbindInterrupt'
+++

# Request

| Index Word | Description                                                                              |
|------------|------------------------------------------------------------------------------------------|
| 0          | Header code \[0xA0042\]                                                                  |
| 1          | u32, interrupt bitmask                                                                   |
| 2          | Must be value [0x00000000](IPC#Message_Structure "wikilink"), otherwise error 0xD9001830 |
| 3          | Handle syncObject                                                                        |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

See also [GPIO:BindInterrupt](GPIO:BindInterrupt "wikilink") and [ARM11
Interrupts](ARM11_Interrupts "wikilink").
