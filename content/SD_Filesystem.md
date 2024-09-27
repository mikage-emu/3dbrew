+++
title = 'SD Filesystem'
+++

## Overview

The 3DS uses an SD Card for general storage of game data, music, photos
and videos taken with the 3DS.

`sdmc`
`├── DCIM`
`├── Nintendo 3DS`
`│   ├── `<ID0>
`│   │   └── `<ID1>
`│   │       ├── `[`backups`](SD_Savedata_Backups "wikilink")
`│   │       ├── `[`dbs`](Title_Database "wikilink")
`│   │       ├── `[`extdata`](extdata "wikilink")
`│   │       ├── `[`title`](Title_Data_Structure "wikilink")
`│   │       └── `[`Nintendo DSiWare`](DSiWare_Exports "wikilink")
`│   └── `[`Private`](SD_Filesystem#Private "wikilink")
`└── `[`private`](SD_Filesystem#Other_Private_Data "wikilink")
`    └── Nintendo 3DS`
`        └── app`

- Everything stored under sdmc/Nintendo 3DS/<ID0>/<ID1> is encrypted by
  128 bit AES-CTR with console-unique [keyslots](AES "wikilink"). The
  keyslot is initialized by
  [nand/private/movable.sed](nand/private/movable.sed "wikilink").
- The crypto IV/CTR for each file is generated as follows: take the
  UTF-16 path relative to sdmc/Nintendo 3DS/<ID0>/<ID1> (the path it
  self begins with "/") and hash it with SHA-256, including the null
  null-terminator. Then calculate CTR as CTRbyte\[i\] = Hashbyte\[i\] ^
  Hashbyte\[16+i\] for i = 0 to 15.
- The base CTR is fixed for each file, therefore the CTR never changes
  after each write. Thus it is possible to obtain some cleartext by
  XORing one file(like newly created extdata) with a newer file, where
  the newer file overwrote zeros in the original file with non-zero
  data.
- Files stored under [nand/data/<ID0>](Flash_Filesystem "wikilink") also
  use the same keyslot, but it is only used for MACs.
- ID0 is the first 0x10-bytes from a SHA256
  [hash](nand/private/movable.sed "wikilink").
- ID1 is the scrambled SD card CID from the SD card which this directory
  was originally created on. To generate this directory name from the
  original CID, first the CID is rotated 8-bits to the left. Then, each
  u16 is moved as described in the below table:

| Input rotated CID u16 index | Output CID u16 index |
|-----------------------------|----------------------|
| 6                           | 0                    |
| 7                           | 1                    |
| 4                           | 2                    |
| 5                           | 3                    |
| 2                           | 4                    |
| 3                           | 5                    |
| 0                           | 6                    |
| 1                           | 7                    |

**DCIM** - Photos and Videos taken by the [Nintendo 3DS
Camera](Nintendo_3DS_Camera "wikilink") application are stored in this
directory. Internet Browser image downloads are stored here too.

Note: Playing/Recording (3D) Videos was introduced with update
[3.0.0-5](3.0.0-5 "wikilink"). The 3D videos are in .avi format and the
video frames use MJPG.

**backups** - This directory contains SD Title Savedata backups. For
more info, see [SD Savedata Backups](SD_Savedata_Backups "wikilink").

**dbs** - This contains database files relating to the titles installed
on the SD Card. These files are encrypted. For more info, see [Title
Database](Title_Database "wikilink")

**title** - Title data for titles installed to the SD Card are found
here. All data in this directory is encrypted with a console-unique
[keyslot](AES "wikilink"). For a list of SD Card titles see the [Title
list](Title_list "wikilink"). For more info on the title data structure
see [Title Data Structure](Title_Data_Structure "wikilink").

**Nintendo DSiWare** - DSiWare titles are
[exported](DSiWare_Exports "wikilink") here.

## Private

"Private" data is stored here as cleartext:

`/Nintendo 3DS/Private/`

<Title ID Low>

/

`00020400 - Nintendo 3DS Camera `
`00020500 - Nintendo 3DS Sound`

Under the camera private dir is [phtcache.bin](phtcache.bin "wikilink").
When you want to install and see pictures with 3DS, rename to 8
numbers.mpo and save it on /DCIM. Under the sound private dir is:
voice/XX/\*.m4a. Where XX is 01-10, with sound saved as .m4a.

## Other Private Data

There is also a directory called "private" on the root of the SD card
that contains data, in which would otherwise be completely different
from what the Nintendo 3DS normally uses, but known to the application
itself.

Some apps, such as Flipnote Studio 3D create a directory called
"private" on the root of the SD Card, it contains a Nintendo 3DS
directory inside it. Inside the app directory contains a directory with
the game code of the application (eg. "JKZP" for Flipnote Studio 3D),
then its corresponding data, as shown here:

`/private/Nintendo 3DS/app/`<Game Code>`/`

In this case of Flipnote Studio 3D, there are multiple files with an ID,
then ending with the .kwz extension. There is also a !!.lst file as
well.