3DSExplorer peut ouvrir les fichiers 3DS et permet de récupérer quelques
informations comme décrit dans 3DBrew

------------------------------------------------------------------------

**Veuillez utiliser la dernière version. Les anciennes versions ont des
bugs que j'ai corrigés.**

**De plus, veuillez ne pas uploader cette application sur vos serveurs,
mettez simplement le lien Google Code.**

------------------------------------------------------------------------

## Utilisation

Requiert le **.NET Framework 4.0**, téléchargeable
[ici](http://www.microsoft.com/downloads/fr-fr/details.aspx?familyid=9cfb2d51-5ff4-4491-b0e5-b386f32c0992&displaylang=fr).

Peut ouvrir:

- Image des Cartouches CTR ([CCI](CCI "wikilink")/CSU)
- Images des éxécutables CTR ([CXI](CXI "wikilink"))
- Archives importables CTR ([CIA](CIA "wikilink"))
- Icônes CTR ([ICN](ICN "wikilink"))
- Banners CTR ([BNR](BNR "wikilink"))
- Fichers Wave CTR ([CWAV](CWAV "wikilink"))
- Graphiques CTR ([CGFX](CGFX "wikilink"))
- Données du modèle de Banner ([CBMD](CBMD "wikilink"))
- Binaires des sauvegardes ([SAV](Savegames "wikilink")) (décryptés ou
  cryptés)
- Fichiers métadonnées des title ([TMD](TMD "wikilink")),
- Multi-Picture Objects ([MPO](MPO "wikilink")) , (3D Images)

Peut convertir:

- Des vidéos vers des fichier AVI MJPG en 2D ou 3D (Possibilité de
  télécharger directement depuis Youtube)

## Option pour lire les fichiers 3ds/cci/csu à partir de fichiers zip/7z

Compressez simplement votre fichier 3ds/cci/csu dans un fichier 7z ou
zip (avec n'importe quel autre fichier comme par exemple un fichier nfo)

Vous pouvez ensuite l'ouvrir depuis 3dsexplorer. Mais attention,
seulement le premier fichier cxi sera chargé et la fonction sauvegarde
ne sera pas disponible.

(3DSExplorer cherche le premier fichier avec la bonne extension et lit
les 0x5000 premiers bits)

## Journal des changements (En anglais)

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

## Captures d'écran

<figure>
<img src="Screenshot_3dsexplorer.png"
title="File:Screenshot 3dsexplorer.png" />
<figcaption><a href="File:Screenshot">File:Screenshot</a>
3dsexplorer.png</figcaption>
</figure>

## Dernière Build

La dernière build est téléchargeable
[ici](http://3dsexplorer.googlecode.com/svn/trunk/3DSExplorer/bin/3DSExplorer.exe).

Notez que cette version pourrait être buguée...