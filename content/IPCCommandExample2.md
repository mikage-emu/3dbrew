Adapted from [PS:EncryptDecryptAes](PS:EncryptDecryptAes "wikilink") to
illustrate the new IPC command templates.

# Request

{{#vardefine:ipc_offset\|0}}

# Response

{{#vardefine:ipc_offset\|0}} \|- \| 2-5 \| See
[here](PSPXI:EncryptDecryptAes "wikilink").

# Description

This is a wrapper for
[PSPXI:EncryptDecryptAes](PSPXI:EncryptDecryptAes "wikilink"). Before
using this PSPXI command, PS module will check whether the algorithm
type is AES-CCM. PS module will return error-code 0xC90107E8 when the
algorithm type is AES-CCM, since
[PSPXI:EncryptDecryptAes](PSPXI:EncryptDecryptAes "wikilink") doesn't
support AES-CCM. When the algorithm type is AES-CBC, PS module will
clear the low 4-bits of the data size.