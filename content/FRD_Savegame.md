+++
title = 'FRD Savegame'
+++

This page describes the contents of the
[friend](Friend_Services "wikilink") sysmodule savegame. Except for the
config file, all of the data is stored inside a folder that represents
the local account ID of the account. For example: /1/account stores the
data of the main account.

## config

| Offset | Size | Description                                   |
|--------|------|-----------------------------------------------|
| 0x00   | 4    | File magic "FPCF" (Friends Preference Config) |
| 0x04   | 4    | File magic number (0x20101021)                |
| 0x08   | 8    | Padding                                       |
| 0x10   | 4    | Current Local Account ID                      |

## account

| Offset | Size          | Description                                                         |
|--------|---------------|---------------------------------------------------------------------|
| 0x00   | 4             | File magic "FPAC" (Friends Preference Account Config)               |
| 0x04   | 4             | File magic number (0x20101021)                                      |
| 0x08   | 8             | Padding                                                             |
| 0x10   | 4             | Local Account ID                                                    |
| 0x14   | 4             | PrincipalID                                                         |
| 0x18   | 8             | LocalFriendCode                                                     |
| 0x20   | (16 + 1) \* 2 | NEX Password                                                        |
| 0x42   | (8 + 1) \* 2  | PrincipalID HMAC (Used for logging into NASC server)                |
| 0x54   | 1             | NASC Environment (0: Prod, 1: Test, 2: Dev)                         |
| 0x55   | 1             | [Server type](Friend_Services#Server_Types "wikilink") letter value |
| 0x56   | 1             | [Server type](Friend_Services#Server_Types "wikilink") number value |
| 0x57   | 1             | Padding                                                             |

## mydata

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
<td><p>0x00</p></td>
<td><p>4</p></td>
<td><p>File magic "FPMD" (Friends Preference My Data/Device)</p></td>
</tr>
<tr class="even">
<td><p>0x04</p></td>
<td><p>4</p></td>
<td><p>File magic number (0x20101021)</p></td>
</tr>
<tr class="odd">
<td><p>0x08</p></td>
<td><p>8</p></td>
<td><p>Padding</p></td>
</tr>
<tr class="even">
<td><p>0x10</p></td>
<td><p>4</p></td>
<td><p>My NC Principal ID</p></td>
</tr>
<tr class="odd">
<td><p>0x14</p></td>
<td><p>4</p></td>
<td><p>Unknown</p></td>
</tr>
<tr class="even">
<td><p>0x18</p></td>
<td><p>4</p></td>
<td><p><a
href="https://github.com/kinnay/NintendoClients/wiki/Friends-Protocol-(3DS)#nintendopresence-structure">Changed
bit flags</a></p></td>
</tr>
<tr class="odd">
<td><p>0x1C</p></td>
<td><p>1</p></td>
<td><p>Is public mode</p></td>
</tr>
<tr class="even">
<td><p>0x1D</p></td>
<td><p>1</p></td>
<td><p>Is show game mode</p></td>
</tr>
<tr class="odd">
<td><p>0x1E</p></td>
<td><p>1</p></td>
<td><p>Is show played game</p></td>
</tr>
<tr class="even">
<td><p>0x1F</p></td>
<td><p>1</p></td>
<td><p>Padding</p></td>
</tr>
<tr class="odd">
<td><p>0x20</p></td>
<td><p>0x10</p></td>
<td><p>GameKey of my favorite game:</p>
<p><code> u64 title_id</code><br />
<code> u32 title_version</code><br />
<code> u32 unknown</code></p></td>
</tr>
<tr class="even">
<td><p>0x30</p></td>
<td><p>16 * 2</p></td>
<td><p>UTF16 string of personal message</p></td>
</tr>
<tr class="odd">
<td><p>0x50</p></td>
<td><p>8</p></td>
<td><p>Unknown</p></td>
</tr>
<tr class="even">
<td><p>0x58</p></td>
<td><p>8</p></td>
<td><p><code> u8 region</code><br />
<code> u8 country</code><br />
<code> u8 area</code><br />
<code> u8 language</code><br />
<code> u8 platform = 2</code><br />
<code> u8 padding[3]</code></p></td>
</tr>
<tr class="odd">
<td><p>0x60</p></td>
<td><p>8</p></td>
<td><p>LocalFriendCodeSeed u64</p></td>
</tr>
<tr class="even">
<td><p>0x68</p></td>
<td><p>(12 + 1) * 2</p></td>
<td><p>UTF16 string of MAC address of the console (only the
digits)</p></td>
</tr>
<tr class="odd">
<td><p>0x82</p></td>
<td><p>(15 + 1) * 2</p></td>
<td><p>UTF16 string of console serial number without the checksum
digit</p></td>
</tr>
<tr class="even">
<td><p>0xA2</p></td>
<td><p>(10 + 1) * 2</p></td>
<td><p>UTF16 string of Display name</p></td>
</tr>
<tr class="odd">
<td><p>0xBB</p></td>
<td><p>0x60</p></td>
<td><p>Unaligned <a href="../Mii#Mii_format" title="wikilink">Mii
data</a></p></td>
</tr>
<tr class="even">
<td><p>0x11B</p></td>
<td><p>5</p></td>
<td><p>Padding (0x120)</p></td>
</tr>
</tbody>
</table>

## friendlist

### Header

| Offset | Size       | Description                                               |
|--------|------------|-----------------------------------------------------------|
| 0x00   | 4          | File magic "FPFL" (Friends Preference Friend List)        |
| 0x04   | 4          | File magic number (0x20101021)                            |
| 0x08   | 8          | Padding                                                   |
| 0x10   | ? \* 0x100 | [Friend entries](FRD_Savegame#Friend_entry "wikilink")... |

### Friend entry

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
<td><p>0x00</p></td>
<td><p>0x10</p></td>
<td><p>FriendKey:</p>
<p><code> u32 principal_id</code><br />
<code> u32 padding</code><br />
<code> u64 friend_code</code></p></td>
</tr>
<tr class="even">
<td><p>0x10</p></td>
<td><p>0x4</p></td>
<td><p>Unknown</p></td>
</tr>
<tr class="odd">
<td><p>0x14</p></td>
<td><p>1</p></td>
<td><p>Friend relationship</p></td>
</tr>
<tr class="even">
<td><p>0x15</p></td>
<td><p>8</p></td>
<td><p><code> u8 region</code><br />
<code> u8 country</code><br />
<code> u8 area</code><br />
<code> u8 language</code><br />
<code> u8 platform = 2</code><br />
<code> u8 padding[3]</code></p></td>
</tr>
<tr class="odd">
<td><p>0x1D</p></td>
<td><p>3</p></td>
<td><p>Padding</p></td>
</tr>
<tr class="even">
<td><p>0x20</p></td>
<td><p>0x10</p></td>
<td><p>GameKey of friend favorite game:</p>
<p><code> u64 title_id</code><br />
<code> u32 title_version</code><br />
<code> u32 unknown</code></p></td>
</tr>
<tr class="odd">
<td><p>0x30</p></td>
<td><p>16 * 2</p></td>
<td><p>UTF16 string of personal message</p></td>
</tr>
<tr class="even">
<td><p>0x50</p></td>
<td><p>0x8</p></td>
<td><p>Unknown</p></td>
</tr>
<tr class="odd">
<td><p>0x58</p></td>
<td><p>8</p></td>
<td><p>Message update <a
href="https://github.com/kinnay/NintendoClients/wiki/NEX-Common-Types#datetime">timestamp</a></p></td>
</tr>
<tr class="even">
<td><p>0x60</p></td>
<td><p>8</p></td>
<td><p>Mii update <a
href="https://github.com/kinnay/NintendoClients/wiki/NEX-Common-Types#datetime">timestamp</a></p></td>
</tr>
<tr class="odd">
<td><p>0x68</p></td>
<td><p>8</p></td>
<td><p>Last online <a
href="https://github.com/kinnay/NintendoClients/wiki/NEX-Common-Types#datetime">timestamp</a></p></td>
</tr>
<tr class="even">
<td><p>0x70</p></td>
<td><p>0x60</p></td>
<td><p><a href="../Mii#Mii_format" title="wikilink">Mii data</a></p></td>
</tr>
<tr class="odd">
<td><p>0xD0</p></td>
<td><p>(10 + 1) * 2</p></td>
<td><p>UTF16 string of display name</p></td>
</tr>
<tr class="even">
<td><p>0xE8</p></td>
<td><p>8</p></td>
<td><p>Friendship? <a
href="https://github.com/kinnay/NintendoClients/wiki/NEX-Common-Types#datetime">timestamp</a></p></td>
</tr>
<tr class="odd">
<td><p>0xF0</p></td>
<td><p>8</p></td>
<td><p>Same as 0x58?</p></td>
</tr>
<tr class="even">
<td><p>0xF8</p></td>
<td><p>8</p></td>
<td><p>Same as 0x60?</p></td>
</tr>
</tbody>
</table>
