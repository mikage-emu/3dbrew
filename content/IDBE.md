+++
title = 'IDBE'
+++

IDBE is Nintendo's title icon database. Entries contain title icon,
region, and name (in various languages). Similar to the
[SMDH](SMDH "wikilink"). All game titles are on the server (excluding
DSiWare?), including demos and updates.

## URLs

```
https://idbe-ctr.cdn.nintendo.net/icondata/`**`%02X`**`/`**`%016llX`**`.idbe
```

```
https://idbe-ctr.cdn.nintendo.net/icondata/`**`%02X`**`/`**`%016llX`**`-`**`%d`**`.idbe
```

**%02X** seems to always be 0x10 (?)

**%016llX** is the title id.

**%d** is an optional title version.

## Encryption

The icon database is encrypted with AES-128 CBC. All icons use the same
IV and one of 4 possible keys (as specified by the key index in the
header).

The IV/keys are hardcoded in the friend list applet. [They are also on
the WiiU](http://wiiubrew.org/wiki/Nn_idbe.rpl#Encryption).

## Data

|            |          |                  |
|:----------:|:--------:|:----------------:|
| **Offset** | **Size** | **Description**  |
|    0x0     |   0x1    | ? (usually zero) |
|    0x1     |   0x1    |    Key index     |
|    0x2     |  0x36D0  |  Encrypted data  |

### Encrypted Data

Icon data is uncompressed RGB565.

|                     |          |                                                                               |
|:-------------------:|:--------:|:-----------------------------------------------------------------------------:|
|     **Offset**      | **Size** |                                **Description**                                |
|         0x0         |   0x20   |                                  SHA256 hash                                  |
|        0x20         |   0x10   |                                       ?                                       |
|        0x30         |   0x4    |     [Region lockout](SMDH#region_lockout "wikilink") (u32 little endian)      |
|        0x34         |   0x1C   |                                       ?                                       |
| 0x50 + *i* \* 0x200 |  0x200   | [Title struct](SMDH#application_titles "wikilink") where *i* = language index |
|       0x2050        |  0x480   |                                24x24 Icon data                                |
|       0x24D0        |  0x1200  |                                48x48 Icon data                                |
