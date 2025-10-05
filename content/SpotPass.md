+++
title = 'SpotPass'
categories = ["Nintendo Software"]
+++

**SpotPass** is a Nintendo 3DS feature that allows the 3DS to automatically download content, notifications, and software when it's in standby mode.(SpotPass may download/upload some content while the 3DS is in "active" mode, but \*only\* if the currently active app uses SpotPass) SpotPass can upload content as well. Software downloaded with SpotPass is stored on SD card.

SpotPass Internet communications are mostly HTTPS transfers.

In System Settings, you can disable SpotPass automatic title downloading, but it states that important software will still downloaded.(This only disables downloading of free titles via SpotPass)

'nasc.nintendowifi.net' confirmed usages:(not SpotPass related)

- Friends List applet requires this server to be 'Online' (most likely the reason for regular requests to this server)
- Required for initialization of [eShop](eShop "wikilink"), (for first time eShop users). Not required for using eShop after first use.

In some cases the BOSS module will add the following URL parameter to HTTPS requests, when connected to a [Nintendo Zone](Nintendo_Zone "wikilink") AP: "ap=<NZoneApNum>" or when using a specific [system model](Cfg:GetSystemModel "wikilink"): "tm=<SystemModelNumber>". The Old 3DS and Old 3DS XL don't set this value.

## policylist

Every time the system connects to the wifi AP, the BOSS ("Background online storage service" = SpotPass) module itself will download the cleartext xml policylist: "<https://nppl.c.app.nintendowifi.net/p01/policylist/3/><countrycode>". This policylist contains a list of SpotPass tasks for certain titles. This policylist can control whether the specified tasks are processed at all.

As of the policylist updated 2017-11-08, this stops the `OlvNotf` (Miiverse notification sync) task for `000400300000bc00`, `000400300000bd00`, `000400300000be00` for all regions and `basho0` for the [Home Menu](Home_Menu "wikilink"). Japan also has the `9ER_NTD` task blocked for いつの間にテレビ (`0004000000034700`).

## User Agent

The default user-agent used for SpotPass HTTPS requests (including the policylist) has the following format:

<user agent codename>`-`<user agent version>`/<printed hex u64 `[`LocalFriendCodeSeed`](CfgS:GetLocalFriendCodeSeed "wikilink")`>-<printed hex u64 `[`Friend`](FRDU:GetMyFriendKey "wikilink")` `[`Code`](FRDU:PrincipalIdToFriendCode "wikilink")`>/<text `[`system`](CVer "wikilink")` `[`version`](NVer "wikilink")`>/`<CTRSDK version of sysmodule>`/<`[`system model number`](Cfg:GetSystemModel "wikilink")`>`

