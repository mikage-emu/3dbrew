+++
title = 'System Transfer'
+++

**System Transfer** is functionality that was added with the [2.0.0-2](2.0.0-2 "wikilink") June 6/7 2011 system update, which allows you to transfer DSiWare, recorded audio from the Nintendo DSi Sound title, "internal memory" pictures, WFC configuration, from DSi to 3DS. On DSi this is done with the "Nintendo 3DS Transfer Tool" that is downloaded from DSi Shop, while on 3DS System Transfer is accessible in the [System Settings](System_Settings "wikilink"). System Transfer can also be used to transfer 3DSWare to other 3DS systems.

# DSi System Transfer

With the DSiWare DSi-\>3DS transfer, savegames are not transferred.
When transferring DSiWare, the DSi system transfer title will send a SOAP request to the DSi Shop server, this transfers the DSiWare license/ticket to the 3DS shop account. The DSi title will then delete the ticket from NAND. The 3DS will then download the ticket, tmd, and content immediately from shop/CDN.

The 3DS broadcasts beacons with Nintendo tag vendor 0009bf. This includes the 3DS user-name, and possibly some consoleID? The DSi authenticates/associates with some binary SSID. The rest uses cleartext ntr/twl multi-cast communications, a lot of keep-alive frames are sent.

The DSi will then send its country code, username, and serial number to the 3DS, 3DS will send its country-code/username/serial# to DSi as well.
The DSi sends a list of owned titles to the 3DS. The 3DS then seems to query the shop server via SOAP to check which titles may be transferred, it then replies to the DSi with a list of titles(of the titles which were sent to it) that can be transferred. When the user selects which title to transfer, DSi sends the banner of that title to the 3DS and many frames later the titleID.

When the DSi transfer tool and 3DS transfer tool startup, the DSi sends HTTPS SOAP requests to ecs.t.nintendowifi.net, ias.t.nintendowifi.net, and cas.t.nintendowifi.net. The 3DS sends HTTPS (mostly SOAP, unknown why the first one is used) requests to nus.c.nintendowifi.net, ecs.c.nintendowifi.net, and cas.c.nintendowifi.net. When entering the transfer DSiWare list menu, DSi requests from ecs\* and cas\*, 3DS does likewise. The 3DS system transfer will not allow you(likely server-side or so) to transfer etc at all unless you have the latest system update.

When DSi sends the title list, after the first 6 bytes of the 802.11 data payload, is the below header. Following the header is the list of titles.

| Offset | Length | Notes           |
|--------|--------|-----------------|
| 0x0    | 0x4    | Always zero?    |
| 0x0    | 0x4    | ?               |
| 0x8    | 0x4    | Total titles?   |
| 0xc    | 0x1    | Filler          |
| 0xd    | 0x48   | All 0xFF bytes. |

3DS title list header:

| Offset | Length | Notes |
|----|----|----|
| 0x0 | 0x4 | ? |
| 0x4 | 0x4 | Usually zero? |
| 0x8 | 0x4 | ? |
| 0xc | 0x4 | Total titles? |
| 0x10 | 0x4 | ? |
| 0x14 | 0x4 | ? |
| 0x18 | 0xf | 3DS serial number |
| 0x27 | 0x11 | Bytes alternates between 0xbd and 0xf7: first byte is 0xbd, second is 0xf7, third is 0xbd etc. |
| 0x28 | 0x8 | Unknown, ASCII 3DS ticket consoleID used with DSi Shop SOAPs for the DeviceId?(Unconfirmed) |
| 0x30 | 0x18 | Always zero? |

### Title record from DSi and 3DS

Total record size is 0x128 bytes.

| Offset | Length | Notes                                    |
|--------|--------|------------------------------------------|
| 0x0    | 0x8    | TitleID                                  |
| 0x8    | 0x8    | Little-endian ticketID                   |
| 0x10   | 0x4    | Usually zero?                            |
| 0x14   | 0x4    | Usually one?                             |
| 0x18   | 0x4    | Some ID?                                 |
| 0x1c   | 0x4    | Usually zero?                            |
| 0x20   | ?      | Sometimes the title name is stored here? |

# 3DS System Transfer

3DS System Transfer is now available since 3.0.0-5.
It seems to unlock out of region eShop on the source 3DS (tested on old, not tested on new).
See also [3DS System transfer](http://www.nintendo.com/consumer/systems/3ds/en_na/gi_index.jsp?menu=transfer&submenu=ctr-gi-apps-transfer-what-data)

## System Save Data / Shared Extdata Transfer

During a system transfer, the source system transfers raw ([DISA/DIFF](DISA_and_DIFF "wikilink")) [System Save Data](System_SaveData "wikilink") and possible [Shared NAND Extdata](Extdata#nand_shared_extdata "wikilink") images (AES-128-CTR encrypted) to the destination system.

It appears that both the save data for the [nim](NIM_Services "wikilink") sysmodule and the [Configuration Savegame](Config_Savegame "wikilink") are skipped during this process.

The source system first begins by using [FS:StartDeviceMoveAsSource](FS:StartDeviceMoveAsSource "wikilink") to generate a [Device Move Context](Filesystem_services#devicemovecontext "wikilink").

It then uses [FS:EnumerateSystemSaveData](FS:EnumerateSystemSaveData "wikilink") to obtain a list of system save data IDs.

The source system then creates the encrypted, raw system save data / extdata dumps using [System Savedata Transfer](Filesystem_services#systemsavedata "wikilink") / [Extdata Transfer / Shared Extdata Transfer](Filesystem_services_Shared_Extdata /_Shared_Extdata "wikilink").

The following encryption is used for these dumps:

\- AES [Keyslot 0x20](AES_Registers#keyslots "wikilink") is used for the key.

\- For the CTR, first, the random 16 bytes from the [Device Move Context](Filesystem_services#devicemovecontext "wikilink") are hashed with SHA256.

\- The SHA256 hash is updated using the UTF-16 path for the save data file (relative to `nand:/data/`<ID0>), beginning with a </code>/</code> (and including a two-byte NULL termination).

Therefore the path would be UTF-16 `/sysdata/<lowercase, 8 character hex system save id>/00000000` and two additional NULL bytes.

For Shared Extdata, the path would similarly be `/extdata/`<shared ext id low>`/`<shared ext id high>`/`<file path> and two additional NULL bytes.

\- The CTR is generated as follows: `ctr[i] = hash[i] ^ hash[i + 16]` for i from 0 to 16.

The entire [DISA](DISA_and_DIFF "wikilink") save image for each system save is encrypted.

On the destination system, [FS:StartDeviceMoveAsDestination](FS:StartDeviceMoveAsDestination "wikilink") is called using the [Device Move Context](Filesystem_services#devicemovecontext "wikilink") from the source console.

Similarly, [System Savedata Transfer](Filesystem_services#systemsavedata "wikilink") / [Extdata Transfer / Shared Extdata Transfer](Filesystem_services_Shared_Extdata /_Shared_Extdata "wikilink") is used to import the raw save images, though on the destination system, in the destination mode.

The encrypted save images are written directly to the destination system using the FS interface (and decrypted on the fly).

# See also

Nintendo of Japan System Transfer [page](http://www.nintendo.co.jp/3ds/support/transfer/index.html).
