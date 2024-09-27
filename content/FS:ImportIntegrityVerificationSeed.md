+++
title = 'FS:ImportIntegrityVerificationSeed'
+++

# Request

| Index Word | Description                                                                                           |
|------------|-------------------------------------------------------------------------------------------------------|
| 0          | Header code \[0x084B0002\]                                                                            |
| 1          | (0x130 \<\< 4) \| 0xA                                                                                 |
| 2          | Input [Integrity Verification Seed](Filesystem_services#integrityverificationseed "wikilink") Pointer |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Description

This decrypts the input SEED and verifies it with the input AES-CBC MAC,
verifies the RSA-signature, then writes the data to
[nand/private/movable.sed](nand/private/movable.sed "wikilink").
