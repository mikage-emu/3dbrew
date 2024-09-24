# Request

| Index Word | Description                 |
|------------|-----------------------------|
| 0          | Header code \[0x00460104\]  |
| 1          | Output Size                 |
| 2          | Input Size                  |
| 3          | Nonce Offset                |
| 4          | Nonce Size (capped to 12)   |
| 5          | (Input Size \<\< 4) \| 0xA  |
| 6          | void\*, Input               |
| 7          | (Output Size \<\< 4) \| 0xC |
| 8          | void\*, Output              |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This encrypts the input data with
[AES-CCM](PS:EncryptSignDecryptVerifyAesCcm "wikilink") using keytype2,
when the input noncesize is \<12 the low 2-bits are cleared in the
noncesize. The 12-byte nonce buffer used by NS is cleared to all-zero,
then the nonce from inputbuf+nonceoffset with the noncesize is copied to
this nonce buffer. NS then copies the data at inputbuf+0 to
outbuf+noncesize, with the nonceoffset.

NS then copies the data at inbuf+nonceoffset+noncesize to
outbuf+nonceoffset+noncesize, with size
inputbuffersize-nonceoffset-noncesize. NS then uses
[PS:EncryptSignDecryptVerifyAesCcm](PS:EncryptSignDecryptVerifyAesCcm "wikilink")
with keytype2 and with the above nonce buffer, where the input/output
buffer ptrs are outbuf+noncesize, with size
nonceoffset+(inputbuffersize-nonceoffset-noncesize). NS then copies the
the nonce from the nonce-buffer with the noncesize, to outbuf+0.

In other words, the nonce with noncesize located at nonceoffset in the
input buffer is copied to the beginning of the output buffer. The rest
of the input data are concatenated, encrypted via
[PS:EncryptSignDecryptVerifyAesCcm](PS:EncryptSignDecryptVerifyAesCcm "wikilink")
using the said nonce (padded or capped to 12 bytes), and then written to
outbuf+noncesize.