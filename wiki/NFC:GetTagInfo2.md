# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}}

# Struct

| Offset | Size | Description                                                                                       |
|--------|------|---------------------------------------------------------------------------------------------------|
| 0x00   | 0x2  | u16 size of the below ID data. Normally this is 0x7.                                              |
| 0x02   | 0x1  | Not initialized after clearing.                                                                   |
| 0x03   | 0x1  | Unknown u8, normally 0x2.                                                                         |
| 0x04   | 0x28 | ID data. When the above size field is 0x7, this is the 7-byte NFC tag UID, followed by all-zeros. |
| 0x2C   | 0x4  | u32, unknown(normally 0).                                                                         |
| 0x30   | 0x30 | Left at all-zero, with UID_size=7 at least.                                                       |

# Description

This is similar to [NFC:GetTagInfo](NFC:GetTagInfo "wikilink").