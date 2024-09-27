The BCSAR (Binary CTR Sound ARchive) format is the 3DS's equivalent of
the Wii's BRSAR format. They're not the same structures, though, but
they do have the same purpose.

BCSAR are located in the RomFS, this is usually stored under
"romfs:/sound/<name>.bcsar". This contains various audio formats, such
as CSTM, CWSD, CSEQ, and CWAV.

## BCSAR Header

| OFFSET | SIZE | DESCRIPTION                                                                |
|--------|------|----------------------------------------------------------------------------|
| 0x0    | 0x4  | MAGIC "CSAR"                                                               |
| 0x4    | 0x2  | Byte order mark (0xFEFF = Big Endian, 0xFFFE = Little Endian)              |
| 0x6    | 0x2  | Length of BCSAR header                                                     |
| 0x8    | 0x4  | Version                                                                    |
| 0xC    | 0x4  | Length of the entire BCSAR (starting from 0x0)                             |
| 0x10   | 0x4  | Amount of main partitions in the BCSAR \[STRG + INFO + FILE = 0x03 (= 3)\] |
| 0x14   | 0x4  | STRG partition reference ID? (Always 0x2000)                               |
| 0x18   | 0x4  | Location of STRG partition                                                 |
| 0x1C   | 0x4  | Length of STRG partition                                                   |
| 0x20   | 0x4  | INFO partition reference ID? (Always 0x2001)                               |
| 0x24   | 0x4  | Location of INFO partition                                                 |
| 0x28   | 0x4  | Length of INFO partition                                                   |
| 0x2C   | 0x4  | Main FILE partition reference ID? (Always 0x2002)                          |
| 0x30   | 0x4  | Location of main FILE partition                                            |
| 0x34   | 0x4  | Length of main FILE partition                                              |
| 0x38   | 0x4  | Reserved for 4th main partition location?                                  |
| 0x3C   | 0x4  | Reserved for 4th main partition length?                                    |
|        |      |                                                                            |

## Partitions

### STRG

STRG contains the names of the audio files in the BCSAR.

#### Header

| OFFSET | SIZE         | DESCRIPTION                                       |
|--------|--------------|---------------------------------------------------|
| 0x0    | 0x4          | MAGIC "STRG"                                      |
| 0x4    | 0x4          | Length of STRG partition (also in CSAR header)    |
| 0x8    | 0x4          | String table type magic (always 0x2400)           |
| 0xC    | 0x4          | This + 8 points to the string table (always 0x10) |
| 0x10   | 0x4          | String table lookup type magic (always 0x2401)    |
| 0x14   | 0x4          | This + 8 points to the string lookup table        |
| 0x18   | 0x4          | Filename count                                    |
| 0x1C   | 0xC \* count | String offset table                               |
|        |              |                                                   |

#### String offset table entry

| OFFSET | SIZE | DESCRIPTION                                                  |
|--------|------|--------------------------------------------------------------|
| 0x0    | 0x4  | Type of the node (should be 0x1F01)                          |
| 0x4    | 0x4  | Offset to data from the end of the STRG header (sizeof 0x18) |
| 0x8    | 0x4  | Length of the data buffer (includes NUL terminator)          |
|        |      |                                                              |

Then every filename is rawly setted. You can set up a dictionary that
contains, using a simple counter, the size of every filename in order.
Then, using the same type of counter, get the values of the size of the
filename in a correct order.

#### String lookup table

##### Header

| OFFSET | SIZE          | DESCRIPTION             |
|--------|---------------|-------------------------|
| 0x0    | 0x4           | Index of the root entry |
| 0x4    | 0x4           | Entry count             |
| 0x8    | 0x14 \* count | Lookup entry            |
|        |               |                         |

##### Entry

| OFFSET | SIZE | DESCRIPTION                                                                                              |
|--------|------|----------------------------------------------------------------------------------------------------------|
| 0x0    | 0x2  | Nonzero if contains data                                                                                 |
| 0x2    | 0x2  | Bit test condition (index = (this \>\> 3), bit = (~this & 7)), -1 if unused                              |
| 0x4    | 0x4  | Fail condition leaf index (-1 if unused)                                                                 |
| 0x8    | 0x4  | Success condition leaf index (-1 if unused)                                                              |
| 0xC    | 0x4  | String lookup table index (-1 if unused)                                                                 |
| 0x10   | 0x3  | 3-byte Resource ID, Little Endian (-1 if unused)                                                         |
| 0x13   | 0x1  | Resource type (01=sound, 02=sound list, 03=sound bank, 04=sound player name?, 06=sound group, FF=unused) |
|        |      |                                                                                                          |

### INFO

INFO presumably contains information on the audio files? Possibly used
to connect names from STRG to data from FILE?

For now I only know some information in the header for this partition,
but I'm working on figuring the rest out.

#### Header

