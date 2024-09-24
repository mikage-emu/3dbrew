+++
title = 'FSPXI:ExportIntegrityVerificationSeed'
+++

# Request

| Index Word | Description                                                                                  |
|------------|----------------------------------------------------------------------------------------------|
| 0          | Header code \[0x00440002\]                                                                   |
| 1          | Always 0x00013004, for 0x130 size: (size\<\<8) \| 4                                          |
| 2          | Output [IntegrityVerificationSeed](FSPXI:ImportIntegrityVerificationSeed "wikilink") pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This encrypts
[nand/private/movable.sed](nand/private/movable.sed "wikilink") to the
output buffer, and writes the AES-CBC MAC to the output buffer as well.
