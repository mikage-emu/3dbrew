1.  REDIRECT [NCCH#CXI](NCCH#CXI "wikilink")

The following text tries to document the structure of the CTR Executable
Image (CXI) format.

## Overview

The CXI format is a specialization of an NCCH container. Generally the
CXI will contain executable code, which runs on a single ARM11 core. It
can communicate through SVC calls with the other ARM11 core running the
'system' program code. For reasons of clarity, the ARM11 cores will
sometimes be called the 'appcore' and 'syscore' respectively.

The CXI format is structured in the following order:

- first a NCCH header,
- followed by an extended header,
- followed by a plain binary region,
- followed by an embedded executable filesystem
  ([ExeFS](ExeFS "wikilink")) - (contains ARM11 code, Home menu icn/bnr
  and logo),
- and finally followed by a read-only filesystem
  ([RomFS](RomFS "wikilink")) - (Used for external file storage).

There are specializations of NCCH containers which are not executable,
but are used in conjunction with CXI NCCH files. For instance the DLP
Child Container and the Home Menu App Manual. (There is a system update
NCCH which follows this format, but is used by the 3DS rather than the
Application NCCH, and only works when embedded in the
[CCI](CCI "wikilink") format because the nVer is kept in the header of
retail [CCI](CCI "wikilink") files instead of the application NCCH)

Non-Executable NCCH files are structured in the following order:

- first a NCCH header,
- followed by a read-only filesystem ([RomFS](RomFS "wikilink"))

Non-Executable NCCH file examples(Includes Decrypted
[RomFS](RomFS "wikilink")):

[DLPChildContainer](http://depositfiles.com/files/d8ej64571)
[Manual](http://depositfiles.com/files/en9g37b0j)

The extended header contains additional information regarding access
control. The plain binary region is an area specifically stored in
plaintext, mostly containing SDK library strings for identification.

The extended header, the [ExeFS](ExeFS "wikilink") and the RomFS are
encrypted using 128-bit AES CTR.

By default encrypted regions are compressed with an LZ77 variant, then
encrypted. The spec allows for both unencrypted and uncompressed regions
to exist. System titles expect a fixed system key.

## NCCH Header

| OFFSET | SIZE  | DESCRIPTION                                                                                                                                          |
|--------|-------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x000  | 0x100 | RSA-2048 signature of the NCCH header, using SHA-256.                                                                                                |
| 0x100  | 4     | Magic ID, always 'NCCH'                                                                                                                              |
| 0x104  | 4     | Content size, in media units (1 media unit = 0x200 bytes)                                                                                            |
| 0x108  | 8     | Partition ID                                                                                                                                         |
| 0x110  | 2     | Maker code                                                                                                                                           |
| 0x112  | 2     | Version                                                                                                                                              |
| 0x114  | 4     | Reserved                                                                                                                                             |
| 0x118  | 8     | Program ID                                                                                                                                           |
| 0x120  | 1     | Temp flag                                                                                                                                            |
| 0x121  | 0x2F  | Reserved                                                                                                                                             |
| 0x150  | 0x10  | Product code                                                                                                                                         |
| 0x160  | 0x20  | Extended header hash                                                                                                                                 |
| 0x180  | 4     | Extended header size                                                                                                                                 |
| 0x184  | 4     | Reserved                                                                                                                                             |
| 0x188  | 8     | Flags: byte\[5\]-byte\[7\] indicate content type ( system update, application, manual, ... ) size of media unit ( 512\*2^byte\[6\] ) and encryption. |
| 0x190  | 4     | Plain region offset, in media units                                                                                                                  |
| 0x194  | 4     | Plain region size, in media units                                                                                                                    |
| 0x198  | 8     | Reserved                                                                                                                                             |
| 0x1A0  | 4     | ExeFS offset, in media units                                                                                                                         |
| 0x1A4  | 4     | ExeFS size, in media units                                                                                                                           |
| 0x1A8  | 4     | ExeFS hash region size, in media units                                                                                                               |
| 0x1AC  | 4     | Reserved                                                                                                                                             |
| 0x1B0  | 4     | RomFS offset, in media units                                                                                                                         |
| 0x1B4  | 4     | RomFS size, in media units                                                                                                                           |
| 0x1B8  | 4     | RomFS hash region size, in media units                                                                                                               |
| 0x1BC  | 4     | Reserved                                                                                                                                             |
| 0x1C0  | 0x20  | ExeFS superblock hash, over the cleartext ExeFS                                                                                                      |
| 0x1E0  | 0x20  | RomFS superblock hash                                                                                                                                |

### NCCH header example for Lego Starwars III

`Signature:              720FF8F83F2A1E998322A026D1434165`
`                        ED19642ABC1CB2722135AA202BEAD60A`
`                        80BCD21C768C597B8268FEF2C64EA710`
`                        4C9BA5E12CFFBD1D0C619F4EF7B42CA7`
`                        DD8482CB4EB26720AD66CDA57ABCBCFB`
`                        D63268A6E2896A59B3B744E39E45B88A`
`                        ABB4C0980ACC6210818DCE6DAC838A10`
`                        95D0F66B352474D4B3DA4B333F49912D`
`                        29AF7EA58BC8C890B18C70B7D540A9FB`
`                        EBE24A5312055617D3353B28C3EB1D17`
`                        61021BEFF6AD22C384835B40BD44DFAD`
`                        981F6350F9458B17BCB5F768C92ABC93`
`                        2BCE9888855A8998F4CDE40C9543514A`
`                        C57B84EB75A680E7C742632614620D1D`
`                        A253284DF3DC01091EB3800C36FD62EE`
`                        BA15340F1FD498FAB67C0302E9CDA397`
`Magic:                  NCCH`
`Content size:           0x1cfef400`
`Partition id:           0004000000038c00`
`Maker code:             3436 ("46")`
`Version:                0002`
`Program id:             0004000000038c00`
`Temp flag:              00`
`Product code:           CTR-P-ALGP`
`Extended header hash:   0C27E3C1DE7B2AE2D3114F32A4EEBF46`
`                        9AFD0CF352C11D4984C2A9F1D2144C63`
`Extended header size:   00000400`
`Flags:                  0000030100000000`
`Plain region offset:    0x00004a00`
`Plain region size:      0x00000200`
`ExeFS offset:           0x00004c00`
`ExeFS size:             0x00143800`
`ExeFS hash region size: 0x00000200`
`RomFS offset:           0x00148400`
`RomFS size:             0x1ceab000`
`RomFS hash region size: 0x00000200`
`ExeFS Superblock Hash:  130C042615F647C4C63225EA9E67F8A2`
`                        7B15246B88FBC7A927257B84977B787B`
`RomFS Superblock Hash:  A65BEE1060BB6A6821BBCEC600035B7E`
`                        64FB6EACA7F0960CFB1F5A37087728F7`
`Note: Offsets and sizes in media units have been converted to byte sizes.`

### Plain region example for Lego Starwars III

`0004a00: 5b 53 44 4b 2b 4e 49 4e 54 45 4e 44 4f 3a 43 54  [SDK+NINTENDO:CT    [SDK+NINTENDO:CTR_SDK-0_14_23_200_none]`
`0004a10: 52 5f 53 44 4b 2d 30 5f 31 34 5f 32 33 5f 32 30  R_SDK-0_14_23_20`
`0004a20: 30 5f 6e 6f 6e 65 5d 00 5b 53 44 4b 2b 4e 49 4e  0_none].[SDK+NIN    [SDK+NINTENDO:Firmware-02_27]`
`0004a30: 54 45 4e 44 4f 3a 46 69 72 6d 77 61 72 65 2d 30  TENDO:Firmware-0`
`0004a40: 32 5f 32 37 5d 00 5b 53 44 4b 2b 4d 6f 62 69 63  2_27].[SDK+Mobic    [SDK+Mobiclip:Deblocker_1_0_2]`
`0004a50: 6c 69 70 3a 44 65 62 6c 6f 63 6b 65 72 5f 31 5f  lip:Deblocker_1_`
`0004a60: 30 5f 32 5d 00 5b 53 44 4b 2b 4d 6f 62 69 63 6c  0_2].[SDK+Mobicl    [SDK+Mobiclip:ImaAdpcmDec_1_0_0]`
`0004a70: 69 70 3a 49 6d 61 41 64 70 63 6d 44 65 63 5f 31  ip:ImaAdpcmDec_1`
`0004a80: 5f 30 5f 30 5d 00 5b 53 44 4b 2b 4d 6f 62 69 63  _0_0].[SDK+Mobic    [SDK+Mobiclip:MobiclipDec_1_0_1]`
`0004a90: 6c 69 70 3a 4d 6f 62 69 63 6c 69 70 44 65 63 5f  lip:MobiclipDec_`
`0004aa0: 31 5f 30 5f 31 5d 00 5b 53 44 4b 2b 4d 6f 62 69  1_0_1].[SDK+Mobi    [SDK+Mobiclip:MoflexDemuxer_1_0_2]`
`0004ab0: 63 6c 69 70 3a 4d 6f 66 6c 65 78 44 65 6d 75 78  clip:MoflexDemux`
`0004ac0: 65 72 5f 31 5f 30 5f 32 5d 00 00 00 00 00 00 00  er_1_0_2].......`
`0004ad0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`
`0004ae0: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00  ................`

A tool for parsing this format is available
[here](http://github.com/3dshax/ctr/tree/master/ctrtool)

### Example dependency list from the extended header

`00850 41 50 54 3A 55 00 00 00 24 68 69 6F 46 49 4F 00 `[`APT:U`](APT:U)`...$hioFIO.`
`00860 24 68 6F 73 74 69 6F 30 24 68 6F 73 74 69 6F 31 $hostio0$hostio1`
`00870 61 63 3A 75 00 00 00 00 62 6F 73 73 3A 55 00 00 ac:u....boss:U..`
`00880 63 61 6D 3A 75 00 00 00 63 65 63 64 3A 75 00 00 cam:u...cecd:u..`
`00890 63 66 67 3A 75 00 00 00 64 6C 70 3A 46 4B 43 4C cfg:u...dlp:FKCL`
`008A0 64 6C 70 3A 53 52 56 52 64 73 70 3A 3A 44 53 50 dlp:SRVRdsp::DSP`
`008B0 66 72 64 3A 75 00 00 00 66 73 3A 55 53 45 52 00 frd:u...fs:USER.`
`008C0 67 73 70 3A 3A 47 70 75 68 69 64 3A 55 53 45 52 gsp::Gpuhid:USER`
`008D0 68 74 74 70 3A 43 00 00 6D 69 63 3A 75 00 00 00 `[`http:C`](http:C)`..mic:u...`
`008E0 6E 64 6D 3A 75 00 00 00 6E 65 77 73 3A 75 00 00 ndm:u...news:u..`
`008F0 6E 77 6D 3A 3A 55 44 53 70 74 6D 3A 75 00 00 00 nwm::UDSptm:u...`
`00900 70 78 69 3A 64 65 76 00 73 6F 63 3A 55 00 00 00 pxi:dev.soc:U...`
`00910 73 73 6C 3A 43 00 00 00 79 32 72 3A 75 00 00 00 ssl:C...y2r:u...`
`00920 69 72 3A 55 53 45 52 00 6C 64 72 3A 72 6F 00 00 ir:USER.ldr:ro..`
`00930 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................`
`00940 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................`
`00950 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................`
`00960 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................`
`... ...`
`009D0 FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF FF                 `
`009E0 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 ................`
`009F0 00 03 00 00 00 00 00 00 00 00 00 00 00 00 00 02 . ............. `
`00A00 5B 53 44 4B 2B 4E 49 4E 54 45 4E 44 4F 3A 43 54 [SDK+NINTENDO:CT`

### Extended Header

**NOTE: AFTER DECRYPTION**

| OFFSET | SIZE | DESCRIPTION                                            |
|--------|------|--------------------------------------------------------|
| 0x399  | 1    | Memory type (00 = Base, 01 = Application, 02 = System) |

[Category:File formats](Category:File_formats "wikilink")