**This software is vastly outdated. Use
[ctrtool](https://github.com/profi200/Project_CTR/tree/master/ctrtool)
instead!**

3DSExplorer can explore various 3DS-related files and view the
information as described on 3DBrew.

## Usage

Needs **.NET Framework 4.0**, you can get it
[here](http://www.microsoft.com/download/en/details.aspx?id=17851).

Note: If you want to install this program for Mac, Linux, or FreeBSD,
you should install the latest version of Wine with Wine Mono.

It runs well on Linux, but I haven't tested it on Mac OS X.

Opens:

- CTR Cartridge Image files
  ([CCI](NCSD "wikilink")/[CSU](NCSD "wikilink")) (NCSD)
- CTR eXecutable Image files ([CXI](NCCH#CXI "wikilink")) (NCCH)
- CTR File Archives ([CFA](NCCH#CFA "wikilink")) (NCCH)
- CTR Importable Archives ([CIA](CIA "wikilink"))
- CTR Icons ([ICN](SMDH "wikilink")) (SMDH)
- CTR Banners (BNR) (CBMD + BCWAV)
- CTR Waves ([BCWAV](BCWAV "wikilink"))
- CTR Banner Model Data ([CBMD](CBMD "wikilink"))
- CTR Graphics ([CGFX](CBMD "wikilink")) (CBMD)
- [DARC](DARC "wikilink") (file containers) / [BCMA](BCMA "wikilink")
  CTR-Manuals
- Save Flash binaries ([SAV](Savegames "wikilink")) (decrypted or
  encrypted)
- Title meta data files ([TMD](TMD "wikilink")),
- Multi-Picture Objects ([MPO](MPO "wikilink")) , (3D Images)

Converts:

- Videos to 2D/3D MJPG AVI files for the 3DS (can download directly from
  YouTube)

Some of the file formats can be saved with replaced contents.

## Option for reading 3DS/CCI/CSU files from ZIP/7Z files

Just compress your 3DS/CCI/CSU file into a 7Z or ZIP (with any other
file you want like NFO file)

Then you can open it from 3DSExplorer. **But be aware that only the
first CXI will be loaded and saving capabilities will not be
available.**

(3DSExplorer looks for the first file with the proper extension and
reads the first 0x5000 bytes)

## Upcoming features

for v1.6

- Extracting binaries from CIA like ctrtool does.

## Change log

v1.5.3

- Revert supertrim from deleting the last partition record.

v1.5.2

- Added Trim, Un-Trim and SuperTrim for CCI by 3DSGuy (aka ps3hen)

\+ (Open up a CCI file and a new menu "CCI" will appear.)

v1.5.1

- MPO: Added some info found by Thib
- Fixed: title.db update process.
- Parentool 3ds algorithm fixed (was wrong)

v1.5

- Added: QR Tool
- Added: Parental Control Unlocker (for 3DS as found by neimod, and for
  the DSi/Wii as on marcan's site)

v1.4

- Added: support for BCMA/DARC files/containers.
- Added: DSDecmp GUI for compression/decompression of LZ-10/11/Ovl &
  Huffman4/8.
- Updated: XOR Tool's file text boxes accept drag&drop (DSDecmp GUI's
  also).

v1.3 (3DSGuy)

- Added \*.cfa as an openable file (associated with CXI module)
- Used more general terms for CXI/CFA and 3DS/CCI/CSU with NCCH and NCSD
  respectively, while the general terms are more broad, they are
  correct, as a CFA file is not a CXI file.
- Fixed the Number of NCCH from 13 to 8 in the CCI module
- Changed the NCSD header readings to match the current specs on 3DBrew,
  with the exception of the "ExHeader size/Exheader Hash", as they are
  always zero in every NCSD.
- Made the ExHeader an extractable file from NCCH files.

v1.2.1

- fixed opening of cia files (thanks 3dsguy)
- updated title.db up to release \#183

v1.2

- Added: The product codes and maker codes are now in a file called
  title.db
- Added: 3ds/cci/csu can be opened from zip/7z files with limited
  information (cci,1st cxi & crc32)

v1.1.1

- fixed file tree activation bugs
- fixed some typos
- CCI: added an option to save cxi file (right click the CXI node in the
  file tree)

v1.1 - Happy Holidays

- New opens CXI files
- New opens CSU files (CTR System update - same as CCI)
- New opens ICN files (CTR Icons)
- Added QuickCRC32 tool to check for authenticity (also added CRC32 to
  hash tool)
- Generalized the explorer (the source code of the explorer is general,
  now it would be easier to add more file formats)
- 3D Video converter: Progress is working, fixed a lot, now works almost
  flawlessly.
- CCI: Added more information to the header.
- MPO: Added Nintendo's MakerNote structure.

v1.0

- Better late then ever...update to v1.0 so I can continue with the
  regular

version giving.

- Added MPO support (3D Images taken by the 3ds camera)
- 3D Video Conversion tool to convert youtube 3d videos to 3DS-3D MJPG
  videos...
- more bug fixes (as always)

v0.96

- Moved to .NET Framework 4.0 (because of OpenGL Support)
- Improved SRAM key search algorithm (fixes Starfox 3D)
- Added initial support for CWAV, CGFX
- New nifty about screen (3d logo)
- Preparations made for wav (CWAV) & 3d model (CMDL) decoding (WIP)
- Now the application needs 2 external DLLs for SharpGL

v0.9

- Now checks for update on startup (can be disabled)
- Added link to the Google-code site
- CIA: Can replace icons with any picture you want (Saving enabled)
- More bug fixes

v0.89

- CIA: Icons color mapping corrected (It's RGB565)
- ImageBox now has a zoom button.
- XOR Tool: New features: Xor byte arrays, AES-ctr sandbox.
- More bug fixes and mostly source code redesign

v0.83

- CIA: Fix: Correct Ticket
- CIA: Icon color mapping fixed (RGB -\> GBR)

v0.82

- CIA: Added Banner icons viewing (Double click an icon to show it in
  the Banner's Metadata section)

v0.81

- Fix bug when opening TMD files

v0.8

- CIA support
- Changed GUI + Skin
- Fixed some bugs

v0.7

- More information on sav files
- Now all information is grouped
- Bug fixes for all contexts
- Hash tool supports HMAC
- Source code rewritten for optimization..
- \[Experimental\] Can now replace original files into sav image and
  save it to a new created sav file.

v0.62

- Bug fixes
- Rearranged the gui
- Now the exe file is a release and not a debug.
- Context menu for files in the filesystem list.

v0.61

- Fix for DATA partitions files save (wrong offsets)...
- Can now be associated with sav/bin/3ds/tmd files to open files from
  the explorer...
- Hashtool and XORtool can be opened while working with the explorer
  part of the program.

v0.6

- New GUI
- Improved algorithms (SAV files mainly)
- More information shown
- NEW and improved Hash Tool.

v0.55

- Works with most save files.
- More of the save structure understood
- Saving of files from the sav image fixed.

v0.53

- Fix for the tmd (now has certificates)
- TMD: Still not supporting SHA1 type

v0.52

- TMD now works
- Save opening was improved
- No question rather it's encrypted or not (autodetect)

v0.51

- fix for save files from save image
- feature: save image file from sav binary

v0.5

- new GUI now has file box
- fix for a few save files
- now can save files from save and 3ds (from 3ds still encrypted) by
  double clicking a file.
- when opening a crypted save you can save the key to a file
- now on google code using SVN (moved from github)

v0.3

- changed the name of the application
- initial work on opening save binary files
- already opens save binary files, decrypts them and shows some info

<!-- -->

- I'll be happy to get some help from you guys on this...

v0.1

- opens 3DS files and creates a treeview with the information
- can't decrypt the ExeFS (as no key yet to be found)

## Screen shot

<figure>
<img src="Screenshot_3dsexplorer.png"
title="File:Screenshot 3dsexplorer.png" />
<figcaption><a href="File:Screenshot">File:Screenshot</a>
3dsexplorer.png</figcaption>
</figure>

## Latest Build

You can download the latest build
[here](http://3dsexplorer.googlecode.com/svn/trunk/3DSExplorer/bin/3DSExplorer.exe).

Notice that this version may have unexpected output (broken files,
corrupted data, broken dreams, etc.), as it is the latest development
version available...
