+++
title = 'FSPXI:ImportIntegrityVerificationSeed'
+++

# Request

| Index Word | Description                                         |
|------------|-----------------------------------------------------|
| 0          | Header code \[0x00450002\]                          |
| 1          | Always 0x00013006, for 0x130 size: (size\<\<8) \| 6 |
| 2          | Input IntegrityVerificationSeed pointer             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# IntegrityVerificationSeed

| Offset | Size  | Description                                                                                                                      |
|--------|-------|----------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x10  | AES-CBC MAC over a SHA256 hash, which hashes the first 0x110-bytes of the cleartext SEED.                                        |
| 0x10   | 0x120 | The [nand/private/movable.sed](Nand/private/movable.sed "wikilink"), encrypted with AES-CBC using the above MAC for the counter. |

# Description

This decrypts the input SEED and verifies it with the input AES-CBC MAC,
verifies the RSA-signature, then writes the data to
[nand/private/movable.sed](Nand/private/movable.sed "wikilink").
