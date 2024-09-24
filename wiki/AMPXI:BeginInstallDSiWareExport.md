# Request

| Index Word | Description                                           |
|------------|-------------------------------------------------------|
| 0          | Header code \[0x004E00C0\]                            |
| 1-2        | u64, Title ID                                         |
| 3          | u8, [DSiWare Export](DSiWare_Exports "wikilink") Type |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x004E0040\] |
| 1          | Result code                |

# Description

This is used by [AM:ImportTwlBackup](AM:ImportTwlBackup "wikilink"),
before any content sections are installed.

First, this checks the export type. If it isn't 5 or 11, this returns
0xE0C08028.

Then, this checks whether or not any ticket is installed for the DSiWare
title to be imported. If none are found, this returns 0xD8A083FA.

After that, if the title being imported is already installed, it is
deleted by using [AMPXI:DeleteTitle](AMPXI:DeleteTitle "wikilink").

Eventually, this ends up calling the internal equivalent of
[AMPXI:InstallTitleBegin](AMPXI:InstallTitleBegin "wikilink").