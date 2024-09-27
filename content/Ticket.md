+++
title = 'Ticket'
categories = ["File formats"]
+++

Tickets are a format used to store an encrypted titlekey (using 128-Bit
AES-CBC). With 3DS, the Ticket format was updated (now v1) from Wii/DSi
format (v0).

## Structure

All of the data in the file is represented in Big Endian.

|            |          |                 |
|:----------:|:--------:|:---------------:|
| **Offset** | **Size** | **Description** |
|   0x000    |    Y     | Signature Data  |
|     Y      |  0x210   |   Ticket Data   |

Y denotes the total size of the "Signature Data" section and depends on
the signature type.

### Signature Data

The signature is of the ticket header.

|            |          |                                                   |
|:----------:|:--------:|:-------------------------------------------------:|
| **Offset** | **Size** |                  **Description**                  |
|    0x0     |   0x4    |                  Signature Type                   |
|    0x4     |    X     |                     Signature                     |
|  0x4 + X   |          | Padding to align the signature data to 0x40 bytes |

#### Signature Type

The hash for the signature is calculated over the Ticket Data.

### Ticket Data

|            |          |                                                                                                                   |
|:----------:|:--------:|:-----------------------------------------------------------------------------------------------------------------:|
| **Offset** | **Size** |                                                  **Description**                                                  |
|    0x0     |   0x40   |                                                      Issuer                                                       |
|    0x40    |   0x3C   |                                                   ECC PublicKey                                                   |
|    0x7C    |   0x1    |                                        Version (For 3DS this is always 1)                                         |
|    0x7D    |   0x1    |                                                   CaCrlVersion                                                    |
|    0x7E    |   0x1    |                                                 SignerCrlVersion                                                  |
|    0x7F    |   0x10   |                     TitleKey (normal-key encrypted using one of the common keyYs; see below)                      |
|    0x8F    |   0x1    |                                                     Reserved                                                      |
|    0x90    |   0x8    |                                                     TicketID                                                      |
|    0x98    |   0x4    |                                                     ConsoleID                                                     |
|    0x9C    |   0x8    |                                                      TitleID                                                      |
|    0xA4    |   0x2    |                                                     Reserved                                                      |
|    0xA6    |   0x2    |                                               Ticket title version                                                |
|    0xA8    |   0x8    |                                                     Reserved                                                      |
|    0xB0    |   0x1    |                                                   License Type                                                    |
|    0xB1    |   0x1    | Index to the common [keyY](AES "wikilink") used for this ticket, usually 0x1 for retail system titles; see below. |
|    0xB2    |   0x2A   |                                                     Reserved                                                      |
|    0xDC    |   0x4    |                                                 eShop Account ID?                                                 |
|    0xE0    |   0x1    |                                                     Reserved                                                      |
|    0xE1    |   0x1    |                                                       Audit                                                       |
|    0xE2    |   0x42   |                                                     Reserved                                                      |
|   0x124    |   0x40   |                                                      Limits                                                       |
|   0x164    |    X     |                                                   Content Index                                                   |

- For v0 of the format, see
  [here](Talk:Ticket#ticket_format_0 "wikilink")

<!-- -->

- The Ticket Title Version is generally the same as the title version
  stored in the [Title Metadata](TMD "wikilink"). Although it doesn't
  have to match the TMD version to be valid.

<!-- -->

- The titlekey is decrypted by using the [AES](AES "wikilink") engine
  with the ticket common-key keyslot. The keyY is selected through an
  index (ticket offset 0xB1) into a plaintext array of 6 keys ("common
  keyYs") stored in the data section of Process9. AES-CBC mode is used
  where the IV is the big-endian titleID. Note that on a retail unit
  index0 is a retail keyY, while on a dev-unit index0 is the dev
  common-key which is a normal-key. (On retail for these keyYs, the
  hardware key-scrambler is used)

<!-- -->

- The titlekey is used to decrypt content downloaded from the CDN using
  128-bit AES-CBC with the content index (as big endian u16, padded with
  trailing zeroes) as the IV.

<!-- -->

- In demos, the first u32 in the "Limits" section is 0x4, then the
  second u32 is the max-playcount.

<!-- -->

- The Content Index of a ticket has its own size defined within itself,
  with seemingly a minimal of 20 bytes, the second u32 in big endian
  defines the full value of X.

## Certificate Chain

Tickets retrieved from CDN/SOAP have a
[certificate](Certificates "wikilink") chain appended at the end of the
file. There are two certificates in this chain:

| CERTIFICATE | SIGNATURE TYPE | RETAIL CERT NAME | DEBUG CERT NAME | DESCRIPTION                           |
|-------------|----------------|------------------|-----------------|---------------------------------------|
| Ticket      | RSA-2048       | XS0000000c       | XS00000009      | Used to verify the Ticket signature   |
| CA          | RSA-4096       | CA00000003       | CA00000004      | Used to verify the Ticket Certificate |

The CA certificate is issued by 'Root', the public key for which is
stored in NATIVE_FIRM.

## Some facts

- **CommonETicket** (for short, **cetk**) is the name given to tickets
  for titles which are not available on the [eShop](EShop "wikilink"),
  like [system titles](Title_list#ctr_system_titles "wikilink"). As the
  name suggests, they are not unique tickets, the same ticket is common
  to each 3ds which has installed that title. This is in contrast to
  tickets for eShop content, which are generated prior to initial
  download, and are unique to 3ds it was generated for.

<!-- -->

- **CETK** can be fetched through HTTP using the link to default update
  server, using the title's [TMD](TMD "wikilink") URL where "cetk" is
  used instead of "tmd" for the URL. The 3DS NIM module retrieves system
  tickets via SOAP request *GetSystemCommonETicket* instead of directly
  downloading the cetks with HTTPS. The cetks are also accessible via
  HTTP (even though the 3DS never accesses them like that).

[Category:File formats](Category:File_formats "wikilink")
