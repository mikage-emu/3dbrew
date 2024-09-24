# Process Services PXI "pxi:ps9"

| Command Header (Pre 2.0) | Command Header (Post 2.0) | Available since system version                                            | Description                                                                                                                                                                                                                                                                                                                      |
|--------------------------|---------------------------|---------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x000100C6               | 0x000100C6                | [1.0.0-0](1.0.0-0 "wikilink")                                             | This crypts a raw message with RSA.                                                                                                                                                                                                                                                                                              |
| 0x00020284               | 0x00020284                | [1.0.0-0](1.0.0-0 "wikilink")                                             | SignRsaSha256                                                                                                                                                                                                                                                                                                                    |
| 0x00030284               | 0x00030284                | [1.0.0-0](1.0.0-0 "wikilink")                                             | VerifyRsaSha256                                                                                                                                                                                                                                                                                                                  |
| 0x00040140               | Removed                   | [1.0.0-0](1.0.0-0 "wikilink"), removed with [2.0.0-2](2.0.0-2 "wikilink") | SetAesKey                                                                                                                                                                                                                                                                                                                        |
| 0x000501C4               | 0x000401C4                | [1.0.0-0](1.0.0-0 "wikilink")                                             | [EncryptDecryptAes](PSPXI:EncryptDecryptAes "wikilink")                                                                                                                                                                                                                                                                          |
| 0x00060284               | 0x00050284                | [1.0.0-0](1.0.0-0 "wikilink")                                             | [EncryptSignDecryptVerifyAesCcm](PSPXI:EncryptSignDecryptVerifyAesCcm "wikilink")                                                                                                                                                                                                                                                |
| 0x00070000               | 0x00060000                | [1.0.0-0](1.0.0-0 "wikilink")                                             | GetRomId. This reads 0x40-bytes from [gamecard](Gamecards "wikilink") command 0xC6 (gamecard-uniqueID), and returns the first 0x10-bytes from that since the rest of the command reply is all 0xFF-bytes.                                                                                                                        |
| 0x00080000               | 0x00070000                | [1.0.0-0](1.0.0-0 "wikilink")                                             | GetRomId2. The first u8 this returns is from GetRomMakerCode, the following 0x10-bytes are from [encrypting](AES "wikilink") the 0x10-bytes which GetRomId also returns. This is encrypted with AES-CBC, the regular normal-key and IV set by [Process9](FIRM "wikilink") for this are loaded from the Process9 .rodata section. |
| 0x00090000               | 0x00080000                | [1.0.0-0](1.0.0-0 "wikilink")                                             | [GetCTRCardAutoStartupBit](PSPXI:GetCTRCardAutoStartupBit "wikilink")                                                                                                                                                                                                                                                            |
| 0x000A0000               | 0x00090000                | [1.0.0-0](1.0.0-0 "wikilink")                                             | GetRomMakerCode                                                                                                                                                                                                                                                                                                                  |
| 0x000B0000               | 0x000A0000                | [1.0.0-0](1.0.0-0 "wikilink")                                             | [GetLocalFriendCodeSeed](PSPXI:GetLocalFriendCodeSeed "wikilink")                                                                                                                                                                                                                                                                |
| 0x000C0000               | 0x000B0000                | [1.0.0-0](1.0.0-0 "wikilink")                                             | [GetDeviceId](PSPXI:GetDeviceId "wikilink")                                                                                                                                                                                                                                                                                      |
| 0x000D0042               | 0x000C0042                | [1.0.0-0](1.0.0-0 "wikilink")                                             | SeedRNG                                                                                                                                                                                                                                                                                                                          |
| 0x000E0042               | 0x000D0042                | [1.0.0-0](1.0.0-0 "wikilink")                                             | [GenerateRandomBytes](PSPXI:GenerateRandomBytes "wikilink")                                                                                                                                                                                                                                                                      |
| 0x04010084               | 0x04010084                | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")                               | GenerateAmiiboHMAC. [New_3DS](New_3DS "wikilink")-only. cmd\[1\] = insize, cmd\[2\] = outsize, cmd\[3\] = (insize\<\<8) \| 0x4, cmd\[4\] = inbufptr, cmd\[5\] = (outsize\<\<8) \| 0x14, and cmd\[6\] = outbufptr.                                                                                                                |
| 0x04020082               | 0x04020082                | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")                               | GenerateAmiiboKeyData. [New_3DS](New_3DS "wikilink")-only. cmd\[1\] = insize, cmd\[2\] = u8 flag, cmd\[3\] = (insize\<\<8) \| 0x4, cmd\[4\] = inbufptr.                                                                                                                                                                          |
| 0x04030044               | 0x04030044                | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")                               | AmiiboEncryptDecrypt. [New_3DS](New_3DS "wikilink")-only.                                                                                                                                                                                                                                                                        |
| 0x04040044               | 0x04040044                | [8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink")                               | AmiiboEncryptDecryptDev. [New_3DS](New_3DS "wikilink")-only.                                                                                                                                                                                                                                                                     |

These RSA commands are an interface for using the [RSA](RSA "wikilink")
engine. The system will hang when it attempts to use a \>RSA-2048 RSA
bit-size with the RSA engine, since the [RSA](RSA "wikilink") engine
does not support \>RSA-2048. These RSA commands have an input field
specifying what RSA bit-size to use, but the RSA padding code is
hard-coded to use RSA-2048.

The New3DS 0x040X commands(used for [Amiibo](Amiibo "wikilink") crypto)
were removed with [9.3.0-21](9.3.0-21 "wikilink"), the code for that was
moved into [NFC](NFC_Services "wikilink")-module.

# Command 0x04010084

The input buffer size must be \<=0x1E0-bytes, and the out buffer size
must be \>0 and \<=0x20-bytes. This calculates a SHA256-HMAC over the
input buffer using the current already-generated
[Amiibo](Amiibo "wikilink") HMAC key(generated_amiibodata+0x20), the
output hash is then written to the out buffer.

# Command 0x04020082

This is used for [Amiibo](Amiibo "wikilink") key generation. 0x30-bytes
are generated. The input buffer size must be 0x40-bytes.

The input u8 must be either zero or non-zero, the used value varies
depending on what crypto(AES/HMAC) operation is done after the crypto
init.

Structure of the input buffer:

| Offset | Size | Description                                                                                                                           |
|--------|------|---------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x2  | This is the raw [Amiibo](Amiibo "wikilink")-write counter u16 from page\[4\] byte1.                                                   |
| 0x2    | 0xE  | All-zero.                                                                                                                             |
| 0x10   | 0x8  | This is the first 8-bytes of the NFC tag serial-number(page0-1).                                                                      |
| 0x18   | 0x8  | Same 8-bytes as above.                                                                                                                |
| 0x20   | 0x20 | This is the plaintext hash from NFC tag page\[0x18\], which is the hash listed under the page 0x15 section [here](Amiibo "wikilink"). |

# Command 0x04030044

This is used for the actual [Amiibo](Amiibo "wikilink") AES crypto, max
input buffer size is same as command 0x04010084. AES-CTR is used here.
Normal-key = generated_amiibodata+0x0, CTR =
generated_amiibodata+0x10(see command 0x04010084 regarding
generated_amiibodata).

# Command 0x04040044

Similar to 0x04030044, except this is devunit-only with dev-only keys.

# RSA Context

| Offset | Size  | Description                                                            |
|--------|-------|------------------------------------------------------------------------|
| 0x0    | 0x100 | Modulo                                                                 |
| 0x100  | 0x100 | Exponent                                                               |
| 0x200  | 0x4   | RSA bit-size.                                                          |
| 0x204  | 0x1   | Exponent Type. 0 = Short Exponent, 1 = Long Exponent. See notes below. |
| 0x205  | 0x3   | Padding                                                                |

This context structure is fixed to 0x208-bytes.

Notes on exponents:

- When the type is a short exponent, the exponent field is used as an
  u32 field with little endianness.
  - An example use of this type is to load the common public exponent,
    0x10001.
- When a long exponent is set, the exponent field is a buffer of a big
  endian number instead.