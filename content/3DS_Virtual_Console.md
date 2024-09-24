+++
title = '3DS Virtual Console'
+++

There are several types of VC titles: NES/GB/GBC VC titles, SNES VC
titles, GameGear VC titles and GBA VC titles. Except for GBA VC, the
games are ran using emulators.

# NES/GB/GBC VC

An emulator application + VC ROM in the NCCH [RomFS](RomFS "wikilink")
(among other things in the RomFS).

The original emulator builds include support for all these three
platforms, not specific to just the included ROM platform. However,
releases intended for NES games have a red menu, optional switching
between the two controllers, a different X button mapping (B instead of
menu), optional [Download Play](Download_Play "wikilink") support, and
[a never used multi-rom
support](http://s27.postimg.org/60v4yuw8z/IMG_20140921_001103.jpg);
while Game Boy versions have a green theme and optional 3D border.

Early builds (of Ambassador NES games at least) did not support
savestates.

The emulator officially used for Pokemon games removes savestate support
in favor of a Link Cable "implementation" involving hooking the games'
network functions according to the patch files. ([Partial documentation
of the patch
format](https://gbatemp.net/attachments/vc-wireless-link-patch-documentation-txt.72966/))

This emulator includes GBA support, however the GBA emulation for this
this is somewhat slow. This was presumably implemented before AGB_FIRM
was.

Unlike Wii VC, the 3DS VC ROMs for NES use [the "TNES"
header](http://pastebin.com/KLeWt2W3).

## RomFS

- "rom:/rom/" This directory contains the ROM file(s). Filenames used
  under here don't matter: the filename is determined by the emulator
  app by doing a directory read.
- "rom:/shaders/" This directory contains GPU shaders used by the
  emulator app: .shbin, .csdr, and .obj.
- "rom:/VCM/" This directory contains graphics, audio, and text used by
  the emulator app.
- "rom:/agb.bin" GBA BIOS.
- "rom:/buildtime.txt" Emulator app build timestamp.
- "rom:/config.ini" Emulator configuration .ini, contains sections for
  all supported 3DS VC platforms.
- "rom:/<rom_name>.patch" rom_name = filename from the rom directory.
  This .ini contains patches for the ROM.
- "rom:/shader.shbin" GPU shader.

## Savedata

The savedata can contain:

- "rsm1.dat": Same format as the below rsm2.dat. Probably used for the
  "restore-point".
- "rsm2.dat": Current emulator save-state, for storing/loading state at
  VC-title launch/exit.
- "sav.dat": The actual savedata used by the emulated ROM.
- "SecureValue": The random number used by [Anti Savegame
  Restore](Anti_Savegame_Restore "wikilink"). No known version of the
  emulator implements both savestates and secure value.

Overwriting sav.dat with 0xFF-bytes doesn't have any affect on the
actual emulator. Doing that with most of the rsm\*.dat data doesn't
crash anything.

# SNES VC

An emulator application + VC ROM in the NCCH [RomFS](RomFS "wikilink")
(among other things in the RomFS). SNES VC titles are New 3DS exclusive.

## RomFS

- "rom:/ErrorMessage/" This directory contains text used by the emulator
  app.
- "rom:/shader/" This directory contains .shbin GPU shaders used by the
  emulator app.
- "rom:/VCM/" This directory contains text used by the emulator app.
- "rom:/caravel.bcsar" This file contains audio used by the emulator
  app.
- "rom:/ctrl_change.arc" This file contains graphics used by the
  emulator app.
- "rom:/data.bin" This file contains the ROM and other data. See below
  for documentation.
- "rom:/ErrorMessage.arc" This file contains graphics used by the
  emulator app.
- "rom:/KTR-XXXX.icn" Copy of the SMDH of the game.
- "rom:/shader.shbin" GPU shader.
- "rom:/nnfont_RectDrawerShader.shbin" GPU shader.
- "rom:/VCM.arc" This file contains graphics used by the emulator app.

### data.bin structure

The file begins with a header (all values are little-endian):

| START | SIZE | DESCRIPTION                                                                                                                                                                                                            |
|-------|------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x00  | 0x4  | Always 0x00000100                                                                                                                                                                                                      |
| 0x04  | 0x4  | File size                                                                                                                                                                                                              |
| 0x08  | 0x4  | Always 0x00000030                                                                                                                                                                                                      |
| 0x0C  | 0x4  | Always 0x00000050                                                                                                                                                                                                      |
| 0x10  | 0x4  | Start of the ROM (always 0x00000060 in official VC)                                                                                                                                                                    |
| 0x14  | 0x4  | End of the ROM                                                                                                                                                                                                         |
| 0x18  | 0x4  | Start of the footer region (presumably an index for the PCM audio samples). Matches end of file/file size if PCM data is missing                                                                                       |
| 0x1C  | 0x4  | Always 0                                                                                                                                                                                                               |
| 0x20  | 0x4  | Start of decompressed SDD-1 graphics data region. Matches end of file/file size if no SDD-1 chip is present                                                                                                            |
| 0x24  | 0x8  | Product ID (KTR-XXXX), determines filenames in savedata                                                                                                                                                                |
| 0x2C  | 0x4  | Always 0                                                                                                                                                                                                               |
| 0x30  | 0x1  | Emulation speed in FPS (always 0x3C in official VC)                                                                                                                                                                    |
| 0x31  | 0x3  | ROM size                                                                                                                                                                                                               |
| 0x34  | 0x1  | Always 0                                                                                                                                                                                                               |
| 0x35  | 0x3  | Size of the converted PCM audio samples region (starting after ROM). 0 if PCM data is missing                                                                                                                          |
| 0x38  | 0x1  | Always 0                                                                                                                                                                                                               |
| 0x39  | 0x2  | Footer region size. 0 if PCM data is missing                                                                                                                                                                           |
| 0x3B  | 0x2  | Always 0                                                                                                                                                                                                               |
| 0x3D  | 0x2  | Preset ID (varies for each game). A full list of know Preset IDs (shared by WiiU/SNESC/Switch SNES emulators) can be found [here](https://docs.google.com/spreadsheets/d/1PbIPVA4NpFEXs1zk249aR3FSuBTY3r-ajpTq3dP3GnQ) |
| 0x3F  | 0x1  | Always 0x2                                                                                                                                                                                                             |
| 0x40  | 0x1  | Sound volume                                                                                                                                                                                                           |
| 0x41  | 0x1  | ROM type (0x15 == HiROM/0x14 == LoROM)                                                                                                                                                                                 |
| 0x42  | 0xE  | Always 0                                                                                                                                                                                                               |
| 0x50  | 0x4  | Always 0x00000003                                                                                                                                                                                                      |
| 0x54  | 0x4  | Always 0x00000001                                                                                                                                                                                                      |
| 0x58  | 0x8  | Always 0                                                                                                                                                                                                               |

The 0x60 header is followed by the SNES ROM, often altered to replace
audio samples with pointers to external PCM audio files converted from
the game, presumably to speed up emulation (these pointers can be found
by looking for "PCMF" in the ROM, as seen on [Wii
VC](https://github.com/Plombo/vcromclaim/blob/master/snesrestore.py)).
The ROM is then optionally followed by the PCM audio files, by the SDD-1
decompressed graphics data (the emulator doesn't properly emulate the
chip, presumably because of hardware constraints) and by a footer which
appears to be an index for the PCM audio data. There are no separate
setting fields for individual cart features, and it appears that the
emulator has "game presets" stored in its own code, which determine the
game-specific settings (such as the expansion chip, and presumably the
presence of SRAM), selectable via the preset ID in the header. Each
official VC release has [a different preset
ID](https://docs.google.com/spreadsheets/d/1PbIPVA4NpFEXs1zk249aR3FSuBTY3r-ajpTq3dP3GnQ/edit#gid=490971147).
The supported SNES expansion chips are: DSP1, C4 and DSP2.

A similar structure can be found on the Wii U, SNES Classic and Switch
Mini emulator
[1](https://gist.github.com/anpage/c1085055db0242ea3c7558dab56712a5)

## Savedata

The savedata contains:

- "KTR-XXXX.cfg": Appears to contain the "preset ID" and possibly more
  game/save information.
- "KTR-XXXX.vea": Current emulator save-state, for storing/loading state
  at VC-title launch/exit.
- "KTR-XXXX.ves": The actual savedata used by the emulated ROM.

Filenames are determined in the ROM header.

# GBA VC

GBA VC is run by [AGB_FIRM](FIRM "wikilink"). RomFS isn't used for GBA
VC titles, but can be found empty within GBA VC titles. The NCCH
[ExeFS](ExeFS "wikilink") contains the same files as a normal
application. The [ExeFS](ExeFS "wikilink"):/.code contains the GBA VC
ROM followed by a 0x360 byte long footer.

### Footer

All values in the GBA VC footer and related structures are
little-endian.

| START | SIZE | DESCRIPTION                           |
|-------|------|---------------------------------------|
| 0x00  | 0x4  | Magic '.CAA'                          |
| 0x04  | 0x4  | Must be 1                             |
| 0x08  | 0x4  | Offset to array of config descriptors |
| 0x0C  | 0x4  | Number of config descriptors \<\< 4   |

#### Config descriptor

| START | SIZE | DESCRIPTION                                                                                                                                                                                      |
|-------|------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0x0   | 0x4  | If 1, then this config descriptor is used. If 0, and the following value is not 0, then the GBA VC load fails outright (causes result 0xC900464F). Otherwise, this config descriptor is skipped. |
| 0x4   | 0x4  | Offset to config                                                                                                                                                                                 |
| 0x8   | 0x4  | Size of config (unused by the function that parses this, which hardcodes the config size (0x324) to memcpy)                                                                                      |
| 0xC   | 0x4  | Padding                                                                                                                                                                                          |

#### Config

<table>
<thead>
<tr class="header">
<th><p>START</p></th>
<th><p>SIZE</p></th>
<th><p>DESCRIPTION</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x000</p></td>
<td><p>0x4</p></td>
<td><p>Padding</p></td>
</tr>
<tr class="even">
<td><p>0x004</p></td>
<td><p>0x4</p></td>
<td><p>GBA ROM Filesize</p></td>
</tr>
<tr class="odd">
<td><p>0x008</p></td>
<td><p>0x4</p></td>
<td><p>Save type (see below for supported values and <a
href="../ARM7_Registers#ARM7_SAVE_MODE" title="wikilink">here</a> for
details)</p></td>
</tr>
<tr class="even">
<td><p>0x00C</p></td>
<td><p>0x2</p></td>
<td><p>Padding (set to FF FF usually?)</p></td>
</tr>
<tr class="odd">
<td><p>0x00E</p></td>
<td><p>0x2</p></td>
<td><p>Sleep mode button combo (utilizes the same bit masks as the <a
href="../HID_Registers#HID_PAD" title="wikilink">HID_PAD register</a>, with
flipped bits).<br />
If the GBA title supports a button-combo based sleep mode and it's set
here, Agbbg spoofs this combo when closing the 3DS' lid to enter proper
sleep mode.</p></td>
</tr>
<tr class="even">
<td><p>0x010</p></td>
<td><p>0x10</p></td>
<td><p>Flash and EEPROM configuration (see the target registers <a
href="../ARM7_Registers" title="wikilink">here</a>)</p></td>
</tr>
<tr class="odd">
<td><p>0x020</p></td>
<td><p>0x4</p></td>
<td><p>LCD ghosting (01-FF, lower values equal more ghosting)</p></td>
</tr>
<tr class="even">
<td><p>0x024</p></td>
<td><p>0x300</p></td>
<td><p>Video LUT (black to full, rgbrgbrgb...)?,<br />
three different types of this data have been observed.</p></td>
</tr>
</tbody>
</table>

Save types:

- 0x0: EEPROM 8k for \< 256 Mbit titles
- 0x1: EEPROM 8k for 256 Mbit titles
- 0x2: EEPROM 64k for \< 256 Mbit titles
- 0x3: EEPROM 64k for 256 Mbit titles
- 0x4: Flash 512k (Atmel, ID: 0x3D1F) + RTC
- 0x5: Flash 512k (Atmel, ID: 0x3D1F)
- 0x6: Flash 512k (SST, ID: 0xD4BF) + RTC
- 0x7: Flash 512k (SST, ID: 0xD4BF)
- 0x8: Flash 512k (Panasonic, ID: 0x1B32) + RTC
- 0x9: Flash 512k (Panasonic, ID: 0x1B32)
- 0xA: Flash 1Mbit (Macronix, ID: 0x09C2) + RTC
- 0xB: Flash 1Mbit (Macronix, ID: 0x09C2)
- 0xC: Flash 1Mbit (Sanyo, ID: 0x1362) + RTC
- 0xD: Flash 1Mbit (Sanyo, ID: 0x1362)
- 0xE: SRAM/FRAM 256k

Everything above 0xE results in no save chip and nothing being saved to
NAND.

### NAND Savegame

AGB_FIRM saves its active save memory to NAND on exit, this is then
immediately picked up by NATIVE_FIRM on reboot by checking
[CFG_BOOTENV](CONFIG_Registers#CFG_BOOTENV "wikilink"). From there, this
is verified and copied out to SD (also see below). The savegame format
is as follows:

| START | SIZE  | DESCRIPTION                                                                                                   |
|-------|-------|---------------------------------------------------------------------------------------------------------------|
| 0x0   | 0x4   | Magic ('.SAV')                                                                                                |
| 0x4   | 0xC   | Always 0xFF                                                                                                   |
| 0x10  | 0x10  | AES-CMAC of the SHA256 hash of 0x30..0x200 + the entire save itself, keyslot 0x24, keyY from process9 .rodata |
| 0x20  | 0x10  | Always 0xFF                                                                                                   |
|       |       |                                                                                                               |
| 0x30  | 0x4   | Always 0x1                                                                                                    |
| 0x34  | 0x4   | Number of times saved (unused?)                                                                               |
| 0x38  | 0x8   | AGB TitleID                                                                                                   |
| 0x40  | 0x10  | SD card CID from the console the save was made on (verified on load)                                          |
| 0x50  | 0x4   | Save start addr (always 0x200)                                                                                |
| 0x54  | 0x4   | Save size                                                                                                     |
| 0x58  | 0x8   | Always 0xFF (?)                                                                                               |
| 0x60  | 0x4   | See [here](ARM7_Registers "wikilink")                                                                         |
| 0x64  | 0x4   | See [here](ARM7_Registers "wikilink")                                                                         |
| 0x68  | 0x198 | Always 0xFF                                                                                                   |

### NAND Savegame on SD

A NAND savegame copied to the SD by process9 is identical to its
counterpart on the NAND partition, save for the CMAC. For SD copies on
retail units, the CMAC is recalculated as the AES-CMAC of the (SHA256
hash of ("CTR-SIGN" + AGB TitleID (little endian) + SHA256 hash of
("CTR-SAV0" + SHA256 hash of (0x30..0x200 + the entire save itself)))),
using keyslot 0x30 set up with the keyY from movable.sed. For SD copies
on devkit units, the CMAC is recalculated using the SHA256 hash of
0x30..0x200 + the entire save itself, using a different key from
process9 .rodata.
