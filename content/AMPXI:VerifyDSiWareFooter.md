+++
title = 'AMPXI:VerifyDSiWareFooter'
+++

# Request

| Index Word | Description                                                                     |
|------------|---------------------------------------------------------------------------------|
| 0          | Header code \[0x004301C8\]                                                      |
| 1-2        | u64, TWL Title ID (from [header](DSiWare_Exports "wikilink"))                   |
| 3          | Data size                                                                       |
| 4          | ECDSA signature size (must be 0x3C)                                             |
| 5          | [CTCert](CTCert "wikilink") size (must be 0x180)                                |
| 6          | APCert size (must be 0x180)                                                     |
| 7          | u8, [DSiWare](DSiWare_Exports "wikilink") export section index                  |
| 8          | (DataSize \<\< 8) \| 0x6                                                        |
| 9          | Data pointer (contains hashes from [footer](DSiWare_Exports "wikilink"))        |
| 10         | (ECDSASignatureSize \<\< 8) \| 0x16                                             |
| 11         | ECDSA signature pointer (signs data)                                            |
| 12         | (CTCertSize \<\< 8) \| 0x26                                                     |
| 13         | [CTCert](CTCert "wikilink") pointer (from [footer](DSiWare_Exports "wikilink")) |
| 14         | (APCertSize \<\< 8) \| 0x36                                                     |
| 15         | APCert pointer (from [footer](DSiWare_Exports "wikilink"))                      |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00430040\] |
| 1          | Result code                |

# Description

This verifies the ECDSA signature and certificates from the
[DSiWare](DSiWare_Exports "wikilink") export footer. The input CTCert is
verified with a DER stored in NATIVE_FIRM, separate DERs are used for
retail and dev/debug.

When the running NATIVE_FIRM only supports
[DSiWare](DSiWare_Exports "wikilink") exports format v1, the max data
size is 0xC0, otherwise the max size is 0x1C0.