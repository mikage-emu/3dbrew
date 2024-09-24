+++
title = 'Amiibo'
+++

**Amiibo** are [NFC](NFC_Services "wikilink") figures made by Nintendo,
used in games in different forms (different in each game). It can be
used with the New3DS and the Old3DS with an [IR](IR_Services "wikilink")
[peripheral](NFC_adapter "wikilink").

# Tag information

- Model:
  [NTAG215](http://www.nxp.com/products/identification_and_security/smart_label_and_tag_ics/ntag/series/NTAG213_215_216.html)
- Manufacturer: NXP Semiconductor
- Page size: 4 bytes
- Page count: 135 pages (540 bytes)
- Data pages: 126 pages (504 bytes)

# Page layout

Excluding the auth-related configuration pages at the end, the structure
of the NFC pages is the following:

<table>
<thead>
<tr class="header">
<th><p>NFC page</p></th>
<th><p>Total pages</p></th>
<th><p>Raw byte offset in EEPROM</p></th>
<th><p>Total byte size</p></th>
<th><p>Writable</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>0x3</p></td>
<td><p>0x0</p></td>
<td><p>0xC</p></td>
<td style="background: red"><p>No</p></td>
<td><p>Standard NTAG215: 9-byte serial-number, "internal" u8 value, then
the two lock bytes which must match raw binary "0F E0".</p></td>
</tr>
<tr class="even">
<td><p>0x3</p></td>
<td><p>0x1</p></td>
<td><p>0xC</p></td>
<td><p>0x4</p></td>
<td style="background: red"><p>No</p></td>
<td><p>Standard NTAG215: "Capability Container (CC)". Must match raw
binary "F1 10 FF EE".</p></td>
</tr>
<tr class="odd">
<td><p>0x4</p></td>
<td><p>0x1</p></td>
<td><p>0x10</p></td>
<td><p>0x4</p></td>
<td style="background: green"><p>Yes</p></td>
<td><p>Last 3-bytes here are used with the following HMAC where the size
is 0x1DF-bytes. The u16 starting at byte1 is used for the first two
bytes in the 0x40-byte input buffer for Amiibo <a
href="../Process_Services_PXI" title="wikilink">crypto</a> init.</p>
<table>
<thead>
<tr class="header">
<th><p>Offset</p></th>
<th><p>Size</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x0</p></td>
<td><p>0x1</p></td>
<td><p>Magic (Always 0xA5)</p></td>
</tr>
<tr class="even">
<td><p>0x1</p></td>
<td><p>0x2</p></td>
<td><p>Incremented each time the Amiibo is written to.</p></td>
</tr>
<tr class="odd">
<td><p>0x3</p></td>
<td><p>0x1</p></td>
<td><p>Figure version (always 0x00)</p></td>
</tr>
</tbody>
</table></td>
</tr>
<tr class="even">
<td><p>0x5</p></td>
<td><p>0x8</p></td>
<td><p>0x14</p></td>
<td><p>0x20</p></td>
<td style="background: green"><p>Yes</p></td>
<td><p>The system crypts 0x1A0-bytes with some data from here, see
below.</p></td>
</tr>
<tr class="odd">
<td><p>0xD</p></td>
<td><p>0x8</p></td>
<td><p>0x34</p></td>
<td><p>0x20</p></td>
<td style="background: red"><p>No</p></td>
<td><p>SHA256-(HMAC?) hash. The first 0x18-bytes of this hash is
section3 in the encrypted buffer.</p></td>
</tr>
<tr class="even">
<td><p>0x15</p></td>
<td><p>0xB</p></td>
<td><p>0x54</p></td>
<td><p>0x2C</p></td>
<td style="background: red"><p>No</p></td>
<td><p>This is plaintext data, see below.</p></td>
</tr>
<tr class="odd">
<td><p>0x20</p></td>
<td><p>0x8</p></td>
<td><p>0x80</p></td>
<td><p>0x20</p></td>
<td style="background: green"><p>Yes</p></td>
<td><p>SHA256-HMAC hash over 0x1DF-bytes: first 3-bytes are from the
last 3-bytes of page[4], the rest is over the first 0x1DC-bytes of the
plaintext data.</p></td>
</tr>
<tr class="even">
<td><p>0x28</p></td>
<td><p>0x45</p></td>
<td><p>0xA0</p></td>
<td><p>0x114</p></td>
<td style="background: green"><p>Yes</p></td>
<td><p>This is section1 in the encrypted buffer.</p></td>
</tr>
<tr class="odd">
<td><p>0x6D</p></td>
<td><p>0x15</p></td>
<td><p>0x1B4</p></td>
<td><p>0x54</p></td>
<td style="background: green"><p>Yes</p></td>
<td><p>This is section2 in the encrypted buffer.</p></td>
</tr>
<tr class="even">
<td><p>0x82</p></td>
<td><p>0x1</p></td>
<td><p>0x208</p></td>
<td><p>0x4</p></td>
<td style="background: red"><p>No</p></td>
<td><p>Standard NTAG215: first 3-bytes are dynamic lock bytes. Must
match raw binary "01 00 0F".</p></td>
</tr>
<tr class="odd">
<td><p>0x83</p></td>
<td><p>0x1</p></td>
<td><p>0x20C</p></td>
<td><p>0x4</p></td>
<td style="background: red"><p>No</p></td>
<td><p>Standard NTAG215: CFG0. Must match raw binary "00 00 00
04".</p></td>
</tr>
<tr class="even">
<td><p>0x84</p></td>
<td><p>0x1</p></td>
<td><p>0x210</p></td>
<td><p>0x4</p></td>
<td style="background: red"><p>No</p></td>
<td><p>Standard NTAG215: CFG1. Must match raw binary "5F 00 00
00".</p></td>
</tr>
</tbody>
</table>

Specifications can be found on this image, which is a compilation of
screenshots made by scanning a Samus amiibo with the Android App "NFC
TagInfo":
<img src="../Amiibonfctaginfo.png" title="Amiibonfctaginfo.png" width="500"
alt="Amiibonfctaginfo.png" />

See here regarding the Amiibo
[encryption](Process_Services_PXI "wikilink").

# Data structures

## Structure of the data starting at page 0x15

| Offset | Size | Description                     |
|--------|------|---------------------------------|
| 0x0    | 0x8  | Amiibo Identification Block     |
| 0x8    | 0x4  | ?                               |
| 0xC    | 0x20 | Probably a SHA256-(HMAC?) hash. |

### Structure of Amiibo Identification Block

| Offset | Size | Description         | Notes                                                           |
|--------|------|---------------------|-----------------------------------------------------------------|
| 0x0    | 0x2  | Game & Character ID | First 10 bits are the Game ID and last 6 bits are Character ID. |
| 0x2    | 0x1  | Character variant   |                                                                 |
| 0x3    | 0x1  | Amiibo Figure Type  |                                                                 |
| 0x4    | 0x2  | Amiibo Model Number |                                                                 |
| 0x6    | 0x1  | Amiibo Series       |                                                                 |
| 0x7    | 0x1  | Format Version      | Always 0x02                                                     |

## Encrypted data buffer structure

| Encrypted buffer offset | Raw byte offset in NFC EEPROM | NFC page | Byte size | Notes                                                                                                               |
|-------------------------|-------------------------------|----------|-----------|---------------------------------------------------------------------------------------------------------------------|
| 0x0                     | 0x14                          | 0x5      | 0x20      |                                                                                                                     |
| 0x20                    | 0xA0                          | 0x28     | 0x114     |                                                                                                                     |
| 0x134                   | 0x1B4                         | 0x6D     | 0x54      |                                                                                                                     |
| 0x188                   | 0x34                          | 0xD      | 0x18      | This data is included in the crypto buffer, even though this data isn't actually encrypted(this is part of a hash). |

## Structure of the plaintext data

| Offset | Size | Description                                                                                                                                                                                                                                                                                                                                                                         |
|--------|------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0xB0 | Amiibo settings are stored within here.                                                                                                                                                                                                                                                                                                                                             |
| 0xB0   | 0xD8 | AppData, for the user-application specified in the above Amiibo settings. The data stored here is application-specific. The data stored here is normally all big-endian, even when the user-application is only for 3DS systems. Note that this data is initially uninitialized, and at least some of it will stay that way unless an application clears/initializes \*all\* of it. |
| 0x188  | 0x18 | Not used in "decrypted" form, since this isn't encrypted to begin with.                                                                                                                                                                                                                                                                                                             |

## Structure of Amiibo settings

| Offset | Size        | Description                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
|--------|-------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x1         | Flags. The low 4-bits here are copied to the struct used with [NFC:GetAmiiboSettings](NFC:GetAmiiboSettings "wikilink"). The below setup date is only loaded when bit4 and/or bit5 here are set, otherwise value 0 is used instead for the date. Bit4=1 indicates that the Amiibo was setup with [amiibo Settings](amiibo_Settings "wikilink"): [NFC:GetAmiiboSettings](NFC:GetAmiiboSettings "wikilink") will return an all-zero struct when this is not set. Bit5=1 indicates that the AppData was [initialized](NFC:InitializeWriteAppData "wikilink"). [NFC:InitializeWriteAppData](NFC:InitializeWriteAppData "wikilink") will return an error if this is value 1, when successful that command will then set this bit to value 1. |
| 0x1    | 0x1         | Country Code ID, [from](Config_Savegame "wikilink") the system which setup this amiibo. This is copied to the struct used with [NFC:GetAmiiboSettings](NFC:GetAmiiboSettings "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x2    | 0x2         | This big-endian u16 counter is incremented each time that the CRC32 at offset 0x8 gets updated by [NFC:InitializeWriteAppData](NFC:InitializeWriteAppData "wikilink"), due to that value not matching the calculated one. When this value is already 0xFFFF, this counter won't be updated anymore.                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| 0x4    | 0x2         | u16 big-endian date value, see below. This is the date for when the Amiibo was initially setup in [amiibo Settings](amiibo_Settings "wikilink"). This is also written by [NFC:InitializeWriteAppData](NFC:InitializeWriteAppData "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| 0x6    | 0x2         | u16 big-endian date value, see below. This is the date for when the Amiibo was last written to.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                         |
| 0x8    | 0x4         | Big-endian CRC32 value with initialval=~0, with the 8-byte output from [Cfg:GenHashConsoleUnique](Cfg:GenHashConsoleUnique "wikilink"). This is written by [NFC:InitializeWriteAppData](NFC:InitializeWriteAppData "wikilink"), when the current value doesn't match the calculated one.                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| 0xC    | 0x14(10\*2) | UTF-16BE Amiibo nickname.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| 0x20   | 0x60        | Owner [Mii](Mii_Maker "wikilink").                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |
| 0x80   | 0x8         | Big-endian application programID/titleID from the application which [initialized](NFC:InitializeWriteAppData "wikilink") the AppData, zero otherwise. This is only written, not compared with the user application titleID: doing the latter would break games' cross-platform compatibility with 3DS\<\>Wii U(Super Smash Bros 3DS/Wii U for example).                                                                                                                                                                                                                                                                                                                                                                                 |
| 0x88   | 0x2         | u16 big-endian. This value is incremented each time the Amiibo is written to. When this value is already 0xFFFF, this counter won't be updated anymore.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                 |
| 0x8A   | 0x4         | Big-endian u32 Amiibo AppID.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |
| 0x8E   | 0x2         | ?                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| 0x90   | 0x20        | Probably a SHA256-HMAC hash.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                            |

Format of the big-endian date values:

| Bit  | Description             |
|------|-------------------------|
| 0-4  | Day                     |
| 5-8  | Month                   |
| 9-15 | Year, relative to 2000. |

# 3DS read/write procedure

Note this is the procedure used by the console, but isn't the only way
of reading them.

## Read procedure

- GET_VERSION
- READ, startpage=0x03.
- PWD_AUTH. Key is based on UID.
- FAST_READ: startpage=0x00, endpage=0x3B
- FAST_READ: startpage=0x3C, endpage=0x77
- FAST_READ: startpage=0x78, endpage=0x86

Therefore, \*all\* pages from the Amiibo NFC tag are read, including the
configuration pages at the end.

## Write procedure

- GET_VERSION
- READ, startpage=0x03.
- PWD_AUTH. Key is based on UID.
- Multiple WRITE commands for writing to pages 0x04..0x0C. The first
  byte for page\[4\] is zero here.
- Multiple WRITE commands for writing to pages 0x20..0x81.
- Use the last 3 commands from the above reading section.
- WRITE: page=0x04, same data as before except first byte is 0xA5 this
  time.
- FAST_READ: startpage=0x04, endpage=0x04

# Games using Amiibo AppData

The following is a list of games which actually store game-specific data
on Amiibo, not \*just\* using Amiibo for checking character IDs:

| Name                                      | Available for (New)3DS | Available for Wii U | Amiibo AppID | AppData structure / link to info                                                         | AppData modification for exploitation notes.                                                                                                                                                                                           |
|-------------------------------------------|------------------------|---------------------|--------------|------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Super Smash Bros                          | Yes                    | Yes                 | 0x10110E00   | [1](https://github.com/yellows8/smash3ds-tools/wiki/SmashAmiiboAppData)                  | No crash ever triggered via AppData fuzzing.                                                                                                                                                                                           |
| Mario Party 10                            | No                     | Yes                 | ?            | N/A                                                                                      | N/A                                                                                                                                                                                                                                    |
| Animal Crossing: Happy Home Designer      | Yes                    | No                  | 0x0014F000   | N/A                                                                                      | The initial AppData handling doesn't appear to have any vuln(s), going by manual code-RE for update v2.0. Fuzzing wasn't attempted.                                                                                                    |
| Chibi-Robo!: Zip Lash                     | Yes                    | No                  | 0x00152600   | The entire AppData is read by the game, but only the first 0x10-bytes are actually used. | No crash ever triggered via AppData fuzzing.                                                                                                                                                                                           |
| Mario & Luigi: Paper Jam                  | Yes                    | No                  | 0x00132600   | Starts with the process-name("MILLION"). The rest seems to be bitmasks maybe?            | No crash ever triggered via AppData fuzzing, when viewing "character cards"(just unlocks various cards).                                                                                                                               |
| The Legend of Zelda: Twilight Princess HD | No                     | Yes                 | 0x1019C800   | Unknown.                                                                                 | No crash/hang ever occurred when using amiibo in-game for "Cave of Shadows". With the amiibo quick-start option at the title-screen, only errors ever occurred(<quick-start data not found> / <quick-start data is for another user>). |

# External links

- [Wii U Gamepad and Amiibo information on
  WiiUBrew](http://wiiubrew.org/wiki/Wii_U_GamePad).