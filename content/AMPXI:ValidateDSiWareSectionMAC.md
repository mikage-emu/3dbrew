+++
title = 'AMPXI:ValidateDSiWareSectionMAC'
+++

# Request

| Index Word | Description                                             |
|------------|---------------------------------------------------------|
| 0          | Header code \[0x005500C4\]                              |
| 1          | Buf0 size (must be 0x10)                                |
| 2          | Buf1 size (must be 0x20)                                |
| 3          | u8, [DSiWare](DSiWare_Exports "wikilink") section index |
| 4          | (Buf0Size \<\< 8) \| 0x4                                |
| 5          | Buf0 pointer                                            |
| 6          | (Buf1Size \<\< 8) \| 0x14                               |
| 7          | Buf1 pointer                                            |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00550040\] |
| 1          | Result code                |

# Description

This calculates an AES MAC over the 0x20-byte buf1 SHA-256 hash. When
this MAC matches the MAC stored in buf0, result-code 0 is returned,
otherwise an error is returned. This is used by
[AM](AM:ImportDSiWare "wikilink") module to verify the DSiWare section's
[metadata](DSiWare_Exports "wikilink") MAC after decrypting the payload
data.