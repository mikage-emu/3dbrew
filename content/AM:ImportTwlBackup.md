+++
title = 'AM:ImportTwlBackup'
+++

# Request

| Index Word | Description                                     |
|------------|-------------------------------------------------|
| 0          | Header code \[0x001C0084\]                      |
| 1          | Buffer Size (must be \>= 0x20000)               |
| 2          | u8, Operation                                   |
| 3          | 0x10                                            |
| 4          | [FSFILE](Filesystem_services "wikilink") Handle |
| 5          | (Buffer Size \<\< 4) \| 0xC                     |
| 6          | Work buffer pointer                             |

# Response

| Index Word | Description |
|------------|-------------|
| 0          | Header code |
| 1          | Result code |

# Operation

| Value      | Description                      |
|------------|----------------------------------|
| 0-1        | Invalid, same as values 4 and 7. |
| 2 and 5    | ?                                |
| 3 and 6    | ?                                |
| 4 and \>=7 | No importing is done here.       |

# Description

AM module uses
[AMPXI:DecryptDSiWareData](Application_Manager_Services_PXI "wikilink")
for decrypting each DSiWare section. After decrypting a section via that
command, AM module calculates a hash over the decrypted payload data for
[AMPXI:ValidateDSiWareSectionMAC](AMPXI:ValidateDSiWareSectionMAC "wikilink").
The footer hash for this section is then verified by calculating a hash
over the cleartext data as well.

After AM module validates the header, AM module then uses
[AMPXI:ValidateDSiWareMovableSedHash](AMPXI:ValidateDSiWareMovableSedHash "wikilink").
The footer ECDSA verification is handled by
[AMPXI:VerifyDSiWareFooter](AMPXI:VerifyDSiWareFooter "wikilink").
