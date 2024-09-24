| Value    | Signature Method                          | Signature Size | Padding Size |
|----------|-------------------------------------------|----------------|--------------|
| 0x010000 | RSA_4096 SHA1 (Unused for 3DS)            | 0x200          | 0x3C         |
| 0x010001 | RSA_2048 SHA1 (Unused for 3DS)            | 0x100          | 0x3C         |
| 0x010002 | Elliptic Curve with SHA1 (Unused for 3DS) | 0x3C           | 0x40         |
| 0x010003 | RSA_4096 SHA256                           | 0x200          | 0x3C         |
| 0x010004 | RSA_2048 SHA256                           | 0x100          | 0x3C         |
| 0x010005 | ECDSA with SHA256                         | 0x3C           | 0x40         |