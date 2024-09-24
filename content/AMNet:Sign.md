+++
title = 'AMNet:Sign'
+++

# Request

| Index Word | Description                     |
|------------|---------------------------------|
| 0          | Header code \[0x08160146\]      |
| 1          | 0x3C (Signature output size)    |
| 2          | 0x180 (Certificate output size) |
| 3-4        | u64, Title id                   |
| 5          | Data input size                 |
| 6          | (Input size \<\< 4) \| 0xA      |
| 7          | Data input pointer              |
| 8          | (0x3C \<\< 4) \| 0xC            |
| 9          | Signature output pointer        |
| 10         | (0x180 \<\< 4) \| 0xC           |
| 11         | Certificate output pointer      |

# Response

| Index Word | Description                                                    |
|------------|----------------------------------------------------------------|
| 0          | Header code                                                    |
| 1          | Result code                                                    |
| 2          | AM internal error value (? Treated like an error value by NIM) |

# Description

Wraps [AMPXI:Sign](AMPXI:Sign "wikilink").

Signs given data with ECC, returning generated signature and
[certificate](Certificates "wikilink").

Certificate is signed with ECDSA with SHA256 and holds an ECC public
key. Signed with the [device
certificate](AMNet:GetDeviceCert "wikilink"). ECC public key on
certificate appears to be randomly generated on call(?).

Used by NIM to sign a message that's not sent over SOAP, however the
device certificate, output signature and output certificate of the
message are.
