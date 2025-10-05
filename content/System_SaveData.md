+++
title = 'System SaveData'
+++

Savegames stored in NAND are located at [nand:/data/<ID0>/sysdata/<SaveID-Low>/<SaveID-High>](Flash_Filesystem "wikilink"), where SaveID-High is the filename. SaveID-High is normally 00000000.

Access to system savedata via [fs:USER](Filesystem_services "wikilink") is determined by the [exheader_storageinfo](NCCH#cxi "wikilink") accessinfo and systemsavedataid. Most ARM11 processes using fs:USER only have access to the SaveIDs specified by systemsavedataid, when a certain accessinfo bit is set the process can access all system-savedata however. The 8-byte systemsavedataid is two SaveID-Low words which the process has access to, normally only the first word is used. When the process doesn't have access to any system-savedata via systemsavedataid, systemsavedataid is all-zero.

# NAND Savegames

The SaveID for system modules is usually 0x00010000 \| [uniqueID](Titles "wikilink"). The SaveID for other system processes (like applications) is 0x00020000 \| [uniqueID](Titles "wikilink").

## System Module Savegames

| SaveID | Description |
|----|----|
| 0x0001000F | [FS](Filesystem_services "wikilink") module savedata, used for [SEEDDB](Filesystem_services#seeddb "wikilink") and [TITLETAG](Filesystem_services#titletag_database "wikilink") storage. |
| 0x00010011 | [FS](Filesystem_services "wikilink") module savedata, used for [Anti Savegame Restore](Filesystem_services#anti_savegame_restore "wikilink"). |
| 0x00010015 | [AM](Application_Manager_Services "wikilink") module savedata |
| 0x00010017 | [Config Savegame](Config_Savegame "wikilink") |
| 0x00010022 | [PTM](PTM "wikilink") [savegame](PTM_Savegame "wikilink") |
| 0x00010026 | [CECD](StreetPass "wikilink") [savegame](CECD_Savegame "wikilink") |
| 0x0001002C | [NIM](NIM_Services "wikilink") savegame |
| 0x00010032 | [Friends module savegame](FRD_Savegame "wikilink") |
| 0x00010034 | [BOSS](SpotPass "wikilink") module [savegame](BOSS_Savegame "wikilink") |
| 0x00010035 | News module savegame |
| 0x00010038 | Act module savegame |
| 0x00010040 | [NFC](NFC_Services "wikilink") module savegame |

## System application and applet savegames

| JPN SaveID | USA SaveID | EUR SaveID | Description |
|----|----|----|----|
| 0x000200C5 | Same as JPN | Same as JPN | "error" applet savegame |
| 0x00020082 | 0x0002008F | 0x00020098 | [Home Menu](Home_Menu "wikilink") savegame |
| 0x00020086 | 0x00020092 | 0x0002009B | Instruction Manual applet savegame |
| 0x00020087 | 0x00020093 | 0x0002009C | Game Notes applet savegame |
| 0x00020088 | 0x00020094 | 0x0002009D | Old3DS/New3DS [Internet Browser](Internet_Browser "wikilink") savegame |
| 0x0002008D | 0x00020096 | 0x0002009F | Friend List applet savegame |
| 0x000200BB | Same as JPN | Same as JPN | Additional savedata for the New3DS [Internet Browser](Internet_Browser "wikilink"). This only contains "t.bin" with filesize 0xadf80. This contains all browser history: each entry has the URL, UTF-16 title string, and icon gfx. This includes old pages which are not currently open in the browser as tabs? |
| 0x000200BC | 0x000200BD | 0x000200BE | olv applet savegame (Miiverse) |
| 0x000200C6 | Same as JPN | Same as JPN | mint applet savegame |
| 0x00020200 | 0x00020210 | 0x00020220 | [System Settings](System_Settings "wikilink") savegame |
| 0x00020202 | 0x00020212 | 0x00020222 | [Activity Log](Activity_Log "wikilink") application savegame |
| 0x00020204 | 0x00020214 | 0x00020224 | [Nintendo 3DS Camera](Nintendo_3DS_Camera "wikilink") application savegame |
| 0x00020205 | 0x00020215 | 0x00020225 | [Nintendo 3DS Sound](Nintendo_3DS_Sound "wikilink") application savegame |
| 0x00020207 | 0x00020217 | 0x00020227 | [Mii Maker](Mii_Maker "wikilink") application savegame |
| 0x00020208 | 0x00020218 | 0x00020228 | [StreetPass Mii Plaza](StreetPass_Mii_Plaza "wikilink") application savegame |
| 0x00020209 | 0x00020219 | 0x00020229 | [eShop](eShop "wikilink") application savegame |
| 0x0002020A | 0x0002021A | 0x0002022A | [System Transfer](System_Transfer "wikilink") savegame |
| 0x0002020B | 0x0002021B | 0x0002022B | [Nintendo Zone](Nintendo_Zone "wikilink") savegame |
| 0x0002020D | 0x0002021D | 0x0002022D | [Face Raiders](Face_Raiders "wikilink") savegame |
| 0x0002020E | 0x0002021E | 0x0002022E | [AR Games](AR_Games "wikilink") savegame |
| 0x000202BF | 0x000202C0 | 0x000202C1 | act (NNID settings) application savegame |
| 0x00020231 | 0x00020241 | 0x00020251 | [microSD Management](microSD_Management "wikilink") application savegame |
