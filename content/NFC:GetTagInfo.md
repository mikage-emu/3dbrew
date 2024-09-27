+++
title = 'NFC:GetTagInfo'
+++

# Request

| Index Word | Description                                       |
|------------|---------------------------------------------------|
| 0          | Header code \[Starting with 9.3.0-X: 0x00110000\] |

# Response

| Index Word | Description              |
|------------|--------------------------|
| 0          | Header code              |
| 1          | Result code              |
| 2-12       | Output 0x2C-byte struct. |

# Struct

| Offset | Size | Description                                                                                                                                                                                                                                                                                     |
|--------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00   | 0x2  | u16 size/offset of the below ID data. Normally this is 0x7. When this is \<=10, this field is the size of the below ID data. When this is \>10, this is the offset of the 10-byte ID data, relative to structstart+4+<offsetfield-10>. It's unknown in what cases this 10-byte ID data is used. |
| 0x02   | 0x1  | Unknown u8, normally 0x0.                                                                                                                                                                                                                                                                       |
| 0x03   | 0x1  | Unknown u8, normally 0x2.                                                                                                                                                                                                                                                                       |
| 0x04   | 0x28 | ID data. When the above size field is 0x7, this is the 7-byte NFC tag UID, followed by all-zeros.                                                                                                                                                                                               |
