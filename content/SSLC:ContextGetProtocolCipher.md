+++
title = 'SSLC:ContextGetProtocolCipher'
+++

# Request

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code \[0x001C00C4\]        |
| 1          | SSL context handle                |
| 2          | Outprotocols_maxsize              |
| 3          | Outcipher_maxsize                 |
| 4          | (Outprotocols_maxsize\<\<4) \| 12 |
| 5          | Pointer to outprotocols buffer    |
| 6          | (Outcipher_maxsize\<\<4) \| 12    |
| 7          | Pointer to outcipher buffer       |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is only usable if the connection was already started
successfully(SSLC:StartConnection\*).

This copies two strings to the specified output buffers, each string is
only copied if it was successfully loaded. The out sizes include the
nul-terminator.

Outprotocols contains the protocol versions supported by SSL-module.
What protocol version is currently being used or what protocol versions
are actually supported by the server, do not affect this string. For
example: "TLSv11/TLSv1/SSLv3".

Outcipher contains the cipher suite currently being used. For example:
"EDH-RSA-AES256-SHA".