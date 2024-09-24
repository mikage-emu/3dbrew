+++
title = 'AMPXI:ValidateDSiWareMovableSedHash'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00530084\] |
| 1          | Buf0 size (must be 0x10)   |
| 2          | Buf1 size (must be 0x20)   |
| 3          | (Buf0Size \<\< 8) \| 0x4   |
| 4          | Buf0 pointer               |
| 5          | (Buf1Size \<\< 8) \| 0x14  |
| 6          | Buf1 pointer               |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00530040\] |
| 1          | Result code                |

# Description

This calculates a SHA-256 hash over the 0x130-byte data from
[FSPXI:ExportIntegrityVerificationSeed](FSPXI:ExportIntegrityVerificationSeed "wikilink").
When the calculated hash matches the hash stored in buf1, result-code
0xC8A0802E is returned, otherwise result-code 0xC8A0802F is returned.

The 0x10-byte buf0 data is copied to internal memory, however this data
is not used after it's copied. This command is used by
[AM](Application_Manager_Services_PXI "wikilink") module to verify the
hash stored in the [DSiWare](DSiWare_Exports "wikilink") export header,
when AM uses this command buf0 contains the encrypted AES block from the
header.
