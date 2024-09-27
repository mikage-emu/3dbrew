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
<th>Offset</th>
<th>Length</th>
<th></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x0</td>
<td>0x4</td>
<td>Mii ID (big-endian 32-bit unsigned integer)<br />
The most significant 3 bits determine whether the Mii is Special,
Foreign, or Normal <a
href="https://web.archive.org/web/20071011001718/http://www.davidhawley.co.uk/special-miis-gold-pants-and-creating.aspx">1</a><br />
time_offset = (mii_id &amp; 0x0FFFFFFF) * 2;<br />
time_offset is the time the Mii was created, represented as the number
of seconds since 01/01/2010 00:00:00</td>
</tr>
<tr class="even">
<td>0x4</td>
<td>0x4</td>
<td>High 4 octets of MAC address <a
href="http://www.adminsub.net/mac-address-finder/nintendo">2</a></td>
</tr>
<tr class="odd">
<td>0x8</td>
<td>0x4</td>
<td><a href="../Mii#mii_id" title="wikilink">Mii ID</a>, the encrypted
data begins here.</td>
</tr>
<tr class="even">
<td>0xC</td>
<td>0x8</td>
<td>System ID (this ID is produced by the output from <a
href="../CfgGenHashConsoleUnique">GenHashConsoleUnique(0x0)</a>)</td>
</tr>
<tr class="odd">
<td>0x14</td>
<td>0x2</td>
<td>Low 2 octets of MAC address</td>
</tr>
<tr class="even">
<td>0x16</td>
<td>0x2</td>
<td>padding (0000)</td>
</tr>
<tr class="odd">
<td>0x18</td>
<td>0x2</td>
<td>Bit-mapped: Birthday (4bit-day,5bit-month), Sex, Shirt,
??</td>
</tr>
<tr class="even">
<td>0x1A</td>
<td>0x14</td>
<td>UTF-16 Mii Name (10 chars max)</td>
</tr>
<tr class="odd">
<td>0x2E</td>
<td>0x2</td>
<td>width &amp; height</td>
</tr>
<tr class="even">
<td>0x30</td>
<td>0x1</td>
<td>bit 0: disable sharing<br />
bit 1-4: face shape<br />
bit 5-7: skin color</td>
</tr>
<tr class="odd">
<td>0x31</td>
<td>0x1</td>
<td>bit 0-3: wrinkles<br />
bit 4-7: makeup</td>
</tr>
<tr class="even">
<td>0x32</td>
<td>0x1</td>
<td>hair style</td>
</tr>
<tr class="odd">
<td>0x33</td>
<td>0x1</td>
<td>bit 0-2: hair color<br />
bit 3: flip hair</td>
</tr>
<tr class="even">
<td>0x34</td>
<td>0x4</td>
<td>unknown</td>
</tr>
<tr class="odd">
<td>0x38</td>
<td>0x1</td>
<td>bit 0-4: eyebrow style<br />
bit 5-7: eyebrow color</td>
</tr>
<tr class="even">
<td>0x39</td>
<td>0x1</td>
<td>bit 0-3: eyebrow scale<br />
bit 4-6: eyebrow yscale</td>
</tr>
<tr class="odd">
<td>0x3A</td>
<td>0x2</td>
<td>note that the bytes are swapped over (little-endian layout)<br />
bit 0-3: eyebrow rotation<br />
bit 5-8: eyebrow x spacing<br />
bit 9-13: eyebrow y position</td>
</tr>
<tr class="even">
<td>0x3C</td>
<td>0x1</td>
<td>Allow Copying</td>
</tr>
<tr class="odd">
<td>0x3D</td>
<td>0x3</td>
<td>unknown</td>
</tr>
<tr class="even">
<td>0x40</td>
<td>0x1</td>
<td>Mii Sharing Value</td>
</tr>
<tr class="odd">
<td>0x41</td>
<td>0x7</td>
<td>unknown</td>
</tr>
<tr class="even">
<td>0x48</td>
<td>0x14</td>
<td>UTF-16 Author Name (10 chars max)</td>
</tr>
<tr class="odd">
<td>0x5C</td>
<td>0x2</td>
<td>unknown</td>
</tr>
<tr class="even">
<td>0x5E</td>
<td>0x2</td>
<td>CRC16 over the previous 0x5E</td>
</tr>
<tr class="odd">
<td>0x60</td>
<td>0x10</td>
<td>AES-CCM MAC</td>
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

The ExtData [File System](Extdata#filesystem "wikilink") for Mii Maker
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
