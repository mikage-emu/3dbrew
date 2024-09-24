+++
title = 'CVer'
+++

This [CFA](NCCH#CFA "wikilink") contains the files listed below in the
RomFS.

### cup_list

| Offset | Size  | Description                   |
|--------|-------|-------------------------------|
| 0x0    | 0x800 | TitleID list of system titles |

Unused TitleID entries are all-zero, therefore the total number of
entries can be determined by finding the first all-zero entry. This list
does not contain \*all\* system titles, though most are contained in
this list.

This file was removed from the CDN CVer RomFS, starting with
[8.0.0-18](8.0.0-18 "wikilink").

### version.bin

This 8-byte file contains most of the data used for displaying the
system version in [System Settings](System_Settings "wikilink"). Format
of the system version:
"<major>.<minor>.<build>-[<revision><region>](NVer "wikilink")".

| Offset | Size | Description                                   |
|--------|------|-----------------------------------------------|
| 0x0    | 0x1  | Build version number                          |
| 0x1    | 0x1  | Minor version number                          |
| 0x2    | 0x1  | Major version number                          |
| 0x3    | 0x1  | Reserved                                      |
| 0x4    | 0x1  | ASCII character for the system version region |
| 0x5    | 0x3  | Reserved                                      |

### masterkey.bin

This 0x40-byte file was added with [7.2.0-17](7.2.0-17 "wikilink"). This
is used by [System
Settings](System_Settings#Parental_Controls_Reset "wikilink").

| Offset | Size | Description                                                                                                         |
|--------|------|---------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | First u8 is region, next u8 is version, the rest is all-zero. v7.2 USA = 0xa01, v8.0 USA = 0xb01, v8.0 EUR = 0xb02. |
| 0x4    | 0xC  | All-zero                                                                                                            |
| 0x10   | 0x10 | AES counter value                                                                                                   |
| 0x20   | 0x20 | Encrypted HMAC key, decrypted using AES-128-CTR using a key from mset .rodata and the above counter value.          |

### titleversion.txt

Added with [9.6.0-X](9.6.0-24 "wikilink"). With
[9.6.0-X](9.6.0-24 "wikilink"), this is a 5-byte file containing the
following: "9.6.7". This is the parsed version of the CVer TMD
title-version. After USA [9.6.0-X](9.6.0-24 "wikilink") for \<=v11.0,
this matches the version from CVer version.bin.