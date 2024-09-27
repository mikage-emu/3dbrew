+++
title = 'CTCert'
+++

# Summary

The console-unique CTCert is used for signing
[CTX](Title_Data_Structure "wikilink") files, the DeviceCert used by
[eShop](eShop "wikilink"), and for [DSiWare](DSiWare_Exports "wikilink")
exports. This ECDSA signature, the ECDSA private key for this cert, and
the IssuerID is loaded from memory initialized by bootrom instead of
NAND. This is the 3DS equivalent of the DSi TWCert.

The CTCert is signed with ECDSA by Nintendo. CTCerts can be verified via
a DER stored in NATIVE_FIRM, separate DERs are used for retail and
dev/debug.

# Structure

| Offset | Size | Description                                                                                                                                                                                                                       |
|--------|------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00   | 0x04 | [Signature](Certificates "wikilink") Type, 0x010005.                                                                                                                                                                              |
| 0x04   | 0x3C | ECDSA Signature using Nintendo's private key, in big-endian. The first 0x1E bytes are "r"; the second 0x1E bytes are "s". The hash is SHA-256 computed over this certificate, starting at byte 0x80 ("Cert Issue ID") to the end. |
| 0x40   | 0x40 | Padding                                                                                                                                                                                                                           |
| 0x80   | 0x40 | Cert Issuer ID, for retail this is "Nintendo CA - G3_NintendoCTR2prod", for dev "Nintendo CA - G3_NintendoCTR2dev"                                                                                                                |
| 0xC0   | 0x04 | Key Type                                                                                                                                                                                                                          |
| 0xC4   | 0x40 | Key ID: "CT<DeviceId>-<ConsoleType>", where DeviceId is the hex [DeviceId](PSPXI:GetDeviceId "wikilink"), and ConsoleType is 00 for retail, any other single byte hex value for dev                                               |
| 0x104  | 0x04 | Expiration time as UNIX Timestamp in big endian.                                                                                                                                                                                  |
| 0x108  | 0x3C | ECDSA Public Key of this console as a curve point in big-endian. The first 0x1E bytes are "x" of this point; the second 0x1E bytes are "y".                                                                                       |
| 0x144  | 0x3C | Padding                                                                                                                                                                                                                           |

Boot ROM decrypts [OTP Registers](OTP_Registers "wikilink") and writes
the private key and Nintendo's signature of CTCert to [ARM9
ITCM](Memory_layout#ARM9_ITCM "wikilink"); the public key is computed
from the private key.

The curve used for ECDSA is sect233r1.