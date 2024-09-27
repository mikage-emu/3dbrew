+++
title = 'NS CFA'
+++

This pages describes the content of the
[CFA](NCCH#cfa "wikilink")(titleID 0004001B00010702) RomFS used by NS.

## key.bin

Unknown, originally the filesize for this was 12-bytes, with the
[6.0.0-11](6.0.0-11 "wikilink") title-version this is now 48-bytes. This
is used when launching applications.

## value.bin

Unknown, originally the filesize for this was 8-bytes, with the
[6.0.0-11](6.0.0-11 "wikilink") title-version this is now 32-bytes. This
is used when launching applications.

## ctr_backup_black_list

This file added with [6.0.0-11](6.0.0-11 "wikilink") contains the
uniqueID blacklist for [SD Savedata
Backups](SD_Savedata_Backups "wikilink").

| Offset | Size            | Description                                                                                                |
|--------|-----------------|------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4             | Total entries, this is value 93 for the [6.0.0-11](6.0.0-11 "wikilink") title-version.                     |
| 0x4    | 0xC             | All-zero                                                                                                   |
| 0x10   | Totalentries\*4 | Entries, each entry is a word in the following format: 0x100000 \| [title_UniqueID](Title_list "wikilink") |

## qtm_black_list

This file was added with title version v4096, for
[9.0.0-20](9.0.0-20 "wikilink")/[8.1.0-0_New3DS](8.1.0-0_New3DS "wikilink").
Going by the filename, this is probably used for disabling
[QTM](QTM_Services "wikilink")(New3DS head-tracking) for certain titles.
This is used when launching applications, on New3DS.
