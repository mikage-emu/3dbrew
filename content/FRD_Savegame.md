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
| 0x55   | 1             | [Server type](Friend_Services#server_types "wikilink") letter value |
| 0x56   | 1             | [Server type](Friend_Services#server_types "wikilink") number value |
| 0x57   | 1             | Padding                                                             |

## mydata

<table>
<thead>
<tr class="header">
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x00</td>
<td>4</td>
<td>File magic "FPMD" (Friends Preference My Data/Device)</td>
</tr>
<tr class="even">
<td>0x04</td>
<td>4</td>
<td>File magic number (0x20101021)</td>
</tr>
<tr class="odd">
<td>0x08</td>
<td>8</td>
<td>Padding</td>
</tr>
<tr class="even">
<td>0x10</td>
<td>4</td>
<td>My NC Principal ID</td>
</tr>
<tr class="odd">
<td>0x14</td>
<td>4</td>
<td>Unknown</td>
</tr>
<tr class="even">
<td>0x18</td>
<td>4</td>
<td><a
href="https://github.com/kinnay/NintendoClients/wiki/Friends-Protocol-(3DS)#nintendopresence-structure">Changed
bit flags</a></td>
</tr>
<tr class="odd">
<td>0x1C</td>
<td>1</td>
<td>Is public mode</td>
</tr>
<tr class="even">
<td>0x1D</td>
<td>1</td>
<td>Is show game mode</td>
</tr>
<tr class="odd">
<td>0x1E</td>
<td>1</td>
<td>Is show played game</td>
</tr>
<tr class="even">
<td>0x1F</td>
<td>1</td>
<td>Padding</td>
</tr>
<tr class="odd">
<td>0x20</td>
<td>0x10</td>
<td>GameKey of my favorite game:</p>
<p><code> u64 title_id</code><br />
<code> u32 title_version</code><br />
<code> u32 unknown</code></td>
</tr>
<tr class="even">
<td>0x30</td>
<td>16 * 2</td>
<td>UTF16 string of personal message</td>
</tr>
<tr class="odd">
<td>0x50</td>
<td>8</td>
<td>Unknown</td>
</tr>
<tr class="even">
<td>0x58</td>
<td>8</td>
<td><code> u8 region</code><br />
<code> u8 country</code><br />
<code> u8 area</code><br />
<code> u8 language</code><br />
<code> u8 platform = 2</code><br />
<code> u8 padding[3]</code></td>
</tr>
<tr class="odd">
<td>0x60</td>
<td>8</td>
<td>LocalFriendCodeSeed u64</td>
</tr>
<tr class="even">
<td>0x68</td>
<td>(12 + 1) * 2</td>
<td>UTF16 string of MAC address of the console (only the
digits)</td>
</tr>
<tr class="odd">
<td>0x82</td>
<td>(15 + 1) * 2</td>
<td>UTF16 string of console serial number without the checksum
digit</td>
</tr>
<tr class="even">
<td>0xA2</td>
<td>(10 + 1) * 2</td>
<td>UTF16 string of Display name</td>
</tr>
<tr class="odd">
<td>0xBB</td>
<td>0x60</td>
<td>Unaligned <a {{% href "../Mii" %}} title="wikilink">Mii
data</a></td>
</tr>
<tr class="even">
<td>0x11B</td>
<td>5</td>
<td>Padding (0x120)</td>
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
| 0x10   | ? \* 0x100 | [Friend entries](FRD_Savegame#friend_entry "wikilink")... |

### Friend entry

<table>
<thead>
<tr class="header">
<th>Offset</th>
<th>Size</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>0x00</td>
<td>0x10</td>
<td>FriendKey:</p>
<p><code> u32 principal_id</code><br />
<code> u32 padding</code><br />
<code> u64 friend_code</code></td>
</tr>
<tr class="even">
<td>0x10</td>
<td>0x4</td>
<td>Unknown</td>
</tr>
<tr class="odd">
<td>0x14</td>
<td>1</td>
<td>Friend relationship</td>
</tr>
<tr class="even">
<td>0x15</td>
<td>8</td>
<td><code> u8 region</code><br />
<code> u8 country</code><br />
<code> u8 area</code><br />
<code> u8 language</code><br />
<code> u8 platform = 2</code><br />
<code> u8 padding[3]</code></td>
</tr>
<tr class="odd">
<td>0x1D</td>
<td>3</td>
<td>Padding</td>
</tr>
<tr class="even">
<td>0x20</td>
<td>0x10</td>
<td>GameKey of friend favorite game:</p>
<p><code> u64 title_id</code><br />
<code> u32 title_version</code><br />
<code> u32 unknown</code></td>
</tr>
<tr class="odd">
<td>0x30</td>
<td>16 * 2</td>
<td>UTF16 string of personal message</td>
</tr>
<tr class="even">
<td>0x50</td>
<td>0x8</td>
<td>Unknown</td>
</tr>
<tr class="odd">
<td>0x58</td>
<td>8</td>
<td>Message update <a
href="https://github.com/kinnay/NintendoClients/wiki/NEX-Common-Types#datetime">timestamp</a></td>
</tr>
<tr class="even">
<td>0x60</td>
<td>8</td>
<td>Mii update <a
href="https://github.com/kinnay/NintendoClients/wiki/NEX-Common-Types#datetime">timestamp</a></td>
</tr>
<tr class="odd">
<td>0x68</td>
<td>8</td>
<td>Last online <a
href="https://github.com/kinnay/NintendoClients/wiki/NEX-Common-Types#datetime">timestamp</a></td>
</tr>
<tr class="even">
<td>0x70</td>
<td>0x60</td>
<td><a {{% href "../Mii" %}} title="wikilink">Mii data</a></td>
</tr>
<tr class="odd">
<td>0xD0</td>
<td>(10 + 1) * 2</td>
<td>UTF16 string of display name</td>
</tr>
<tr class="even">
<td>0xE8</td>
<td>8</td>
<td>Friendship? <a
href="https://github.com/kinnay/NintendoClients/wiki/NEX-Common-Types#datetime">timestamp</a></td>
</tr>
<tr class="odd">
<td>0xF0</td>
<td>8</td>
<td>Same as 0x58?</td>
</tr>
<tr class="even">
<td>0xF8</td>
<td>8</td>
<td>Same as 0x60?</td>
</tr>
</tbody>
</table>
