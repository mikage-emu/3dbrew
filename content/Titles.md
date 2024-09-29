+++
title = 'Titles'
+++

The Nintendo 3DS utilizes a similar title-based organization as seen in
the Wii and DSi platforms. The update server is located
[here](http://nus.cdn.c.shop.nintendowifi.net/ccs/download/).

For a list of 3DS titles see the [Title list](Title_list "wikilink").

# Title IDs

The organization of Title IDs has not been documented fully yet. Region
info isn't stored in title IDs however there does appear to be evidence
that the regions are sequential, similar to how Wii System Menu Updates
are ordered: JPN USA EUR KOR and CHN (introduced with the DSi). 3DS has
one additional region: TWN.

Note: The terms 'Title ID', 'Partition ID' and 'Media ID' are
interchangeable.

**TitleID Structure**: 0xCCCCABCDLLLLLLRR

- CCCC defines the console **Platform** (5=WiiU, 4=3DS, 3=DSi,
  1=[Wii](http://wiibrew.org/wiki/Title_database))
- ABCD defines the **Content Category** of the title, Demo, DLPChild,
  etc.
- LLLLLL For CTR titles, this is the title's **Unique ID**. For TWL
  converted titles this is in two sections grouped as SSLLLL. SS is the
  old title identification used by the DSi and is made redundant by
  'ABCD'. LLLL is the TWL title's 'Unique ID'. There are restrictions on
  the Unique ID, see below for more info.
- RR This is the Title ID **Variation**, and has various uses.

**Content Categories**:

This u16 is a collection bit mask flag. Each Category is a group of one
or more bit masks.

Specific Bitmask Flags:

| Category                | Bitmask |
|-------------------------|---------|
| Normal                  | 0x0     |
| DlpChild                | 0x1     |
| Demo                    | 0x2     |
| Contents                | 0x3     |
| AddOnContents           | 0x4     |
| Patch                   | 0x6     |
| CannotExecution         | 0x8     |
| System                  | 0x10    |
| RequireBatchUpdate      | 0x20    |
| NotRequireUserApproval  | 0x40    |
| NotRequireRightForMount | 0x80    |
| CanSkipConvertJumpId    | 0x100   |
| TWL                     | 0x8000  |

- TWL Category bit mask are carried over from original TWL category
  bitmasks (ignoring bit mask 0x8000), so TWL system titles have the
  bitmask of 0x8001.

<!-- -->

- System titles (TWL and CTR) are eligible to be updated during a System
  Update.

<!-- -->

- Bit Mask 0x4000 appears to be reserved, as it renders the *TWL* and
  *System* bit masks useless.

**Unique ID Restrictions**:

For the CTR titles, there appears to be is a correlation between Unique
IDs (UID) and 3DS 'title types'. For developer titles this is
known(shown below), and retail titles \*appear\* to follow suite. It is
unknown if this correlation is enforced on retail units, or if it is
just for organisation purposes.

| TITLE TYPE  | UNIQUE ID RANGE       |
|-------------|-----------------------|
| System      | 0x0 - 0x2FF           |
| Application | 0x300 - 0xF7FFF       |
| Evaluation  | 0xF8000 - 0xFEFFF (?) |
| Prototype\* | 0xFF000 - 0xFF3FF     |
| Developer   | 0xFF400 - 0xFF7FF (?) |

\*On the home menu, titles with UIDs within the 'Prototype' range,
appear on the home menu after install without the gift fanfare.

ProgramID/titleID low bitmask 0xF0000000(uniqueID bitmask 0xF00000)
seems to be related to which hardware the title is allowed to run on.
3DS code tends to clear this bitmask when handling programIDs. This
bitmask is normally zero. When this is 0x2, this indicates that the
title only runs on [New_3DS](New_3DS "wikilink")(that is, programID-low
0x20000000 / uniqueID 0x200000).

**TitleID Variation**:

This u8 allows enumeration of titles from the same category and unique
ID. Common uses are explained below:

- CTR System Titles: The 3DS has two copies of most
  modules/applets/archives for usage with either the NATIVE_FIRM or
  SAFE_MODE_FIRM. This is allowed for, by changing the title ID
  variation of the title to match the core version set by the FIRM it is
  designed to be used with:

| RR  | MEANING                                   |
|-----|-------------------------------------------|
| 02  | System Title (Core version 0x2)           |
| 03  | SAFE_MODE System Title (Core version 0x3) |

Normally on retail SAFE_MODE ARM11 [CXI](NCCH#cxi "wikilink") titles
can't be launched, since the [system](Configuration_Memory "wikilink")
core version doesn't match the CXI exheader core version.

- Only most non-Normal Applications are known to utilise Title ID
  variation, this is explained in their respective sections on this
  page.

<!-- -->

- [Dev Menu](3DS_Development_Unit_Software "wikilink") installs CTR
  Applications with a TitleID variation of 0x02 to the CTR NAND.

<!-- -->

- Title ID variation is ignored for TWL titles, this value is carried
  over from the original TWL title ID and is used for region lock:

# Versions

v## = 0xHHHH = 0bBBBBBBBB...

- The version major,minor and micro can be extracted from the version
  number by converting the 16 bit number to binary
- 6 bits : Major, this matches the NCCH remaster-version.
- 6 bits : Minor
- 4 bits : Micro ('Build' in some contexts)
- i.e. v2069 (Taken from 000400DB00017302) = 0b000010 000001 0101 means
  that the title version is v2.1.5. For reasons unknown, the CVer build,
  stored in the RomFS of the title, has always been zero (at time of
  writing), regardless of the CVer build in the TMD. So when predicting
  the firmware version, this should be taken into account.

# Data Structure

Titles are installed to either the NAND (System and Application) or to
the SD Card (Application only), and their respective directory locations
are:

|            |                                     |                                     |
|------------|-------------------------------------|-------------------------------------|
|            | [NAND](Flash_Filesystem "wikilink") | [SD](SD_Filesystem "wikilink")      |
| Title Data | nand/title                          | sdmc/Nintendo 3DS/&lt;ID0&gt;/&lt;ID1&gt;/title |
| Save Data  | nand/data/&lt;ID0&gt;/sysdata             |                                     |
|            |                                     |                                     |

ID0 is the first 0x10-bytes from a SHA256
[hash](Nand/private/movable.sed "wikilink") and ID1 is generated from
the SD card CID.

Title data stored on the SD Card is encrypted with the console-unique
[keyslots](Nand/private/movable.sed "wikilink"), whereas NAND title data
is stored as cleartext.

The base CTR for files stored under /title is likely based on the /title
path, similar to extdata. This base CTR is unique per titleID and
filename. The base CTR never changes after creation of each file.

When a newer version of a title is installed, the new .app content,
.tmd, and .cmd(and .ctx for NAND titles) are written to the /title
directory, however the old files here are not yet deleted. Once
installation of the title is
[finalized](AMNet:InstallTitlesFinish "wikilink"), the info from
[import.db](Title_Database "wikilink") is moved to
[title.db](Title_Database "wikilink") so that the system uses the newer
files instead, then the old /title files are deleted.

The title data is contained in this directory structure (note that
[DLC](Title_list#0004008c---add-on-content-(dlc) "wikilink") titles are
stored in a different way):

<table>
<thead>
<tr class="header">
<th></th>
<th scope="col">NAND</th>
<th scope="col">SD (non-DLC)</th>
<th scope="col">SD (DLC)</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td scope="row">Title Data:</td>
<td><pre>&lt;Title ID High&gt;
└── &lt;Title ID Low&gt;
    ├── 00000000.ctx
    └── content
        ├── &lt;ContentID&gt;.app
        ├── &lt;ContentID&gt;.tmd
        └── cmd
            └── &lt;ContentID&gt;.cmd
</pre>
</td>
<td rowspan="2"><pre>&lt;Title ID High&gt;
└──
&lt;Title ID Low&gt;
    ├── 00000000.ctx
    ├── content
    │   ├── &lt;ContentID&gt;.app
    │   ├── &lt;ContentID&gt;.tmd
    │   └── cmd
    │       └── &lt;ContentID&gt;.cmd
    └── data
        └── 00000001.sav</pre></td>
<td rowspan="2"><pre>0004008C
└──
&lt;Title ID Low&gt;
    ├── 00000000.ctx
    └── content
        ├── &lt;ContentID>.tmd
        ├── &lt;IndexSeparator&gt;
        │   └── &lt;ContentID&gt;.app
        └── cmd
            └── &lt;ContentID&gt;.cmd</pre></td>
</tr>
<tr class="even">
<td scope="row">Save Data:</td>
<td><pre>&lt;SaveID0&gt;
└── &lt;SaveID1&gt;
    └── 00000001.sav</pre></td>
</tr>
</tbody>
</table>

"**&lt;ContentID&gt;.tmd**" - (The Content ID is a u32, initially:
**00000000** when the title is first installed. Changing by an increment
of +**0x1** for each title update the 3DS installs) This is the [Title
metadata](Title_metadata "wikilink") associated with the title. The
decrypted TMD is available on Nintendo's CDN server at
`http://nus.cdn.c.shop.nintendowifi.net/ccs/download/TitleIDhere/tmd.OptionallyTitleVersionHere`.
Though CDN version of the title TMD has a certificate chain attached at
the end of the TMD, so removing it will give you the 1:1 decrypted TMD.
After installation the "&lt;ContentID&gt;.tmd" is redundant, because important
title data is extracted and imported into the
[title.db](Title_Database "wikilink") and ".cmd" files, but is however
kept as a reference.

"**&lt;ContentID&gt;.app**" - (The Content ID is a u32, taken from the title's
[TMD](TMD "wikilink")) These files are [NCCH](NCCH "wikilink") files.
There can be more than one NCCH in this directory, as seen with
.[CCI](CCI "wikilink") files, the game executable
([CXI](CXI "wikilink")) can be accompanied with additional
non-executable NCCH files ([CFA](NCCH#cfa "wikilink")) such as the
electronic manual and DLP Child containers. Determining the function of
the NCCH, is done by finding the Content Index of the "XXXXXXXX.app"
file in the title's TMD(see above for retrieving decrypted TMD),
interpreting the Content Index is as follows (does not apply to DLC
content):

| Index | Content Type                                                                                                                                           |
|-------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0000  | Main Executable (.[CXI](NCCH#cxi "wikilink"))(In the case of [System Data Archives](Title_list "wikilink"), this is a [CFA](NCCH#cfa "wikilink") file) |
| 0001  | Home Menu Manual (.[CFA](NCCH#cfa "wikilink"))                                                                                                         |
| 0002  | DLP Child Container (.[CFA](NCCH#cfa "wikilink"))                                                                                                      |

Unlike the TMD, a decrypted version of the NCCH files cannot be
retrieved from Nintendo's CDN, the NCCH files do exist on Nintendo's CDN
but are [encrypted](AES "wikilink"). Decrypting CDN versions of content,
requires the title's [ticket](CommonETicket "wikilink"), and the common
key specified by an index in the [ticket](CommonETicket "wikilink"). Of
course editing/deleting ".app" files will have an effect.
Deleting/renaming the manual ".app' will cause the manual not to load
when clicked on. And deleting/renaming the executable ".app" will cause
the application to not load, and the 3D Banner does not show(The banner
is loaded each time from the game's executable NCCH when the home menu
loads, it is not cached like the icon and name).

"**&lt;ContentID&gt;.cmd**" - (The Content ID is a u32, initially:
**00000001** when the title is first installed. Changing by an increment
of +**0x1** for each time the 3DS adds/removes '.app' files) This file
contains data taken from the title's [TMD](TMD "wikilink"). See the
below table for the format of the cleartext .cmd file. The
[Title.db](Title_Database "wikilink") contains the Content ID for the
'.cmd' file, but does not contain a hash of the '.cmd' file. This acts
as part of the DRM for installed titles, along with the
[title.db](Title_Database "wikilink").

The below AES-CMACs(including the last 0x10-bytes of the header) are
only used for SD titles, for NAND [download-play](Title_list "wikilink")
titles, and non-system DSiWare titles. For other titles, these MACs are
set to all-zero.

| Offset                | Size      | Description                                                                                                 |
|-----------------------|-----------|-------------------------------------------------------------------------------------------------------------|
| 0x0                   | 0x4       | .cmd ContentID, for the .cmd filename. This is the beginning of the header.                                 |
| 0x4                   | 0x4       | Number of AES-CMACs and Content IDs in the first list (X). The method to determine this is explained below. |
| 0x8                   | 0x4       | Number of Content IDs in the second list (Y)                                                                |
| 0xC                   | 0x4       | Unknown, usually (always?) 1.                                                                               |
| 0x10                  | 0x10      | AES-CMAC over first 0x10                                                                                    |
| 0x20                  | 0x4 \* X  | List of installed Content IDs in order of Content Index, with missing contents replaced with 0xFFFFFFFF     |
| 0x20 + 0x4 \* X       | 0x4 \* Y  | List of installed Content IDs in order of ID name                                                           |
| 0x20 + 0x4 \* (X + Y) | 0x10 \* X | AES-CMACs for each content in the first list, generated using the process below                             |

The number of AES-CMACs depends on the highest Content Index installed.
For example, a title with 5 contents, but only 1 and 3 are installed,
will still result in 3 AES-CMACs, with the 2nd one being unused.

For SD contents, each AES-CMAC is generated by combining the NCCH header
without the signature (0x100-0x1FF), the Content Index and Content ID at
the end, both as u32. Then calculate the SHA256 of the data and generate
the AES-CMAC using the [SD/NAND AES-CMAC
key](AES_Registers#keyslots "wikilink").

For TWLNAND contents, the same process is used(even for SRL contents)
with the keyslot for NAND dbs.

**"00000001.sav"** - This is the title's
[savegame](Savegames "wikilink"). Renaming these savegames causes
home-menu to hang while launching titles, modifying these saves results
in the same corruption errors as other savegames.

**"00000000.ctx"** - This file is temporarily stored on SD card while a
title is being downloaded from the eShop, it is deleted after the
download is completed. This contains an AP0000000000000000 cert used to
sign the data following the cert, this cert is signed by the
[CTCert](CTCert "wikilink"). The unknown signed data is likely an ECDSA
public key. There's .ctx files stored under the /title directory for
NAND CTR/TWL titles, however those use the [CTXT](CTXT "wikilink")
format which is completely different from this SD .ctx format. These
.ctx files for NAND/SD titles only exist for titles where installation
was not yet finalized(like when a system update install was not yet
finalized).

### DLC Titles

DLC titles have a different directory structure to most installed
titles. This is because all DLC content for a given title is installed
under the same Title ID, but DLC add-ons are usually separate purchases,
hence the structure altered so any combination of DLC content can be
installed. DLC titles can receive 'updates', this is usually in the form
of more DLC content and/or DLC bug fixes. Individual DLC content can
only be managed from with-in the application using the DLC.

**"&lt;IndexSeparator&gt;"** - DLC [NCCH](NCCH "wikilink") contents are split
across different directories, depending on the Content Index. Starting
with 00000000, there is a directory for every 256 contents. All the
directories are created upon install, which means some may be empty if
the contents within its index range are not installed.

"**&lt;ContentID&gt;.tmd**" - This is not modified by the 3DS, and contains
the details for all DLC content(installed or not).

"**&lt;ContentID&gt;.cmd**" - This contains entries for all **installed** DLC
[NCCH](NCCH "wikilink") content, and is updated (&lt;ContentID&gt; will
change) every time DLC content is installed/removed.

# Installing other-model system-titles

When finalizing title-install of already downloaded Old3DS system-titles
to a New3DS NAND image with New3DS NATIVE_FIRM, the end result is that
the New3DS version (TID-low bitmask 0x20000000) of those titles gets
deleted.

It's unknown where this behaviour is implemented (might be NIM, AM, or
AMXPXI).
