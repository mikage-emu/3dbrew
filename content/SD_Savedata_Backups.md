## Overview

Introduced in [6.0.0-11](6.0.0-11 "wikilink"), users are able to backup
[savedata](Savegames "wikilink") for titles installed to SDMC, to a
maximum of 30 'slots'. Users can backup savedata while in the [Home
Menu](Home_Menu "wikilink"), available as an option when selecting an
application. In [System Settings](System_Settings "wikilink"), user are
able to backup, restore and delete savedata backups. There are however,
[restrictions](SD_Savedata_Backups#Restrictions "wikilink").

## Backups

Savedata backups are located in the directory:

`sdmc:/Nintendo 3DS/`<ID0>`/`<ID1>`/backups`

The savedata backup directory structure(this structure is repeated for
every slot):

`backups`
`└───XXX`
`    └───`<Application TitleID>

- **XXX** - A three digit hexadecimal number representing the slot
  number i.e. (000-01d).
- **<Application TitleID>** - This directory contains a verbatim backup
  of files in the title's "data" directory(where the save file is
  located).

There can only be one savedata per slot, and details about the slots are
recorded in [Backup.dat](System_Settings#ExtData "wikilink") and hence
cannot manually be created. For recovery reasons, if
[Backup.dat](System_Settings#ExtData "wikilink") is damaged, details
about the backup slots will be recreated from the files in the backup
directory.

## Restrictions

Some titles are restricted in how their saves are backed up. These
restricted saves can can only be backed up when the title is deleted and
can only be restored once. GBA titles however are not allowed to be
backed up at all, the reasons for this are unknown. This restriction is
triggered if a [certain flag](SMDH#Byte.5B1.5D "wikilink") in the
title's icon is set. Or if the SaveID of the title is located in the
[ctr_backup_black_list](NS_CFA "wikilink") file in the NS CFA, which is
practically a Unique-ID blacklist. The titles blacklisted in the
[ctr_backup_black_list](NS_CFA "wikilink"), are:

### Regular 3DS Titles

| JPN UniqueID            | USA UniqueID | EUR UniqueID | Title Name                                |
|-------------------------|--------------|--------------|-------------------------------------------|
| 000950                  | 000ba8       | 000ba9       | Pokemon Mystery Dungeon                   |
| 00055d                  | 00055d       | 00055d       | Pokemon X                                 |
| 00055e                  | 00055e       | 00055e       | Pokemon Y                                 |
| 000343                  | 000465       | 0004b3       | Cubic Ninja                               |
| 000481                  | 000ae4       | 000b1d       | Monster Hunter 3G                         |
| 0004b5 (added 6.3.0-12) | ?            | ?            | Monster Hunter 4                          |
| ?                       | 00048d       | 0005f6       | Reel Fishing 3D Paradise                  |
| 0004d7                  | 00066c       | 00066d       | Pokemon Rumble Blast                      |
| ?                       | ?            | 000933       | Freakyforms Deluxe                        |
| ?                       | 000ae1       | ?            | Pokemon Dream Radar                       |
| 0009f6                  | ?            | ?            | Senran Kagura Burst: Guren no Shoujotachi |
| 000a4d                  | ?            | ?            | Sengoku Musou Chronicle 2nd               |
| ?                       | ?            | 0008c9       | Marvel Pinball 3D                         |
| 000862                  | 000863       | 000864       | Animal Crossing: New Leaf                 |
| 000321                  | ?            | ?            | New Love Plus                             |
| 00065e                  | ?            | ?            | Dragon Quest VII - Eden no Senshitachi    |
| 0006d2                  | ?            | ?            | Fantasy Life                              |
| ?                       | ?            | ?            | Dillon's Rolling Western                  |
| ?                       | ?            | ?            | Zen Pinball 3D                            |

### Virtual Console Titles

| JPN UniqueID | USA UniqueID | EUR UniqueID | Title Name                            |
|--------------|--------------|--------------|---------------------------------------|
| 000748       | 000749       | 00074a       | F-Zero: Maximum Velocity              |
| 00074b       | 00074c       | 00074d       | Mario Kart Super Circuit              |
| 00074e       | 00074f       | 000750       | Wario Land 4                          |
| 000752       | 000753       | 000754       | Yoshi's Island: Super Mario Advance 3 |
| 000755       | 000756       | 000757       | Metroid Fusion                        |
| 000758       | 000759       | 00075a       | WarioWare Inc: Mega Microgame         |
| 00075b       | 00075c       | 00075d       | Kirby & The Amazing Mirror            |
| 000766       | 000767       | 000768       | Mario vs Donkey Kong                  |
| 000769       | 00076a       | 00076b       | Fire Emblem: The Sacred Stones        |
| 00076c       | 00076d       | 00076e       | The Legend of Zelda: The Minish Cap   |

### Unsorted

| UniqueID | Title Name                                                                   |
|----------|------------------------------------------------------------------------------|
| 000395   | Animal Resort - Dobutsuen o Tsukurou                                         |
| 000496   | Fish Eyes 3D (JP)                                                            |
| 000528   | ?                                                                            |
| 0005dc   | ?                                                                            |
| 0006a2   | ?                                                                            |
| 00072a   | Shin Sangoku Musou VS (JP)                                                   |
| 000732   | ?                                                                            |
| 000775   | ?                                                                            |
| 0007fc   | Zen Pinball 3D (US)                                                          |
| 000863   | Animal Crossing: New Leaf (US)                                               |
| 0008c3   | Tomodachi Life (US)                                                          |
| 0008c4   | Tomodachi Life (EU)                                                          |
| 0008c5   | Tomodachi Collection: Shin Seikatsu (JP)                                     |
| 0008c8   | ?                                                                            |
| 0008e3   | ?                                                                            |
| 0008fa   | ?                                                                            |
| 000913   | ?                                                                            |
| 0009aa   | ?                                                                            |
| 0009d6   | ?                                                                            |
| 0009fa   | Freakyforms Deluxe: Your Creations, Alive! (US)                              |
| 000a27   | Monster Hunter 3G Data Shuusei Program (JP)                                  |
| 000b4a   | Tongari Boushi to Mahou no Machi (JP)                                        |
| 000bae   | ?                                                                            |
| 000c34   | Osawari Tantei Ozawa Rina Rising 3: Nameko wa Banana no Yume wo Miruka? (JP) |
| 000c6f   | Monster Hunter 3 Ultimate Data Transfer Program (US)                         |
| 000c71   | Monster Hunter 3 Ultimate Data Transfer Program (EU)                         |
| 000c72   | ?                                                                            |
| 000c9e   | ?                                                                            |
| 000cc5   | ?                                                                            |
| 000cc6   | ?                                                                            |
| 000cfd   | ?                                                                            |
| 000d10   | ?                                                                            |
| 000d2e   | ?                                                                            |
| 000d4a   | ?                                                                            |
| 000e68   | ?                                                                            |
| 000edc   | ?                                                                            |