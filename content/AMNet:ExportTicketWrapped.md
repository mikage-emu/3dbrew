+++
title = 'AMNet:ExportTicketWrapped'
+++

# Request

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code \[0x08290184\]                |
| 1          | Crypted ticket buffer length              |
| 2          | 256                                       |
| 3-4        | u64, Title ID                             |
| 5-6        | u64, Ticket ID                            |
| 7          | (CryptedTicketBufferLength \<\< 8) \| 0xC |
| 8          | Crypted ticket buffer output pointer      |
| 9          | (256 \<\< 8) \| 0x1C                      |
| 10         | Wrapped AES key/IV buffer (size 256)      |

# Response

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x082900C1\]                       |
| 1          | Result code                                      |
| 2          | Output crypted ticket buffer length              |
| 3          | Output wrapped AES key/IV length (should be 256) |

# Description

Wrapper for
[AMPXI:ExportTicketWrapped](AMPXI:ExportTicketWrapped "wikilink").

Before calling the AMPXI command, checks the input titleID-high, if it's
0x00048001 (TWL system), 0x00040001 (dlplay child), or has category flag
system (bit 4 set), then returns 0xE0E0803C.