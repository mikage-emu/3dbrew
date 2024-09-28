+++
title = 'Extdata'
+++

This page describes the format and encryption of extdata, "extra data"
stored on SD card and NAND, at:

- `nand/data/`<ID>`/extdata/`<ExtdataID-High>
- `sdmc/Nintendo 3DS/`<ID0>`/`<ID1>`/extdata/`<ExtdataID-High>

ExtdataID-High is always 00000000 for SD, and always 00048000 for NAND.
Regular apps can only mount SD extdata using the same extdataID which is
stored in the CXI exheader. Therefore, regular apps which have the
exheader extdataID set to zero can't use extdata. This restriction
doesn't apply for shared extdata with extdataID high bitmask 0x48000
stored on NAND. System apps with a certain access right can mount
arbitrary extdata. All NAND extdata is shared extdata, while all SD
extdata is normal extdata.

All data in this page is little-endian. All "unused / padding" fields
can contain uninitialized data unless otherwise specified.

# Format

To avoid confusion, the terms **device directory / file** and **virtual
directory / file** are used with the following meanings:

- **Device directory / file** are the real directory / file stored on SD
  / NAND that can be seen under path `nand/data/`<ID>`/extdata/` or
  `sdmc/Nintendo 3DS/`<ID0>`/`<ID1>`/extdata/`.
- **Virtual directory / file** are directory / file stored inside
  extdata virtual file system, which can be seen by applications in the
  mounted extdata archives.

An extdata consists of several device directories and files, which forms
a file system consisting of multiple virtual directories and files.

An extdata with ID `ExtdataId` has the following device files:

- `.../extdata/`<ExtdataID-High>`/`<ExtdataId-Low>`/Quota.dat`
  (optional)
- `.../extdata/`<ExtdataID-High>`/`<ExtdataId-Low>`/`<SubDirID>`/`<SubFileID>

Note:

- All device files are [DIFF containers](DISA_and_DIFF "wikilink").
  **All format description below is about the inner content of the
  containers**. Please unwrap these files first according to the DIFF
  format description before reading them using the extdata format
  description below.
- `Quota.dat` is only observed existing for NAND shared extdata.
- <SubDirID> and <SubFileID> are 8-digit hex strings.
- Device file with `SubDirID = SubFileID = 00000000` doesn't exist.
  Other ID combinations can exists.
- Device file with `SubDirID = 00000000` and `SubFileID = 00000001` is
  the VSXE metadata file and must exist.
- Other files, besides `Quota.dat` and `00000000/00000001`, are normal
  sub files, are these device files one-to-one correspond to virtual
  files. They contain raw virtual file data in the DIFF inner content.
