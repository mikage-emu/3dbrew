+++
title = 'APT:Unwrap'
+++

# Request

| Index Word | Description                       |
|------------|-----------------------------------|
| 0          | Header code \[0x00470104\]        |
| 1          | Output Size                       |
| 2          | Input Size                        |
| 3          | Nonce offset in the output buffer |
| 4          | Nonce Size (capped to 12)         |
| 5          | (Input Size \<\< 4) \| 0xA        |
| 6          | void\*, Input                     |
| 7          | (Output Size \<\< 4) \| 0xC       |
| 8          | void\*, Output                    |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This decrypts the input data with
[AES-CCM](PS:EncryptSignDecryptVerifyAesCcm "wikilink") using keytype2,
when the input noncesize is \<12 the low 2-bits are cleared in the
noncesize. The 12-byte nonce buffer used by NS is cleared to all-zero,
then the nonce from inputbuf+0 with the noncesize is copied to this
nonce buffer. NS then uses
[PS:EncryptSignDecryptVerifyAesCcm](PS:EncryptSignDecryptVerifyAesCcm "wikilink")
with keytype2 and with the above nonce buffer, where the inputptr is
inputbuf+noncesize, outputptr is outputbuf+0, and size is
inputbuffersize - noncesize - 16.

After decryption, NS copies the data at outbuf+nonceoffset to
outbuf+nonceoffset+noncesize, with size inputbuffersize-nonceoffset-16.
NS then copies the nonce from inputbuf+0 with the noncesize, to
outbuf+nonceoffset.

In other words, the data begin from inputbuffer+noncesize is decrypted
via
[PS:EncryptSignDecryptVerifyAesCcm](PS:EncryptSignDecryptVerifyAesCcm "wikilink")
using the nonce located at the beginning of the input buffer (with the
size padded or capped to 12). Then the decrypted data is split into two
parts, of which the first one is with size nonceoffset. The nonce is
then inserted between the two parts, and written to the output buffer
together with decrypted data.