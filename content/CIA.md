+++
title = 'CIA'
categories = ["File formats"]
+++

## Overview

CIA stands for **C**TR **I**mportable **A**rchive. This format allows
the installation of titles to the 3DS. CIA files and titles on
[Nintendo's CDN](Title_list "wikilink") contain identical data. As a
consequence, valid CIA files can be generated from CDN content. This
also means CIA files can contain anything that titles on Nintendo's CDN
can contain.

Under normal circumstances CIA files are used where downloading a title
is impractical or not possible. Such as distributing a [Download
Play](Download_Play "wikilink") child, or installing forced Gamecard
updates. Those CIA(s) are stored by the titles in question, in an
auxiliary [CFA](NCCH#cfa "wikilink") file.

Development Units, are capable of manually installing CIA files via the
[Dev Menu](3DS_Development_Unit_Software#dev_menu "wikilink").

## Format

This is the current version of the CIA format, it was finalised in late
2010. (Older versions of the CIA format can be viewed on the
[Talk](Talk:CIA "wikilink") page)

The CIA format has a similar structure to the [WAD
format](http://wiibrew.org/wiki/Wad).

The file is represented in little-endian.

The data is aligned in 64 byte blocks (if a content ends at the middle
of the block, the next content will begin from a new block).

### CIA Header

| START | SIZE   | DESCRIPTION                                      |
|-------|--------|--------------------------------------------------|
| 0x00  | 0x04   | Archive Header Size (Usually = 0x2020 bytes)     |
| 0x04  | 0x02   | Type                                             |
| 0x06  | 0x02   | Version                                          |
| 0x08  | 0x04   | Certificate chain size                           |
| 0x0C  | 0x04   | [Ticket](Ticket "wikilink") size                 |
| 0x10  | 0x04   | [TMD](TMD "wikilink") (Title Metadata) file size |
| 0x14  | 0x04   | Meta size (0 if no Meta data is present)         |
| 0x18  | 0x08   | Content size                                     |
| 0x20  | 0x2000 | Content Index                                    |

The order of the sections in the CIA file:

- certificate chain
- Ticket
- TMD file data
- Content file data
- Meta file data (Not a necessary component)

The contents (NCCH/SRL) are encrypted using 128-bit AES-CBC. The
encryption uses the decrypted titlekey from the
[ticket](Ticket#structure "wikilink"), and the content index from the
TMD padded with zeros as the IV.

### Certificate Chain

There are three [certificates](Certificates "wikilink") in this chain:

| CERTIFICATE | SIGNATURE TYPE | RETAIL CERT NAME | DEBUG CERT NAME | DESCRIPTION                                |
|-------------|----------------|------------------|-----------------|--------------------------------------------|
| CA          | RSA-4096       | CA00000003       | CA00000004      | Used to verify the Ticket/TMD Certificates |
| Ticket      | RSA-2048       | XS0000000c       | XS00000009      | Used to verify the Ticket signature        |
| TMD         | RSA-2048       | CP0000000b       | CP0000000a      | Used to verify the TMD signature           |

The CA certificate is issued by 'Root', the public key for which is
stored in NATIVE_FIRM.

### Meta

The structure of this data is as follows:

| START | SIZE   | DESCRIPTION                                                                                         |
|-------|--------|-----------------------------------------------------------------------------------------------------|
| 0x00  | 0x180  | Title ID dependency list - Taken from the application's [ExHeader](NCCH/Extended_Header "wikilink") |
| 0x180 | 0x180  | Reserved                                                                                            |
| 0x300 | 0x4    | Core Version                                                                                        |
| 0x304 | 0xFC   | Reserved                                                                                            |
| 0x400 | 0x36C0 | [Icon Data](SMDH "wikilink")(.ICN) - Taken from the application's [ExeFS](ExeFS "wikilink")         |

Obviously this section is not present in TWL CIA files, or any other CIA
file which does not contain a [CXI](NCCH#cxi "wikilink").

## Tools

- [ctrtool](https://github.com/3dshax/ctr/tree/master/ctrtool) -
  Reading/Extraction of CIA files. This can only decrypt the title-key
  for development CIAs, since retail CIAs use the [AES](AES "wikilink")
  hardware key-scrambler for the common-key keyslot.

<!-- -->

- [make_cia](https://github.com/Tiger21820/ctr_toolkit/tree/master/make_cia) -
  Generating CIA files. Requires CommonKey and ticket/TMD RSA-2048
  private exponents.

<!-- -->

- [make_cdn_cia](https://github.com/Tiger21820/ctr_toolkit/tree/master/make_cdn_cia) -
  (CMD)(Windows/Linux) Generates CIA files from CDN Content

<!-- -->

- [makerom](makerom "wikilink") - Tool which can be used to create NCCH,
  CCI, and CIA files.

## Title Key Encryption

The unencrypted Title Key is used to encrypt the data in a CIA. The
encrypted Title Key of a CIA can be found at offset 0x1BF in a CIA's
Ticket. Each Title Key is encrypted with AES-CBC to get the encrypted
Title Key.

To encrypt an unencrypted title key, you need:

- Common key (as byte array)
- Title ID (as ulong)
- (and of course the unencrypted title key you want to encrypt) (as byte
  array)

The title key encryption process starts by converting the ulong (Title
ID) into a byte array using by retrieving the bytes of the Title ID
using BitConverter.GetBytes(). If the converted bytes (title ID) are in
Little Endian, reverse those bytes. (in C# it would be
Array.Reverse(byte_array_from_bitconverter)) This process makes the
Title Key encryption IV.

Next, after you've gotten your Title Key's IV, you can start your
cryptography transformation. Using AESManaged, where:

Key = Common Key

IV = the byte array found in the conversion process above

Mode = CipherMode.CBC

Create the encryptor (AesManaged.CreateEncryptor(key, iv)) where the key
and IV are both the same as above.

Then, create a CryptoStream and a MemoryStream. The Crypto stream should
start with the arguments (memorystream, aes_transform_from_above,
CryptoStreamMode.Write).

Write to the CryptoStream where buffer=unencrypted_titlekey, offset=0,
and count=the length of the unencrypted title key.

Use FlushFinalBlock() on the CryptoStream.

Finally, then, the encrypted title key will be available from your
memory stream. (to output the calculated encrypted title key as a byte
array, you can use memorystream.ToArray(), for example)

Example function: (C#)

            public static byte[] EncryptMyTitleKey(byte[] commonKey, byte[] titleKey, ulong titleId)
            {
                // Make encryption IV
                byte[] titleidasbytes = new byte[0x10];
                for (int i = 0; i < 0x10; i++)
                {
                    titleidasbytes[i] = 0;
                }
                byte[] bitBytes = BitConverter.GetBytes(titleId);
                if (BitConverter.IsLittleEndian)
                {
                    Array.Reverse(bitBytes);
                }
                bitBytes.CopyTo(titleidasbytes, 0);
                // Encrypt
                ICryptoTransform transform = new AesManaged { Key = commonKey, IV = titleidasbytes, Mode = CipherMode.CBC }.CreateEncryptor(commonKey, titleidasbytes);
                MemoryStream memstream = new MemoryStream();
                CryptoStream cryptostream = new CryptoStream(memstream, transform, CryptoStreamMode.Write);
                cryptostream.Write(titleKey, 0, titleKey.Length);
                cryptostream.FlushFinalBlock();
                return memstream.ToArray();
            }

[Category:File formats](Category:File_formats "wikilink")