- `SubDirID = 00000000` is usually the only one device directory that
  can be seen. See [\#Device Directory
  Capacity](#Device_Directory_Capacity "wikilink") for more information.

## Quota File

The inner data of `Quota.dat` is 0x48 bytes with the following format.
The file seems to limit the extdata total size.

| Offset | Length | Description                                                                                                                                    |
|--------|--------|------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00   | 4      | Magic "QUOT"                                                                                                                                   |
| 0x04   | 4      | Magic 0x30000                                                                                                                                  |
| 0x08   | 4      | 0x1000, block size                                                                                                                             |
| 0x0C   | 4      | Always 126. Probably device directory capacity. See the [\#Device Directory Capacity](#device_directory_capacity "wikilink") more information. |
| 0x10   | 4      | Always 0?                                                                                                                                      |
| 0x14   | 4      | Max number of blocks                                                                                                                           |
| 0x18   | 4      | Always 0?                                                                                                                                      |
| 0x1C   | 4      | Free blocks remained                                                                                                                           |
| 0x20   | 4      | Always 0?                                                                                                                                      |
| 0x24   | 4      | Always 0?                                                                                                                                      |
| 0x28   | 4      | Free blocks remained + (blocks occupied by the recently mounted file, specified by the ID below (0 if recently deleted))                       |
| 0x2C   | 4      | Always 0?                                                                                                                                      |
| 0x30   | 4      | ID of most recently mounted file. Same as the one in [Inner_FAT#Filesystem Header](Inner_FAT#Filesystem_Header "wikilink")                     |
| 0x34   | 4      | Always 0?                                                                                                                                      |
| 0x38   | 4      | Always 0?                                                                                                                                      |
| 0x3C   | 4      | Always 0?                                                                                                                                      |
| 0x40   | 4      | Size in bytes of most recently mounted file (device file size). 0 if recently deleted                                                          |
| 0x44   | 4      | Always 0?                                                                                                                                      |

## Device Directory Capacity

A device directory in an extdata (a <SubDirID> directory) seems to have
a maximum number of device files it can contain. For SD extdata, this
maximum number seems to be hard-coded as 126. For NAND extdata, the
number is probably indicated by a field in Quota.dat, which is, again,
always 126 as observed. 3DS FS tries to put all device files in the
device directory `00000000` if possible, and only when more than 126
files needed to add, a second device directory `00000001` and so on are
created. However, few extdata have such amount of files to store, so the
behavior lacks of use cases to confirm.

The number 126 is probably from some kind of other capacity of 128 with
`"."` and `".."` entries reserved. It is theorized that this is to keep
a FAT directory table, with 0x20 bytes for each entry, in one 0x1000
cluster. The motivation is unclear.

## VSXE Filesystem

This is one variant of the [FAT filesystem](Inner_FAT "wikilink").
Please refer to its page for the description of the filesystem. In
general, device file `00000000/00000001` contains the metadata of the
filesystem, while other device files (except for the Quota file)
contains normal sub-files

Each non-dummy file entry corresponds to a device file. The path to the
device file is generated by the following computation:

    // See previous section about this capacity
    const uint32_t device_dir_capacity = 126;

    // entry index is the index in the file entry table, with the first dummy entry as
    // index = 0, which is never used for a real file.
    // file_index = 1 is reserved for the VSXE Filesystem Metadata itself, so real files
    // started from file_index = 2.
    uint32_t file_index = entry_index + 1;

    uint32_t SubDirID = file_index / device_dir_capacity;
    uint32_t SubFileID = file_index % pdevice_dir_capacity;

    char extdata_path[...]; // ".../extdata/<ExtdataID-High>/<ExtdataId-Low>"
    char device_path[...]; // output path
    sprintf(device_path, "%s/%08x/%08x", extdata_path, SubDirID, SubFileID);

When mounting extdata, the unique identifier is used to match the ID
stored in subfile's [DIFF header](DISA_and_DIFF#DIFF_header "wikilink").
If the ID doesn't match, mounting will fail.

## Virtual File System Structure

When extdata is created, these are *always* created regardless of
whether the title actually uses them.

- `/icon` This virtual file contains the extdata icon displayed in data
  management. This icon can only be written to by titles when creating
  extdata, titles would have to recreate extdata to change the icon.
  This file can't be read directly, instead it is read via
  FS:ReadExtSaveDataIcon.
- `/user/` This virtual directory contains the title's actual extdata
  files.
- `/boss/` This virtual directory can contain SpotPass content. SpotPass
  content can only be downloaded to this `/boss` virtual directory.

User extdata and SpotPass extdata use separate mount points at `/user`
and `/boss`. Therefore one mount can't access the other virtual
directory, and also can't access `/icon`.(The title's SpotPass extdata
can be mounted by the title itself, if it uses SpotPass)

Other optional but notable directories include:

- `/user/ExBanner` This virtual directory can optionally store extended
  banners. When this is available, this banner is displayed instead of
  the CXI ExeFS banner. `COMMON.bin` stores the common exbanner, while
  <regionlang_code>`.bin` stores an optional separate region/language
  specific banner.(regionlang_code can be "JPN_JP", "USA_EN", etc)

## SD Extdata

Usually the ExtdataID low is in the format '00<Unique ID>'

<table>
<thead>
<tr class="header">
<th><p>JPN ExtdataID</p></th>
<th><p>USA ExtdataID</p></th>
<th><p>EUR ExtdataID</p></th>
<th><p>Description</p></th>
<th><p>Extdata images</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>00000082</p></td>
<td><p>0000008f</p></td>
<td><p>00000098</p></td>
<td><p><a href="../Home_Menu" title="wikilink">Home Menu</a> extdata, this
contains home-menu savedata and cached icons for applications.</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>00000200</p></td>
<td><p>00000210</p></td>
<td><p>00000220</p></td>
<td><p><a href="../System_Settings" title="wikilink">System Settings</a>
extdata added with <a href="../2.0.0-2"
title="wikilink">2.0.0-2</a>.</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>00000207</p></td>
<td><p>00000217</p></td>
<td><p>00000227</p></td>
<td><p><a href="../Mii_Maker" title="wikilink">Mii Maker</a>, contains an
ExBanner</p></td>
<td><p><a
href="https://dl.dropbox.com/u/20520664/extdata00000217.zip">cleartext</a></p></td>
</tr>
<tr class="even">
<td><p>00000208</p></td>
<td><p>00000218</p></td>
<td><p>00000228</p></td>
<td><p>Streetpass Mii Plaza</p></td>
<td><p>11 mb big!</p></td>
</tr>
<tr class="odd">
<td><p>00000209</p></td>
<td><p>00000219</p></td>
<td><p>00000229</p></td>
<td><p><a href="../eShop" title="wikilink">eShop</a>, contains store music
in AAC format.</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>0000020b</p></td>
<td><p>0000021b</p></td>
<td><p>0000022b</p></td>
<td><p>Nintendo Zone</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>0000020d</p></td>
<td><p>0000021d</p></td>
<td><p>0000022d</p></td>
<td><p>Face Raiders, likely contains an ExBanner</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>000002cc</p></td>
<td><p>000002cd</p></td>
<td><p>000002ce</p></td>
<td><p><a href="../Home_Menu" title="wikilink">Home Menu</a> theme</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>000004aa</p></td>
<td><p>000004ab</p></td>
<td><p>Nintendo Video Extra Data This is where the video files are
stored, and <a href="../Nintendo_Video" title="wikilink">includes</a> the
thumbnail, the description, and possibly some checksum info in each
video file stored in the extdata images. There are always 9 files within
the subdirectory "00000000" of this folder, even without any videos
downloaded. The files are "00000001" - "00000009", and "00000003" -
"00000008" have the same filesize of 50.7 MB. It is possible to restore
the older videos by overwriting all the files within this directory.
Provided of course you have made a backup of the files before hand, by
copying all the files within this directory to your computer. As far I'm
aware its not possible to mix and match the files in order to get
certain videos in one grouping, ie. having all 3 Zelda orchestral
recordings in one group of 4 Nintendo videos.</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>00000306</p></td>
<td><p>00000308</p></td>
<td><p>00000307</p></td>
<td><p>Mario Kart 7</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>0000030b</p></td>
<td><p>0000030d</p></td>
<td><p>0000030c</p></td>
<td><p>Nintendogs + Cats</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>00000326</p></td>
<td><p>00000326</p></td>
<td><p>00000326</p></td>
<td><p>Pokédex 3D</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>00000305</p></td>
<td><p>0000032d</p></td>
<td><p>0000033c</p></td>
<td><p>Super Street Fighter IV 3D</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>00000328</p></td>
<td><p>00000358</p></td>
<td><p>0000033b</p></td>
<td><p>Ridge Racer 3D</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>0000034d</p></td>
<td><p>00000402</p></td>
<td><p>Samurai Warriors Chronicles</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>0000034f</p></td>
<td><p>0000038a</p></td>
<td><p>Dead or Alive Dimensions</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>00000481</p></td>
<td><p>N/A</p></td>
<td><p>N/A</p></td>
<td><p>Monster Hunter Tri G (Download-Quests)</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>00000517</p></td>
<td><p>00000518</p></td>
<td><p>Swapnote</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>0000055d</p></td>
<td><p>0000055d</p></td>
<td><p>0000055d</p></td>
<td><p>Pokémon X<br />
Pokémon Y</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>00000725</p></td>
<td><p>00000724</p></td>
<td><p>Ambassador Certificate</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>000007af</p></td>
<td><p>New Super Mario Bros. 2</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>00000863</p></td>
<td><p>00000864</p></td>
<td><p>Animal Crossing: New Leaf</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>00000a85</p></td>
<td><p>00000a86</p></td>
<td><p>Professor Layton and the Miracle Mask<br />
Professor Layton and the Azran Legacy German Version ExtdataID is
00000a87</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00000b4f</p></td>
<td><p>Fullblox / Crashmo</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00000ba9</p></td>
<td><p>Pokémon Mystery Dungeon: Gates to Infinity</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00000c24</p></td>
<td><p>Denpa men</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>00000c73</p></td>
<td><p>00000c73</p></td>
<td><p>00000c73</p></td>
<td><p>Save Data Transfer Tool</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00000d9a</p></td>
<td><p>Donkey Kong Country™<br />
Returns 3D: Trailer</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00000ea6</p></td>
<td><p>Etrian Odyssey IV</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>00000edf</p></td>
<td><p>00000ee0</p></td>
<td><p>Super Smash Bros. for Nintendo 3DS</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>00000f14</p></td>
<td><p>00000f1e</p></td>
<td><p>Phoenix Wright: Ace Attorney - Dual Destinies</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>00001007</p></td>
<td><p>00001005</p></td>
<td><p>Professor Layton vs Phoenix Wright: Ace Attorney</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00001062</p></td>
<td><p>Nintendo Pocket Football Club</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>0000111c</p></td>
<td><p>Yoshi's New Island</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>00001132</p></td>
<td><p>00001131</p></td>
<td><p>Fantasy Life</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>000011c5</p></td>
<td><p>000011c5</p></td>
<td><p>000011c5</p></td>
<td><p>Pokémon Omega Ruby<br />
Pokémon Alpha Sapphire</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>000012c8</p></td>
<td><p>000012ca</p></td>
<td><p>Mario vs. Donkey Kong: Tipping Stars</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00001499</p></td>
<td><p>Korg DSN-12</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>000014f2</p></td>
<td><p>Animal Crossing: Happy Home Designer</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>000014d1</p></td>
<td><p>000014d1</p></td>
<td><p>000014d1</p></td>
<td><p><a href="../Home_Menu" title="wikilink">Home Menu</a> badge</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00001632</p></td>
<td><p>Fullblox / Stretchmo</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00001646</p></td>
<td><p>Pokémon Rumble World</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>00001648</p></td>
<td><p>00001648</p></td>
<td><p>00001648</p></td>
<td><p>Pokémon Sun<br />
Pokémon Moon</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>0000165c</p></td>
<td><p>0000165c</p></td>
<td><p>0000165c</p></td>
<td><p><a href="../Home_Menu" title="wikilink">Home Menu</a> saved theme
layouts</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>000016C6</p></td>
<td><p>?</p></td>
<td><p>00001678</p></td>
<td><p>Yo-kai Watch</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>000018fa</p></td>
<td><p>Phoenix Wright: Ace Attorney - Spirit of Justice</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>0000198e</p></td>
<td><p>0000198f</p></td>
<td><p>Animal Crossing: New Leaf - Welcome amiibo</p></td>
<td></td>
</tr>
<tr class="even">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00001a05</p></td>
<td><p>Super Mario Maker</p></td>
<td></td>
</tr>
<tr class="odd">
<td><p>?</p></td>
<td><p>?</p></td>
<td><p>00001a2e</p></td>
<td><p>Swapdoodle</p></td>
<td></td>
</tr>
</tbody>
</table>

## NAND Shared Extdata

| ExtdataID  | Description                                                                                                                                                                                                                                                                                                         |
|------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0xe0000000 | Home Menu attempts to open this archive during boot, if [FS:OpenArchive](FS:OpenArchive "wikilink") doesn't return an error Home Menu seems to then launch the [System Transfer](System_Transfer "wikilink") application. Home Menu doesn't actually use this archive at all except for checking whether it exists. |
| 0xf0000001 | NAND JPEG/MPO files and phtcache.bin from the camera application are stored here. This also contains UploadData.dat.                                                                                                                                                                                                |
| 0xf0000002 | NAND M4A files from the sound application are stored here                                                                                                                                                                                                                                                           |
| 0xf0000009 | Used for [SpotPass](BOSS_Services "wikilink") content storage for [notifications](News_Services "wikilink").                                                                                                                                                                                                        |
| 0xf000000b | Contains idb.dat, idbt.dat, gamecoin.dat, ubll.lst, CFL_DB.dat, and CFL_OldDB.dat. These files contain cleartext [Miis](Mii_Maker "wikilink") and some data relating (including cached ICN data) to Play/Usage Records.                                                                                             |
| 0xf000000c | Contains bashotorya.dat and bashotorya2.dat.                                                                                                                                                                                                                                                                        |
| 0xf000000d | Home Menu SpotPass content data [storage](BOSS_Services "wikilink").                                                                                                                                                                                                                                                |
| 0xf000000e | Contains [versionlist.dat](VersionList "wikilink"), used by Home Menu for the software update notification added with [7.0.0-13](7.0.0-13 "wikilink").                                                                                                                                                              |

#### Shared Extdata 0xf000000b gamecoin.dat

| Offset | Size | Description                                                                                                                                                                                                                                                                     |
|--------|------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0    | 0x4  | Magic number: 0x4F00                                                                                                                                                                                                                                                            |
| 0x4    | 0x2  | Total Play Coins                                                                                                                                                                                                                                                                |
| 0x6    | 0x2  | Total Play Coins obtained on the date stored below. When the below date does not match the current date, this field is reset to zero, then the date(and other fields) are updated. Once this value is \>=10, no more Play Coins can be obtained until the current date changes. |
| 0x8    | 0x4  | Total step [count](PTM:GetTotalStepCount "wikilink") at the time a new Play Coin was obtained.                                                                                                                                                                                  |
| 0xC    | 0x4  | Step count for the day the last Play Coin was obtained, for that day's step count(same as the step count displayed by home-menu when this file was updated).                                                                                                                    |
| 0x10   | 0x2  | Year                                                                                                                                                                                                                                                                            |
| 0x12   | 0x1  | Month                                                                                                                                                                                                                                                                           |
| 0x13   | 0x1  | Day                                                                                                                                                                                                                                                                             |

The above date stores the last time new Play Coin(s) were obtained. The
contents of this file is updated by home-menu.
[PTM:GetTotalStepCount](PTM:GetTotalStepCount "wikilink") is not checked
constantly, after home-menu boot this is only checked when waking from
sleep-mode. Each time home-menu updates the contents of this file,
home-menu will set the Play Coin total to 300 if it's higher than the
300 Play Coin limit.

[Home Menu](Home_Menu "wikilink") loads this file / opens this archive
during [startup](Home_Menu "wikilink"). When accessing this file fails,
like when the file/archive is corrupted(or at least on older
system-versions), the result is a brick due to Home Menu using
[svcBreak](SVC "wikilink"). [Yellows8](User:Yellows8 "wikilink") bricked
a 3DS this way due to corruption via invalid
[FSFile:Write](FSFile:Write "wikilink") flush flags. When opening this
extdata archive(0xf000000b) fails, Home Menu executes svcBreak.

#### Shared Extdata 0xf000000b ubll.lst

List of blocked users.

Empty space is filled with 0xC-long sequences of 00 00 ... 07

## Tools

- [3ds-save-tool](https://github.com/wwylele/3ds-save-tool) -
  Extract/verifies extdata