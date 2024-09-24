+++
title = 'Title Database'
+++

These files contain data relating to install/usage/management of
installed 3DS titles. The database files are located at:

- nand/dbs
- sdmc/Nintendo 3DS/<ID0>/<ID1>/dbs

ID0 is the first 0x10-bytes from a SHA256
[hash](nand/private/movable.sed "wikilink"). The installation of [SD
Card](SD_Filesystem "wikilink") titles was introduced in the
[2.0.0-2](2.0.0-2 "wikilink") update and the SD dbs files are encrypted
by [the general SD filesystem encryption
rule](SD_Filesystem "wikilink"). These files are [DIFF
containers](DISA_and_DIFF "wikilink"). These DIFF files do not use
external IVFC level 4, so all database data is duplicated in the
container. In this page only the inner content of the container is
described.

These files are only created on SD (via
[AM](Application_Manager_Services "wikilink")) if they don't exist when
the [eShop](eShop "wikilink") application is starting up, during network
init etc (prior to showing the "system update required" dialog).

These files are stored under this directory:

| Stored on SD card | Stored in CTR-NAND | Filename  | [CTR-9DB0](DISA_and_DIFF#CTR-9DB0 "wikilink") ID | Description                                                                                                                                                                                                         |
|-------------------|--------------------|-----------|--------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| No                | Yes                | ticket.db | 0x0                                              | This contains the installed tickets (NAND and SD).                                                                                                                                                                  |
| No                | Yes                | certs.db  | 0x1                                              | This contains the certificate chain used to verify TMDs and other certificates.                                                                                                                                     |
| Yes               | Yes                | title.db  | 0x2                                              | Title database, this contains entries for all installed titles (TWL & CTR) on the 3DS (Each database is responsible for titles installed on its medium).                                                            |
| Yes               | Yes                | import.db | 0x3                                              | This is an Import Database, it contains entries for titles (or versions of titles) not yet installed, ready for transferring to the title.db. (Automatic Update uses this, so completing the update takes seconds.) |
| No                | Yes                | tmp_t.db  | 0x4                                              | This is the temporary Title database containing one entry for the currently installed [Download Play](Download_Play "wikilink") Child.                                                                              |
| No                | Yes                | tmp_i.db  | 0x5                                              | Similar to import.db, except it's used in conjunction with tmp_t.db, for installing [Download Play](Download_Play "wikilink") Children.                                                                             |

The inner content of the container consists of a pre-header with size of
0x80 identifying the Database Type, followed by a BDRI container. The
offsets in the BDRI header are usually relative to the offset to the
start of the BDRI header (0x80 in the file)

## Pre Header

| Start | Length | Description                       |
|-------|--------|-----------------------------------|
| 0x00  | 8      | Database Type "Magic" (see below) |
| 0x08  | 0x78   | Reserved                          |

For ticket.db different pre header is used:

| Start | Length | Description                              |
|-------|--------|------------------------------------------|
| 0x00  | 4      | Database Type "Magic" (see below)        |
| 0x04  | 0x04   | Unknown (always 0x00000001 ?)            |
| 0x08  | 0x04   | Unknown                                  |
| 0x0C  | 0x04   | Unknown (0x30 smaller than previous one) |

### Database Magic

| Database Type      | Magic   |
|--------------------|---------|
| CTR-NAND ticket.db | TICK    |
| CTR-NAND import.db | NANDIDB |
| CTR-NAND title.db  | NANDTDB |
| CTR-NAND tmp_i.db  | TEMPIDB |
| CTR-NAND tmp_t.db  | TEMPIDB |
| SD Card import.db  | TEMPTDB |
| SD Card title.db   | TEMPTDB |

## BDRI

This is a variant of [FAT filesystem](Inner_FAT "wikilink"). It consists
one "root" directory and multiple "files". Each "file" is one title info
entry described below.

## Title Info Entry

An entry contains information taken from both the application NCCH
file(s) and TMD.

| Start | Length | Description                                       |
|-------|--------|---------------------------------------------------|
| 0x0   | 8      | Title Size                                        |
| 0x8   | 4      | Title Type(usually 0x40)                          |
| 0xC   | 4      | Title Version                                     |
| 0x10  | 4      | Flags_0                                           |
| 0x14  | 4      | TMD Content ID                                    |
| 0x18  | 4      | CMD Content ID                                    |
| 0x1c  | 4      | Flags_1                                           |
| 0x20  | 4      | ExtdataID low (zero if title doesn't use Extdata) |
| 0x24  | 4      | Reserved                                          |
| 0x28  | 8      | Flags_2                                           |
| 0x30  | 0x10   | Product Code                                      |
| 0x40  | 0x10   | Reserved                                          |
| 0x50  | 0x4    | Unknown                                           |
| 0x54  | 0x2c   | Reserved                                          |

For ticket.db title info, there is a header indicates ticket count (as a
Title ID can have more than one ticket installed). Then each entry
contains the size, followed by the actual ticket data.

| Start | Length                     | Description         |
|-------|----------------------------|---------------------|
| 0x0   | 4                          | Amount of tickets X |
| 0x4   | X \* (size of tickets + 4) | Ticket entries      |

Header

| Start | Length | Description                                                         |
|-------|--------|---------------------------------------------------------------------|
| 0x0   | 4      | Ticket data size X (often 0x350 but some DLC tickets may be larger) |
| 0x4   | X      | [Ticket](Ticket "wikilink") data                                    |

Ticket entry

#### Flags_0

| Index | Description       |
|-------|-------------------|
| 0     | Electronic Manual |
| 1     | ?                 |
| 2     | ?                 |
| 3     | ?                 |

#### Flags_1

| Index | Description  |
|-------|--------------|
| 0     | SD Save Data |
| 1     | ?            |
| 2     | ?            |
| 3     | ?            |

#### Flags_2

| Index | Description                                                         |
|-------|---------------------------------------------------------------------|
| 0     | DSiWare Related (Visibility on Home Menu/Export Flag?)              |
| 1     | ?                                                                   |
| 2     | ?                                                                   |
| 3     | ?                                                                   |
| 4     | Found with DSiWare Titles and titles with an 'Application' Title ID |
| 5     | DSiWare Related (Visibility on Home Menu/Export Flag?)              |
| 6     | ?                                                                   |
| 7     | ?                                                                   |

**NOTES:**

It is important to note the database doesn't contain a hash of the
[.cmd](Title_Data_Structure "wikilink"). So if a user has more than one
valid set of [application data](Title_Data_Structure "wikilink") for a
given .cmd Content ID they can be manually interchanged without issue.
Though renaming a .cmd file to match the Content ID which the title.db
is expecting will result in an error, as the CTR for the per-console
encryption layer changes depending on the file path, and the MAC of the
.cmd is probably generated with the .cmd Content ID in mind.

These NAND/SD /dbs images seem to be loaded by the ARM9 while
NATIVE_FIRM is booting.

Removing ticket.db from a New-3DS with signature checks disabled will
not result in an unbootable system, however all icons except Slot-1 will
disappear from Home. Applets can however still be used. Recovery can be
accomplished via [hardmod](Hardware "wikilink") or
[arm9loaderhax](arm9loaderhax "wikilink") plus a known good backup of
the file (or the whole partition or disk); Gamecard exploits were not
tested, and Browserhax did not work.
