+++
title = 'PSPXI:EncryptSignDecryptVerifyAesCcm'
+++

# Request

| Index Word | Description                                                 |
|------------|-------------------------------------------------------------|
| 0          | Header code \[0x00050284\]                                  |
| 1          | Input buffer size                                           |
| 2          | Output buffer size                                          |
| 3          | Total CBC-MAC associated data, in bytes.                    |
| 4          | Total data size, in bytes.                                  |
| 5          | MAC size in bytes.                                          |
| 6-8        | Nonce                                                       |
| 9          | Algorithm [Type](PSPXI:EncryptDecryptAes "wikilink") (0..5) |
| 10         | Key [Type](PSPXI:EncryptDecryptAes "wikilink") (0..7)       |
| 11         | (inbufsize\<\<8) \| 0x4                                     |
| 12         | Source pointer                                              |
| 13         | (outbufsize\<\<8) \| 0x14                                   |
| 14         | Destination pointer                                         |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# MAC

For AES-CCM encryption, the output MAC is written to
outputbufptr+(totaldatasize). For AES-CCM decryption, the input MAC is
located at inputbufptr+(totalassocdata+totaldatasize). For AES-CCM
decryption when the calculated MAC is invalid, error-code 0xC9010401 is
returned.

# Description

This is similar to
[PSPXI:EncryptDecryptAes](PSPXI:EncryptDecryptAes "wikilink"), except
this command is only used for AES-CCM. For AES-CCM encryption, the
output buffer size must include the MAC, for AES-CCM decryption the
input buffer size must include the MAC.