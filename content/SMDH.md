+++
title = 'SMDH'
+++

This page describes the format of the icon stored at [CXI](NCCH#cxi "wikilink") ExeFS:/icon and [CIA](CIA "wikilink") icons.
The size of icons are 0x36c0 bytes. The CXI icon is displayed by [Home Menu](Home_Menu "wikilink") and [System Settings](System_Settings "wikilink")(3DS Software Management), while [CIA icons](CIA#meta "wikilink") are dummies and not yet utilised by Dev 3DS' (as of rev 47586).

## Format

| OFFSET | SIZE   | DESCRIPTION                                     |
|--------|--------|-------------------------------------------------|
| 0x00   | 0x04   | Magic 'SMDH'                                    |
| 0x04   | 0x02   | Version                                         |
| 0x06   | 0x02   | Reserved                                        |
| 0x8    | 0x2000 | 16 application titles structs, each 0x200 bytes |
| 0x2008 | 0x30   | Application Settings                            |
| 0x2038 | 0x8    | Reserved                                        |
| 0x2040 | 0x1680 | Icon graphics                                   |

## Application Titles

| START | SIZE  | DESCRIPTION       |
|-------|-------|-------------------|
| 0x00  | 0x80  | Short Description |
| 0x80  | 0x100 | Long Description  |
| 0x180 | 0x80  | Publisher         |

All encoded in UTF-16.
There are 16 app title structs (currently only 12 are used), each one for separate languages.

The languages by order of appearance:

- 1st: Japanese title name
- 2nd: English title name
- 3rd: French title name
- 4th: German title name
- 5th: Italian title name
- 6th: Spanish title name
- 7th: Simplified Chinese title name
- 8th: Korean title name
- 9th: Dutch title name
- 10th: Portuguese title name
- 11th: Russian title name
- 12th: Traditional Chinese title name

## Application Settings

Most of these flags are only used by the [Home Menu](Home_Menu "wikilink"). All of these are represented in SMDH files in little endian. But when documented below, the tables represent values in big endian.

| START | SIZE | DESCRIPTION |
|----|----|----|
| 0x2008 | 0x10 | Region Specific Game Ratings (For use with Parental Controls) |
| 0x2018 | 0x4 | Region Lockout |
| 0x201C | 0xC | Match Maker IDs (Online Play) |
| 0x2028 | 0x4 | Flags |
| 0x202C | 0x2 | EULA Version |
| 0x202E | 0x2 | Reserved |
| 0x2030 | 0x4 | 'Optimal Animation Default Frame' (for BNR) |
| 0x2034 | 0x4 | CEC (StreetPass) ID (So the Home Menu knows which application icon to show the 'Green' CEC notification for) |

### Region Specific Game Age Ratings

These flags tell the 3DS the 'Age Rating' of the software for the below regions:

| START  | SIZE | DESCRIPTION         |
|--------|------|---------------------|
| 0x2008 | 0x1  | CERO (Japan)        |
| 0x2009 | 0x1  | ESRB (USA)          |
| 0x200A | 0x1  | Reserved            |
| 0x200B | 0x1  | USK (German)        |
| 0x200C | 0x1  | PEGI GEN (Europe)   |
| 0x200D | 0x1  | Reserved            |
| 0x200E | 0x1  | PEGI PRT (Portugal) |
| 0x200F | 0x1  | PEGI BBFC (England) |
| 0x2010 | 0x1  | COB (Australia)     |
| 0x2011 | 0x1  | GRB (South Korea)   |
| 0x2012 | 0x1  | CGSRR (Taiwan)      |
| 0x2013 | 0x1  | Reserved            |
| 0x2014 | 0x1  | Reserved            |
| 0x2015 | 0x1  | Reserved            |
| 0x2016 | 0x1  | Reserved            |
| 0x2017 | 0x1  | Reserved            |

Active ratings have a bitmask of 0x80, and inactive ratings have no bitmask at all. Ratings without the 0x80 bitmask are ignored. 0x40 bitmask indicates Rating Pending. 0x20 bitmask indicates No Age Restriction.
Age limits are set by adding the minimal age to 0x80 (for example, limiting to 12 years and up would give a bitmask of 0x8C)

### Region Lockout

This u32 flag is what the Home Menu uses to determine the [Region Lockout](Home_Menu#region_lockout "wikilink") of a title.

| REGION        | BITMASK |
|---------------|---------|
| Japan         | 0x01    |
| North America | 0x02    |
| Europe        | 0x04    |
| Australia     | 0x08    |
| China         | 0x10    |
| Korea         | 0x20    |
| Taiwan        | 0x40    |

Regions are 'included' in region lock by setting their bitmask value. Nintendo defines region free as 0x7fffffff. Early in the 3DS' development, Nintendo grouped the Australian and Europe markets together. Nintendo defines market Europe as having the combined bitmasks of Europe and Australia. No 3DS' which check the Australia bitmask have been seen (Australia uses the European 3DS model).

### Match Maker IDs

These IDs are an application's online gaming IDs.

| START  | SIZE | DESCRIPTION        |
|--------|------|--------------------|
| 0x201C | 0x4  | Match Maker ID     |
| 0x2020 | 0x8  | Match Maker BIT ID |

### Flags

The u32 is used for storing flags as bit-masks.

| FLAG | BITMASK VALUE |
|----|----|
| Visibility Flag (Required for visibility on the Home Menu) | 0x0001 |
| [Auto-boot](Home_Menu#auto-boot-function "wikilink") this gamecard title | 0x0002 |
| Allow use of 3D? (For use with parental Controls. An application can use the 3D affect, even when this flag isn't set) | 0x0004 |
| Require accepting CTR EULA before being launched by Home (see below) | 0x0008 |
| Autosave on exit? (see below) | 0x0010 |
| Uses an [Extended Banner](Extended_Banner "wikilink")? | 0x0020 |
| [Region game rating](SMDH#region_specific_game_age_ratings "wikilink") required | 0x0040 |
| Uses save data? (see below) | 0x0080 |
| Application usage is to be recorded. If this is not set, it causes the application's usage to be omitted from the Home Menu's [icon cache](Home_Menu#cachedat__cacheddat "wikilink"), as well as in [other places](???????? "wikilink"). | 0x0100 |
| Disables [SD Savedata Backups](SD_Savedata_Backups "wikilink") for this title. This is in addition to [the blacklist](NS_CFA "wikilink"). | 0x0400 |
| New 3DS exclusive title. Shows an error if used on Old 3DS. | 0x1000 |
| Application is restricted by Parental Controls. | 0x4000 |

#### Effect of SaveData and AutoSave

These options have no effect on the performance of the application itself: they're used to select an appropriate warning when closing an application from [Home](Home_Menu "wikilink").

- Both off: "Closing software" (no warning if quitting directly with X)
- SaveData: "Do you want to close \[...\]? (Unsaved data will be lost.)"
- AutoSave: ?
- Both on: "Saving data and closing software..." (no warning if quitting directly with X)

### EULA Version

This is the EULA version which is checked when the Accept EULA flag is set, the version is compared to one stored in the 3DS. If the SMDH version is greater, then the user will be prompted to accept the EULA.

| START  | SIZE | DESCRIPTION        |
|--------|------|--------------------|
| 0x202C | 0x01 | EULA Version Minor |
| 0x202D | 0x01 | EULA Version Major |

### 'Optimal Animation Default Frame' (for BNR)

This is a float, indicating the preferred (or 'most representative') frame for the banner animation.

### CEC (StreetPass) ID

This u32 represents the application CEC ID. This is likely loaded by applications for use with the CEC services as well.

## Icon graphics

At offset 0x2040, there are two icons:

| START  | SIZE   | DESCRIPTION                                              |
|--------|--------|----------------------------------------------------------|
| 0x2040 | 0x480  | Small - 24x24 (shown on top screen when pausing the app) |
| 0x24C0 | 0x1200 | Large - 48x48 icon (the general icon)                    |

Both of the icons are encoded in RGB565 meaning 16bpp. Although both icons are known to be RGB565, developers have the option of encoding icons (and banners) with the following encodings :

- RGBA8
- RGB8
- RGBA5551
- RGB565
- RGBA4
- LA8
- HILO8
- L8
- A8
- LA4
- L4
- ETC1
- ETC1A4

This does not necessarily mean the other encodings will be used, it is just that those are the options when compiling. Like we've seen with Super Mario 3D Land Nintendo has changed save file encryption, and likewise they can encode icons and banners differently *should they choose to*. Currently we've seen just RGB565 so don't be fooled if an icon doesn't show up right! It is probably one of these formats above. Although we will probably not see other formats used for a while it's nice to know they have an opportunity to change. Also note that it seems Nintendo stores each pixel in [word-order](https://en.wikipedia.org/wiki/RGBA_color_space), so the actual order of order of each color channel in memory will depend on the endianness.

The data is encoded in tiles (starting from size 8x8, continuing recursively).

If the buffer is like this:

| 0   | 1   | 2   | 3   | 4   | 5   | 6   | 7   | 8   | 9   | 10  | 11  | 12  | 13  | 14  | 15  | 16  |
|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|-----|

Then the image would look like this:

| x=0 | x=1 | x=2 | x=3 | x=4 |
|-----|-----|-----|-----|-----|
| 0   | 1   | 4   | 5   | 16  |
| 2   | 3   | 6   | 7   | ... |
| 8   | 9   | 12  | 13  |     |
| 10  | 11  | 14  | 15  |     |

## Tools

[CiTRUS](CiTRUS "wikilink") - (GUI)(Windows Only) Generating ICN files

[3DSExplorer](3DSExplorer "wikilink") - (GUI)(Windows Only) Parsing ICN files