The codename can be set to either `PBOS` (Production BOSS?) or `DBOS` (Development BOSS?) depending if the console is a [retail](Configuration_Memory#unitinfo "wikilink") unit. As of system version 11.17, the user agent version is hardcoded to 8.0 and the CTRSDK version is set to 62452 (0xF3F4).

No user-agent is used for plaintext HTTP requests with SpotPass.

## Titles Spotpass usage

| Title | Description |
|----|----|
| [Home Menu](Home_Menu "wikilink") | Home Menu uses SpotPass for system notifications, and for uploading data from home-menu shared extdata. |
| [System Settings](System_Settings "wikilink") | System Settings uses SpotPass for uploading data, with this URL: <https://npul.c.app.nintendowifi.net/p01/recv/><RegionID>/sendcfg This RegionID is separate from the RegionIDs home-menu uses. |
| ? | Unknown log data is uploaded with this URL: <https://logus-p.est.c.app.nintendowifi.net/LogServer_us_live/Upload> |

## Automatic System Update Download

See [Automatic System Update Download](Automatic_System_Update_Download "wikilink").

## BOSS Sysmodule Savegame

See [BOSS Savegame](BOSS_Savegame "wikilink")

## Content Container

SpotPass content must use this container to encrypt the payload and sign it, for content downloads. The cleartext content is stored in [extdata](extdata "wikilink"). The format of these headers is big-endian.

### BOSS Header

| Offset | Length | Description                                               |
|--------|--------|-----------------------------------------------------------|
| 0x0    | 0x4    | Magic Number "boss"                                       |
| 0x4    | 0x4    | Magic Number 0x10001                                      |
| 0x8    | 0x4    | Big-endian filesize                                       |
| 0xC    | 0x8    | u64 serial number (?)                                     |
| 0x14   | 0x2    | Must always be 0x1                                        |
| 0x16   | 0x2    | Padding                                                   |
| 0x18   | 0x2    | Content header hash type, always 0x2 for SHA-256          |
| 0x1A   | 0x2    | Content header RSA size, always 0x2 for RSA-2048 (X\<\<7) |
| 0x1C   | 0xC    | First 12 bytes of the Initialization Vector (IV)          |

Data following the BOSS header is encrypted with AES-CTR. The AES key that is used is stored in [keyslot 0x38](AES_Registers#keyslots "wikilink"). The first 12 bytes of the IV are from offset 0x1C of the header, while the last 32-bit integer of the IV in big-endian is 0x1. The IV from the header is random per file, and an unique random IV is used each time the content is updated. The cleartext data begins with the content header.

The 64-bit number at 0xC may be a serial number which is increased every time someone requested to sign and create a boss container for a file. The 3DS sees the downloaded file as new if this number is different from the previous download (Doesn't matter if the number is bigger or smaller).

The boss system module v13314 begins at address 0x0010eb98 with the function for parsing the BOSS header.

### Content Header

| Offset | Length | Description |
|----|----|----|
| 0x0 | 0x10 | ? |
| 0x10 | 0x2 | Number of payload contents (Payload Content Header + Payload) |
| 0x12 | 0x20 | SHA-256 hash |
| 0x32 | 0x100 | RSA-2048 signature over the above hash |

The first 0x10-bytes are all-zero except the first byte. If the 7th bit (0x80) is not set, the arrived flag will only be marked if the session for the target program ID was made with a privileged session. Otherwise, the arrived flag will always be marked.

The 16-bit value at 0x10 tells how many payload contents follow after this the content header. For example there can be a downloaded file for a game followed by a message for the news system module.

The hash at offset 0x12 hashes the 0x12-byte data at offset 0x0 followed by a zero u16. The RSA signature is signed by Nintendo. Following this header is the actual content payload, which is written to a cleartext file under the [extdata](extdata "wikilink") /boss directory.

### Payload Content Header

| Offset | Length | Description |
|----|----|----|
| 0x0 | 0x8 | Program ID |
| 0x8 | 0x4 | Usually zero? |
| 0xC | 0x4 | Content datatype, used for filtering with [BOSSU:GetNsDataIdList](BOSSU:GetNsDataIdList "wikilink").
Usually 0x10001? (observed 0x20001 in eShop strings) |
| 0x10 | 0x4 | Size of the payload after this header |
| 0x14 | 0x4 | [NsDataId](BOSS_Services "wikilink"), used for generating the extdata filepath. |
| 0x18 | 0x4 | Probably some version field for the payload |
| 0x1C | 0x20 | SHA-256 hash |
| 0x3C | 0x100 | RSA-2048 signature over the previous SHA-256 hash |

This signature is signed by Nintendo with the same key-pair as the content header.

The hash at offset 0x1C hashes the 0x1C-byte data at offset 0x0 followed by a zero u16, followed by all of the remaining cleartext data following this header (the actual content data).

The file name of the downloaded boss data is Ascii85 encoded with the following data:

| Offset | Length | Description      |
|--------|--------|------------------|
| 0x0    | 0x5    | NS Data ID       |
| 0x5    | 0x5    | Version          |
| 0xA    | 0x5    | Content datatype |
| 0xF    | 0x1    | New flag         |

The downloaded boss data is written in the following format to extdata. First an extdata header in the following format:

| Offset | Length | Description |
|----|----|----|
| 0x0 | 0x1 | Size of header including this field. Always 0x18 |
| 0x1 | 0x3 | Padding |
| 0x4 | 0x4 | [Additional info](BOSSU:GetNsDataAdditionalInfo "wikilink") |
| 0x8 | 0x4 | Unknown |
| 0xC | 0x8 | [Last update](BOSSU:GetNsDataLastUpdate "wikilink") in number of seconds since the year 2000 |
| 0x14 | 0x4 | Padding |

Followed by the Payload Content Header without the hash and signature (first 0x1C bytes) and the actual payload.

## Tools

- [BossDecryptor3DS](http://wiiucodes.ddnss.eu/tools/BossDecryptor3DS.zip) Decrypts an encrypted boss container
- [BossEncryptor3DS](http://wiiucodes.ddnss.eu/tools/BossEncryptor3DS.zip) Builds and encrypts a file into a boss container

[Category:Nintendo Software](Category:Nintendo_Software "wikilink")
