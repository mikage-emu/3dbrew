+++
title = 'Title Metadata'
categories = ["File formats"]
+++

**Title metadata** is a format used to store information about a title
(installed title, DLC, etc.) and all its installed contents, including
which contents they consist of and their SHA256 hashes.

[Code is available](https://bitbucket.org/trap15/3dshax) by trap15 to
parse the available information from the 3DS format of TMDs.

## Structure

All the data in the file represented in Big Endian, unless otherwise
noted.

|            |                    |                        |
|:----------:|:------------------:|:----------------------:|
| **Offset** |      **Size**      |    **Description**     |
|    0x0     |         Y          |     Signature Data     |
|     Y      |        0xC4        |         Header         |
|  0xC4 + Y  |      0x24\*64      | Content Info Records.  |
| 0x9C4 + Y  | 0x30\*ContentCount | Content Chunk Records. |

Y denotes the total size of the "Signature Data" section and depends on
the signature type.

### Signature Data

The signature is of the header of the TMD.

|            |          |                                                   |
|:----------:|:--------:|:-------------------------------------------------:|
| **Offset** | **Size** |                  **Description**                  |
|    0x0     |   0x4    |                  Signature Type                   |
|    0x4     |    X     |                     Signature                     |
|  0x4 + X   |          | Padding Aligning the signature data to 0x40 bytes |

#### Signature Type

The hash for the signature, is calculated over the header of the TMD

### Header

|            |          |                                                                          |
|:----------:|:--------:|:------------------------------------------------------------------------:|
| **Offset** | **Size** |                             **Description**                              |
|    0x0     |   0x40   |                             Signature Issuer                             |
|    0x40    |   0x1    |                                 Version                                  |
|    0x41    |   0x1    |                              ca_crl_version                              |
|    0x42    |   0x1    |                            signer_crl_version                            |
|    0x43    |   0x1    |                                 Reserved                                 |
|    0x44    |   0x8    |                              System Version                              |
|    0x4C    |   0x8    |                                 Title ID                                 |
|    0x54    |   0x4    |                                Title Type                                |
|    0x58    |   0x2    |                                 Group ID                                 |
|    0x5A    |   0x4    | Save Data Size in Little Endian (Bytes) (Also SRL Public Save Data Size) |
|    0x5E    |   0x4    |           SRL Private Save Data Size in Little Endian (Bytes)            |
|    0x62    |   0x4    |                                 Reserved                                 |
|    0x66    |   0x1    |                                 SRL Flag                                 |
|    0x67    |   0x31   |                                 Reserved                                 |
|    0x98    |   0x4    |                              Access Rights                               |
|    0x9C    |   0x2    |                              Title Version                               |
|    0x9E    |   0x02   |                              Content Count                               |
|    0xA0    |   0x2    |                               Boot Content                               |
|    0xA2    |   0x2    |                                 Padding                                  |
|    0xA4    |   0x20   |                 SHA-256 Hash of the Content Info Records                 |

### Content Info Records

There are 64 of these records, usually only the first is used.

| Offset | Size | Description                                                              |
|--------|------|--------------------------------------------------------------------------|
| 0x00   | 2    | Content index offset                                                     |
| 0x02   | 2    | Content command count \[k\]                                              |
| 0x04   | 0x20 | SHA-256 hash of the next k content records that have not been hashed yet |

### Content chunk records

There is one of these for each content contained in this title.
(Determined by "Content Count" in the TMD Header).

| Offset | Size | Description   |
|--------|------|---------------|
| 0x00   | 4    | Content id    |
| 0x04   | 2    | Content index |
| 0x06   | 2    | Content type  |
| 0x08   | 8    | Content size  |
| 0x10   | 0x20 | SHA-256 hash  |

#### Content Index

This indicates the content type:

| Index | Content Type                                                                                                                                 |
|-------|----------------------------------------------------------------------------------------------------------------------------------------------|
| 0000  | Main Content (.[CXI](NCCH#CXI "wikilink") for 3DS executable content/.[CFA](NCCH#CFA "wikilink") for 3DS Data Archives/.SRL for TWL content) |
| 0001  | Home Menu Manual (.[CFA](NCCH#CFA "wikilink"))                                                                                               |
| 0002  | DLP Child Container (.[CFA](NCCH#CFA "wikilink"))                                                                                            |

This does not apply to DLC.

#### Content Type flags

| Flags  | Description             |
|--------|-------------------------|
| 1      | Encrypted               |
| 2      | Disc                    |
| 4      | CFM (abbreviation for?) |
| 0x4000 | Optional                |
| 0x8000 | Shared                  |

## Certificate Chain

If the TMD file is obtained from Nintendo's CDN, then it will have two
[certificates](Certificates "wikilink") appended at the end of the file:

| CERTIFICATE | SIGNATURE TYPE | RETAIL CERT NAME | DEBUG CERT NAME | DESCRIPTION                        |
|-------------|----------------|------------------|-----------------|------------------------------------|
| TMD         | RSA-2048       | CP0000000b       | CP0000000a      | Used to verify the TMD signature   |
| CA          | RSA-4096       | CA00000003       | CA00000004      | Used to verify the TMD Certificate |

The CA certificate is issued by 'Root', the public key for which is
stored in NATIVE_FIRM.

## Example code application

``` c
 enum sig_type {
         RSA_2048_SHA256 = 0x00010004,
         RSA_4096_SHA256 = 0x00010003,
         RSA_2048_SHA1   = 0x00010001,
         RSA_4096_SHA1   = 0x00010000
 };

// Sorry I removed the example struct because it is wrong.
```

[Category:File formats](Category:File_formats "wikilink")