+++
title = 'AMPXI:ExportTicketWrapped'
+++

# Request

| Index Word | Description                               |
|------------|-------------------------------------------|
| 0          | Header code \[0x006D0184\]                |
| 1          | Crypted ticket buffer length              |
| 2          | 256                                       |
| 3-4        | u64, Title ID                             |
| 5-6        | u64, Ticket ID                            |
| 7          | (CryptedTicketBufferLength \<\< 8) \| 0x4 |
| 8          | Crypted ticket buffer output pointer      |
| 9          | (256 \<\< 8) \| 0x14                      |
| 10         | Wrapped AES key/IV buffer (size 256)      |

# Response

| Index Word | Description                                      |
|------------|--------------------------------------------------|
| 0          | Header code \[0x006D00C1\]                       |
| 1          | Result code                                      |
| 2          | Output crypted ticket buffer length              |
| 3          | Output wrapped AES key/IV length (should be 256) |

# Description

This function gets a 32 byte buffer using the internal P9 PRNG function;
first 16 bytes is used as AES-CBC key and last 16 bytes is used as IV.

Next, it searches through tickets looking for one with provided
ticketID, returns `0xD8808040` if not found;

Next, it reads the ticket, 0x8000 bytes at a time, into a 0x8000-byte
stack buffer, after each read that buffer is crypted using that randomly
generated key/IV, then written into the first output buffer;

Finally, it encrypts the AES key/IV with RSA-2048 PKCS1; using a new
public key stored in P9 .rodata; and writes the crypted output into the
second output buffer.
