# Request

| Index Word | Description                                                    |
|------------|----------------------------------------------------------------|
| 0          | Header code \[0x00040204\]                                     |
| 1          | Size in bytes                                                  |
| 2          | Destination size in bytes (Unused)                             |
| 3-6        | IV / CTR                                                       |
| 7          | u8 Algorithm [Type](PSPXI:EncryptDecryptAes "wikilink") (0..5) |
| 8          | u8 Key [Type](PSPXI:EncryptDecryptAes "wikilink") (0..7)       |
| 9          | (size\<\<4) \| 10                                              |
| 10         | Source pointer                                                 |
| 11         | (size\<\<4) \| 12                                              |
| 12         | Destination pointer                                            |

# Response

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x00040144\]                      |
| 1          | Result code                                     |
| 2-5        | See [here](PSPXI:EncryptDecryptAes "wikilink"). |

# Description

This is a wrapper for
[PSPXI:EncryptDecryptAes](PSPXI:EncryptDecryptAes "wikilink"). Before
using this PSPXI command, PS module will check whether the algorithm
type is AES-CCM. PS module will return error-code 0xC90107E8 when the
algorithm type is AES-CCM, since
[PSPXI:EncryptDecryptAes](PSPXI:EncryptDecryptAes "wikilink") doesn't
support AES-CCM. When the algorithm type is AES-CBC, PS module will
clear the low 4-bits of the data size.