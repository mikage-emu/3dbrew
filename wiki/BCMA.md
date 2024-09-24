BCMA is the file format used for the electronic manuals on the Nintendo
3DS. It presumably stands for **B**inary **C**TR **Ma**nual.

## Region and language codes

In several places, three letter uppercase region codes and two letter
lowercase language codes are used. These will be indicated by the italic
placeholders *REG* and *la* respectively on this page.

The following region and language codes are known:

| Region code | Region | Language code | Language        |
|-------------|--------|---------------|-----------------|
| EUR         | Europe | de            | German          |
|             |        | en            | British English |
|             |        | fr            | French          |
|             |        | es            | Spanish         |
|             |        | it            | Italic          |
|             |        | nl            | Dutch           |
|             |        | pt            | Portuguese      |
|             |        | ru            | Russian         |
| JPN         | Japan  | ja            | Japanese        |

## Top-level archive overview

A BCMA file is a regular, uncompressed [DARC](DARC "wikilink") archive
which contains a set of LZ10-compressed DARC archives. These subarchives
contoin files containing either textures in the [BCLIM
format](BCLIM_format "wikilink") or metadata and manual pages in the
binary [CLYT format](CLYT_format "wikilink").

At least the following archives should be found in the top level
archive:

| Archive path                                             | Comment                                                                                             |
|----------------------------------------------------------|-----------------------------------------------------------------------------------------------------|
| [./BcmaInfo.arc](#BcmaInfo.arc "wikilink")               | Archive containing metadata about this manual, such as available languages and version information. |
| [./*REG*_*la*_index.arc](#REG_la_index.arc "wikilink") | Archive containing the table of contents for a specific locale.                                     |
| [./*REG*_*la*_large.arc](#REG_la_size.arc "wikilink")  | Archive containing the pages of the manual in a large font size.                                    |
| [./*REG*_*la*_small.arc](#REG_la_size.arc "wikilink")  | Archive containing the pages of the manual in a small font size.                                    |

Other archives not named here may be present as well. Usually, these
contain locale specific images.

## BcmaInfo.arc

This archive has a single BCLYT file located in *./blyt/BcmaInfo.bclyt*.
This file contains the following panes, all direct children of the
RootPane:

| Pane name   | Pane type | User data         |          |
|-------------|-----------|-------------------|----------|
| Key         | Type      | Value description |          |
| LangInfo    | pan1      | LangNum           | Int\[1\] |
|             |           | Lang_*xxx*       | String   |
| RegionInfo  | pan1      | RegionNum         | Int\[1\] |
|             |           | Region_*xxx*     | String   |
| *REG*       | pan1      | LangNum           | Int\[1\] |
|             |           | Lang_*xxx*       | String   |
| *REG*_*la* | txt1      | TexResNum         | Int\[1\] |
|             |           | TexRes_*xxxx*    | String   |
| VersionInfo | pan1      | CurrentVersion    | Int\[1\] |
|             |           | Description       | String   |

All other properties of the panes seem to be set to a default value and
do not seem to matter.

## *REG*_*la*_index.arc

This archive contains the table of contents for a certain language. This
archive contains exactly one file, *./blyt/Index.bclyt*, which contains
the following panes, all children of the RootPane:

| Pane name        | Pane type | User data         |                  |
|------------------|-----------|-------------------|------------------|
| Key              | Type      | Value description |                  |
| MetaData         | pan1      | PageNum           | Int\[1\]         |
|                  |           | CategoryNum       | Int\[1\]         |
|                  |           | SplitNumL         | Int\[*PageNum*\] |
|                  |           | SplitNumS         | Int\[*PageNum*\] |
| PageTitle_*xxx* | txt1      | *None*            |                  |
| Category_*xxx*  | txt1      | IsValid           | Int\[1\]         |
|                  |           | CategoryPageNum   | Int\[1\]         |
|                  |           | PageID_*xxx*     | Int\[1\]         |

## *REG*_*la*_*size*.arc

These archives actually contain the contents of a page in the manual. It
contains the following files:

| File name                              | Description                                                                             |
|----------------------------------------|-----------------------------------------------------------------------------------------|
| ./blyt/Page_*xxx*_*size*_*y*.bclyt  | Contains the text and foreground images of page number *xxx*, part *y* and size *size*. |
| ./blyt/Page_*xxx*_*size*_bg.bclyt   | Contains all background images on the page.                                             |
| ./blyt/Page_*xxx*_*size*_info.bclyt | Could perhaps contain metadata from the manual editor?                                  |

In the filenames, *xxx* should be replaced by the page number, starting
from 000. *size* should be replaced by either "large" or "small".
Finally, *y* should be replaced by the page part, starting from 0.

[Category:File formats](Category:File_formats "wikilink")