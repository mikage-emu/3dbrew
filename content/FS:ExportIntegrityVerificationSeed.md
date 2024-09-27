+++
title = 'FS:ExportIntegrityVerificationSeed'
+++

# Request

| Index Word | Description                                                                                            |
|------------|--------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x084A0002\]                                                                             |
| 1          | (0x130 \<\< 4) \| 0xC                                                                                  |
| 2          | Output [Integrity Verification Seed](Filesystem_services#integrityverificationseed "wikilink") Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This encrypts
[nand/private/movable.sed](nand/private/movable.sed "wikilink") to the
output buffer, and writes the AES-CBC MAC to the output buffer as well.