| OFFSET | SIZE | DESCRIPTION                                    |
|--------|------|------------------------------------------------|
| 0x0    | 0x4  | MAGIC "INFO"                                   |
| 0x4    | 0x4  | Length of INFO partition (also in CSAR header) |
| 0x8    | 0x4  | Audio Table Reference ID (0x2100)              |
| 0xC    | 0x4  | This + 8 points to the Audio Table             |
| 0x10   | 0x4  | Set Table Reference ID (0x2104)                |
| 0x14   | 0x4  | This + 8 points to the Set Table               |
| 0x18   | 0x4  | Bank Table Reference ID (0x2101)               |
| 0x1C   | 0x4  | This + 8 points to the Bank Table              |
| 0x20   | 0x4  | WAV Archive Table Reference ID (0x2103)        |
| 0x24   | 0x4  | This + 8 points to the WAV Archive Table       |
| 0x28   | 0x4  | Group Table Reference ID (0x2105)              |
| 0x2C   | 0x4  | This + 8 points to the Group Table             |
| 0x30   | 0x4  | Player Table Reference ID (0x2102)             |
| 0x34   | 0x4  | This + 8 points to Player Table                |
| 0x38   | 0x4  | FILE Table Reference ID (0x2106)               |
| 0x3C   | 0x4  | This + 8 points to the FILE Table              |
| 0x40   | 0x4  | Unknown Table Reference ID (0x220B)            |
| 0x44   | 0x4  | This + 8 points to unknown                     |
|        |      |                                                |

#### Blocks

Every offset in the header points to data similar to this:

- 4byte length
- length array of the below struct
  - u32 type
  - u32 offset relative to the address of the length field (beginning of
    the block)

The data the offset points to is dependent on the type of the above
struct:

##### 0x2200

| OFFSET | SIZE | DESCRIPTION                                                          |
|--------|------|----------------------------------------------------------------------|
| 0x0    | 0x4  | Unknown                                                              |
| 0x4    | 0x4  | Sound player ID                                                      |
| 0x8    | 0x4  | Unknown                                                              |
| 0xC    | 0x4  | Type of the extended info                                            |
| 0x10   | 0x4  | Offset to extended info \*relative to the beginning of this struct\* |
| 0x14   | ???  | Unknown...                                                           |
|        |      |                                                                      |

##### 0x2204

| OFFSET | SIZE | DESCRIPTION                                                          |
|--------|------|----------------------------------------------------------------------|
| 0x0    | 0x4  | First Sound ID in this sequence set                                  |
| 0x4    | 0x4  | Last Sound ID in this sequence set                                   |
| 0x8    | 0x4  | Type of the extended info                                            |
| 0xC    | 0x4  | Offset to extended info \*relative to the beginning of this struct\* |
| 0x10   | 0x4  | Type of the extended info                                            |
| 0x14   | 0x4  | Offset to extended info \*relative to the beginning of this struct\* |
| 0x18   | 0x4  | Unknown                                                              |
| 0x1C   | 0x4  | Unknown                                                              |
|        |      |                                                                      |

##### 0x2206

| OFFSET | SIZE | DESCRIPTION                                                          |
|--------|------|----------------------------------------------------------------------|
| 0x0    | 0x4  | Unknown                                                              |
| 0x4    | 0x4  | Type of the extended info                                            |
| 0x8    | 0x4  | Offset to extended info \*relative to the beginning of this struct\* |
| 0xC    | 0x4  | Unknown                                                              |
| 0x10   | 0x4  | Unknown                                                              |
|        |      |                                                                      |

##### Table IDs

| ID     | NAME              |
|--------|-------------------|
| 0x2200 | Audio Table       |
| 0x2204 | Set Table         |
| 0x2206 | Bank Table        |
| 0x2207 | WAV Archive Table |
| 0x2208 | Group Table       |
| 0x2208 | Player Table      |
| 0x220A | FILE Table        |
|        |                   |

### FILE

FILE contains all of the audio data in the BCSAR.

| OFFSET | SIZE | DESCRIPTION                                    |
|--------|------|------------------------------------------------|
| 0x0    | 0x4  | MAGIC "FILE"                                   |
| 0x4    | 0x4  | Length of FILE partition (also in CSAR header) |
| 0x8    | 0x24 | Padding                                        |

There isn't a whole lot else I can document about the FILE partition,
since the data in it will most definitely vary depending on the game.
(since audio is more than likely to change in each game)

There is no table in FILE so a different partition (presumably INFO)
must be used to connect the data in FILE with the names from STRG.

After some more research, there are multiple FILE partitions, but only 1
of them is the 'main' FILE partition (it's the one you get from the
BCSAR header). The 'main' FILE partition contains all of the other sub
FILE partitions.

## Tools

- vgmtoolbox's Advanced Cutter/Offset Finder tool can extract BCWAVs
  without filenames
- [3DSUSoundArchiveTool](https://github.com/soneek/3DSUSoundArchiveTool)
  reference implementation of CSAR extraction
- [BCSAR View](https://github.com/thane98/BCSAR-View)
- [Citric Composer](https://github.com/Gota7/Citric-Composer)

[Category:File formats](Category:File_formats "wikilink")