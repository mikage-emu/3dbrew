+++
title = 'Mii Maker'
+++

**Mii Maker** lets you create [Miis](Mii "wikilink"), and is the
successor of the Wii's Mii Channel.

It can transfer Miis over [local wireless](NWM_Services "wikilink") from
other systems running Mii Maker (3DS/Wii U), or receive, but not send,
from Mii Channel.

## Wii Mii Channel transfer protocol

The Wii beacons are similar to the usual multi-cart NDS beacons, except:
beacon_type is zero, and payload size is 0x14. The payload data is just
the Wii UTF-16 nickname, with some extra unused zero data. The usual
multi-cast NDS protocol is used for sending the 3DS nick to the Wii.
After many keep-alive frames, it eventually sends a bunch of frames,
each containing the whole Mii. There's a 6-byte header, followed by [Mii
data](http://wiibrew.org/wiki/Wiimote/Mii_Data). At the end of these
frames like most NDS frames is the 0200 byte marker.

## Mii QR Code format

3DS Mii QR is a standard 57x57 pixel Level 10 High ECC QR code with
'Mii' logo in center (refer to [Denso-Wave
Inc](http://www.denso-wave.com/qrcode) web site for QR Code format
specifications). It contains 0x70-bytes of binary data. 3DS seems to
have a fully implemented QR-code decoder, as it can interpret such Mii
binary data being encoded even in the smallest possible for that data
size Level 6 Low ECC QR code.

The data itself is encrypted with AES-CCM, xorpads can be determined
from known plaintext here. The Mii Maker application uses the
[NS](NS "wikilink") APT Wrap/Unwrap commands to encrypt/decrypt this Mii
data. For the NS [Unwrap](APT:Unwrap "wikilink") command, the Mii Maker
application uses nonceoffset=12, noncesize=10, and
inputbuffer-size=0x60. Note that the actual nonce size is 8 bytes due to
Wrap/Unwrap implementation, and the nonce data should be moved 12 bytes
afterwards after decryption. The rest of the data at 0x8-0x5F is
encrypted, and should be split into two parts after decryption, with the
nonce data in the middle. (See [Wrap](APT:Wrap "wikilink") and
[Unwrap](APT:Unwrap "wikilink") for more information)

<table>
<thead>
<tr class="header">
<th><p>Offset</p></th>
<th><p>Length</p></th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>0x4</p></td>
<td><p>Mii ID (big-endian 32-bit unsigned integer)<br />
The most significant 3 bits determine whether the Mii is Special,
Foreign, or Normal <a
href="https://web.archive.org/web/20071011001718/http://www.davidhawley.co.uk/special-miis-gold-pants-and-creating.aspx">1</a><br />
time_offset = (mii_id &amp; 0x0FFFFFFF) * 2;<br />
time_offset is the time the Mii was created, represented as the number
of seconds since 01/01/2010 00:00:00</p></td>
</tr>
<tr class="even">
<td><p>0x4</p></td>
<td><p>0x4</p></td>
<td><p>High 4 octets of MAC address <a
href="http://www.adminsub.net/mac-address-finder/nintendo">2</a></p></td>
</tr>
<tr class="odd">
<td><p>0x8</p></td>
<td><p>0x4</p></td>
<td><p><a href="../Mii#Mii_ID" title="wikilink">Mii ID</a>, the encrypted
data begins here.</p></td>
</tr>
<tr class="even">
<td><p>0xC</p></td>
<td><p>0x8</p></td>
<td><p>System ID (this ID is produced by the output from <a
href="../CfgGenHashConsoleUnique">GenHashConsoleUnique(0x0)</a>)</p></td>
</tr>
<tr class="odd">
<td><p>0x14</p></td>
<td><p>0x2</p></td>
<td><p>Low 2 octets of MAC address</p></td>
</tr>
<tr class="even">
<td><p>0x16</p></td>
<td><p>0x2</p></td>
<td><p>padding (0000)</p></td>
</tr>
<tr class="odd">
<td><p>0x18</p></td>
<td><p>0x2</p></td>
<td><p>Bit-mapped: Birthday (4bit-day,5bit-month), Sex, Shirt,
??</p></td>
</tr>
<tr class="even">
<td><p>0x1A</p></td>
<td><p>0x14</p></td>
<td><p>UTF-16 Mii Name (10 chars max)</p></td>
</tr>
<tr class="odd">
<td><p>0x2E</p></td>
<td><p>0x2</p></td>
<td><p>width &amp; height</p></td>
</tr>
<tr class="even">
<td><p>0x30</p></td>
<td><p>0x1</p></td>
<td><p>bit 0: disable sharing<br />
bit 1-4: face shape<br />
bit 5-7: skin color</p></td>
</tr>
<tr class="odd">
<td><p>0x31</p></td>
<td><p>0x1</p></td>
<td><p>bit 0-3: wrinkles<br />
bit 4-7: makeup</p></td>
</tr>
<tr class="even">
<td><p>0x32</p></td>
<td><p>0x1</p></td>
<td><p>hair style</p></td>
</tr>
<tr class="odd">
<td><p>0x33</p></td>
<td><p>0x1</p></td>
<td><p>bit 0-2: hair color<br />
bit 3: flip hair</p></td>
</tr>
<tr class="even">
<td><p>0x34</p></td>
<td><p>0x4</p></td>
<td><p>unknown</p></td>
</tr>
<tr class="odd">
<td><p>0x38</p></td>
<td><p>0x1</p></td>
<td><p>bit 0-4: eyebrow style<br />
bit 5-7: eyebrow color</p></td>
</tr>
<tr class="even">
<td><p>0x39</p></td>
<td><p>0x1</p></td>
<td><p>bit 0-3: eyebrow scale<br />
bit 4-6: eyebrow yscale</p></td>
</tr>
<tr class="odd">
<td><p>0x3A</p></td>
<td><p>0x2</p></td>
<td><p>note that the bytes are swapped over (little-endian layout)<br />
bit 0-3: eyebrow rotation<br />
bit 5-8: eyebrow x spacing<br />
bit 9-13: eyebrow y position</p></td>
</tr>
<tr class="even">
<td><p>0x3C</p></td>
<td><p>0x1</p></td>
<td><p>Allow Copying</p></td>
</tr>
<tr class="odd">
<td><p>0x3D</p></td>
<td><p>0x3</p></td>
<td><p>unknown</p></td>
</tr>
<tr class="even">
<td><p>0x40</p></td>
<td><p>0x1</p></td>
<td><p>Mii Sharing Value</p></td>
</tr>
<tr class="odd">
<td><p>0x41</p></td>
<td><p>0x7</p></td>
<td><p>unknown</p></td>
</tr>
<tr class="even">
<td><p>0x48</p></td>
<td><p>0x14</p></td>
<td><p>UTF-16 Author Name (10 chars max)</p></td>
</tr>
<tr class="odd">
<td><p>0x5C</p></td>
<td><p>0x2</p></td>
<td><p>unknown</p></td>
</tr>
<tr class="even">
<td><p>0x5E</p></td>
<td><p>0x2</p></td>
<td><p>CRC16 over the previous 0x5E</p></td>
</tr>
<tr class="odd">
<td><p>0x60</p></td>
<td><p>0x10</p></td>
<td><p>AES-CCM MAC</p></td>
</tr>
</tbody>
</table>

- QR codes made from the same 3DS for the same Mii are use the same
  AES-CCM nonce (you can recreate the xorpad by xoring with known values
  from this table).

## Mii Database

Created, received, or even met-in-multiplayer Miis are saved in
[CFL_DB.dat](Mii "wikilink").

## Savedata

### editSaveData.bin

| Offset | Length  |                                                                                                                            |
|--------|---------|----------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4     | "TIDE" header (EDIT byteswapped)                                                                                           |
| 0x4    | 0x4     | zero                                                                                                                       |
| 0xC    | 0x4 (?) | 01000000 (constant?)                                                                                                       |
| 0x100  | 0x4     | Number of scanned Special Mii QRs                                                                                          |
| 0x104  | \-      | Some data identifying each scanned Special Mii QRs, for the purpose of not making them scannable again. 8 or 12 byte each? |
| 0x2904 | 0x4     | Checksum?                                                                                                                  |

## ExtData

The ExtData [File System](Extdata#Filesystem "wikilink") for Mii Maker
is as follows:

```
root
├── icon
├── boss
└── user
    └── ExBanner
        └── COMMON.bin
```

| File       | Details                                                                             | Size          | FW Introduced                 | Plaintext                                                                                      |
|------------|-------------------------------------------------------------------------------------|---------------|-------------------------------|------------------------------------------------------------------------------------------------|
| icon       | Duplicate from Application ExeFS. Always image 00000002.                            | 0x36c0 Bytes  | [1.0.0-0](1.0.0-0 "wikilink") | [Download](https://dl.dropboxusercontent.com/u/60710927/CTR/Sample/MiiMakerExtdata/icon)       |
| COMMON.bin | [Extended Banner](Extended_Banner "wikilink") for Home Menu. Always image 00000003. | 0x20224 Bytes | [1.0.0-0](1.0.0-0 "wikilink") | [Download](https://dl.dropboxusercontent.com/u/60710927/CTR/Sample/MiiMakerExtdata/COMMON.bin) |
