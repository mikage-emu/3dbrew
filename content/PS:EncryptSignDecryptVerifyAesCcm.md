# Request

| Index Word | Description                                                 |
|------------|-------------------------------------------------------------|
| 0          | Header code \[0x00050284\]                                  |
| 1          | Input buffer size, unused by PS module.                     |
| 2          | Total CBC-MAC associated data, in bytes.                    |
| 3          | Total data size, in bytes.                                  |
| 4          | Output buffer size, unused by PS module.                    |
| 5          | MAC size in bytes.                                          |
| 6-8        | Nonce                                                       |
| 9          | Algorithm [Type](PSPXI:EncryptDecryptAes "wikilink") (0..5) |
| 10         | Key [Type](PSPXI:EncryptDecryptAes "wikilink") (0..7)       |
| 11         | (inbufsize\<\<4) \| 10                                      |
| 12         | Source pointer                                              |
| 13         | (outbufsize\<\<4) \| 12                                     |
| 14         | Destination pointer                                         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This is a wrapper for
[PSPXI:EncryptSignDecryptVerifyAesCcm](PSPXI:EncryptSignDecryptVerifyAesCcm "wikilink").
The algorithm type must be AES-CCM, otherwise PS module will return
error-code 0xC90107E8. When the CBC-MAC total associated data-size is
not aligned to 0x10-bytes, or when MAC size bit0 is set / MAC size is
\>16-bytes, PS module will return error-code 0xC90107EC. PS module
automatically determines the input/output buffer sizes for the specified
algorithm-type for
[PSPXI:EncryptSignDecryptVerifyAesCcm](PSPXI:EncryptSignDecryptVerifyAesCcm "wikilink"),
using the specified sizes for this command.