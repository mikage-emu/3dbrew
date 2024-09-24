+++
title = 'Category:File Formats'
+++

The following is a list of known file formats used by the 3DS.

## [NCCH](NCCH "wikilink")

.[CXI](NCCH#CXI "wikilink") - CTR Executable image - Are either packaged
into a CCI/CSU for running off a cartridge, or packaged into a CIA for
installing to the SDMC or NAND.

.[CFA](NCCH#CFA "wikilink") - CTR File Archive - Externalized Rom-FS.
This is non-executable specialisation of the NCCH container format.
Generally used in conjunction with an executable specialisation of the
NCCH container format (CXI).

.[APP](SD_Filesystem#title "wikilink") - The per-console encrypted form
of a NCCH file, used with installed titles, like eShop and CDN
downloads.

.CAA - A CXI which uses a raw ELF for the [ExeFS](ExeFS "wikilink")
.code section. Also has no plain region.

## [NCSD](NCSD "wikilink")

.[CCI](NCSD "wikilink") - CTR Cart image - Burned into a ROM (or loaded
by official debugging hardware). These are also the actual format of ROM
dumps, and the response of read requests between a 3DS and a cartridge.
This is simply a NCCH container, with a maximum of 8 NCCHs.

.[CSU](NCSD "wikilink") - CTR System Update - Format varies slightly
with revisions.

## Descriptor File Formats

.BSF - Descriptive data used when outputting ICN/BNR files. The .XBSF
format used by CiTRUS is based on the concept of .BSF.

.RSF - Descriptive data used when outputting a CCI/CXI file. Specifies
options such as: title, save type, and so on.

.DESC - Descriptive data used when outputting a CCI/CXI file. Like the
.RSF format, but more complex (more complex in the options which it can
specify). The signed NCCH RSA-2048 key pair is taken from this file.

## [ExeFS](ExeFS "wikilink") Related File Formats

.AXF - Pre-assembled ARM code. Before being linked into the
[ExeFS](ExeFS "wikilink") '.code' format. These are ARM specific ELF
files. The Plain Region found in the CXI is also obtained from this
file.

.BNR - Simply contains a .[CBMD](CBMD "wikilink") and a
.[BCWAV](BCWAV "wikilink"). The .[CBMD](CBMD "wikilink") has added
padding, to make sure the .[BCWAV](BCWAV "wikilink") is aligned to 0x10
bytes. It contains nothing else (the .[CBMD](CBMD "wikilink") file's
header is edited to reflect its new size).

.[ICN](SMDH "wikilink") - Contains icons, names and flags for an
application.

## [RomFS](RomFS "wikilink") Related File Formats

.[ARC](ARC "wikilink") - Archive. A container of files, all compressed
with LZ-10.

.[BCMA](BCMA "wikilink") - CTR Manual (an ARC file).

.[SARC](SARC "wikilink") - Simple(?) Archive. A container of
uncompressed files.

.[BCFNT](BCFNT "wikilink") - CTR Font File (version 3).

.[BFFNT](BCFNT "wikilink") - CTR Font File (version 4).

## [Title Installation Related File Formats](Title_Data_Structure "wikilink")

.[CIA](CIA "wikilink") - CTR Importable Archive - This format allows the
installation of titles to the 3DS. CIA files can contain
[NCCH](NCCH "wikilink") files for installation to either the
[SDMC](SD_Filesystem "wikilink") or CTR NAND. CIA files can also contain
.SRL files (format for DS(i) executable images) for installation to the
TWL NAND of the 3DS. Anything distributed over Download Play (including
card software) is created with this format as well.

.[TMD](TMD "wikilink") - Title Meta Data - The format is used with
installed/installable titles. Notably they are found in
.[CIA](CIA "wikilink") files (plain text), on the [SD
card](SD_Filesystem#title "wikilink") (encrypted), NAND (encrypted) and
on Nintendo's CDN (plain text).

.[CMD](Title_Data_Structure "wikilink") - Content Meta Data - The format
is used to index installed .app files for installed titles. It is
encrypted with a console unique [keyslot](AES "wikilink").

.[CTX](Title_Data_Structure "wikilink"), Content Transfer: When
beginning eShop app downloads, this file is created. Later this file is
written with actual data. When the download is completed, the file is
deleted from SD card. (This might then be moved to NAND.) This is
encrypted with a per-console key. It contains a signed cert followed by
unknown data. It is only 1.50kbyte. Here is an
example.[1](http://dl.dropbox.com/u/37418652/00000000.ctx)

## Audio File Formats

.[(B)CWAV](BCWAV "wikilink") - CTR waveform file format

.[(B)CSTM](BCSTM "wikilink") - CTR stream file format

.[(B)CSAR](BCSAR "wikilink")- CTR adaptation of BRSAR.

## Graphics File Formats

.[CBMD](CBMD "wikilink") - CTR Basic Model Data - Archive file before
being made into a CTR banner for games or other applications.

.[CTPK](CTPK "wikilink") - CTR Texture PacKage

.CMDL - CTR MoDeL data

.CTEX - CTR TEXture data

.CCAD - CTR Celluloid Animation Data

.CSKA / .CSKLA - CTR SKeLetal Animation data

.CMATA - CTR MATerial Animation data

.CMDLA - CTR MoDeL Animation data

.CLGT - CTR LiGhT data

.CPTL - CTR ParTicLe data

.CLTS - CTR LookupableSetdata

.CENV - CTR ENVironment data

.CCAM - CTR CAMera data

.CMAT - CTR MATerial

## Other File Formats

.NSA - Archive used by several of the communication protocols in the
3DS.

.[CRO](CRO0 "wikilink") - This is a CTR "DLL".

.[CRS](CRO0 "wikilink") - This is a special CRO format file which
contains symbols for .code (the "static module").

.[CRR](CRR0 "wikilink") - This contains data for verifying CRO files.

.[MPO](MPO "wikilink") - Multi-Picture Object Format - Document
describing the file format used in mpo files:
<http://www.cipa.jp/english/hyoujunka/kikaku/pdf/DC-007_E.pdf>

.CGRP - CTR GRouP - Used to package several formats like (CWAR, CWAV,
CWSD, CBNK, CSEQ, etc...) sort of like the Wii's MRG format. (They
aren't the same structures but both package together several formats.)

## Filesystem

The 3DS filesystem requires absolute paths. It can handle either short
(8.3) and long (255 char maximum) file names.