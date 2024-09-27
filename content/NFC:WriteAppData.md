+++
title = 'NFC:WriteAppData'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00160242\] |
| 1          | Size                                              |
| 2-9        | See below input struct.                           |
| 10         | (Size\<\<14) \| 2                                 |
| 11         | Pointer to input appdata buf                      |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Input struct

| Offset | Size | Description                                                                    |
|--------|------|--------------------------------------------------------------------------------|
| 0x0    | 0x7  | NFC tag 7-byte UID, must match the current tag UID stored in NFC module state. |
| 0x8    | 0x2  | Unused                                                                         |
| 0xA    | 0x1  | Size of the above UID, must match a NFC module state field(value 0x7).         |
| 0xB    | 0x15 | Unused                                                                         |

# Description

This is used to write to the [Amiibo](Amiibo "wikilink") app-data stored
in memory, when the app-data was already
[setup](NFC:InitializeWriteAppData "wikilink") for the user application.
When the size is \<0xD8-bytes, the remaining app-data in memory has data
from a "PRNG" written to it.

Besides the usual NFC module state checks, this command can only be used
when a certain state u8 field is non-zero, otherwise an error is
returned.