+++
title = 'AMPXI:MigrateAGBtoSAV'
+++

# Request

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x006500C0\] |
| 1          | Media type                 |
| 2-3        | u64, title ID              |

# Response

| Index Word | Description                |
|------------|----------------------------|
| 0          | Header code \[0x00650040\] |
| 1          | Result code                |

# Description

This reads the raw AGB partition and exports [.SAV
files](SD_Savedata_Backups "wikilink") to SD card. See [3DS Virtual
Console](3DS_Virtual_Console#NAND_Savegame "wikilink") for more info.

Process9 immediately returns 0 (and skips the rest of the function) if
[CFG_BOOTENV](CONFIG_Registers#CFG_BOOTENV "wikilink") is not AGB.