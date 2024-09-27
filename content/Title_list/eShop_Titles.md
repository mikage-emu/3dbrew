+++
title = 'EShop Titles'
+++

[Go Back to Title list](Title_list "wikilink")

## Overview

This titleID-High (00040000) is also used for gamecard applications. The
[CXI](NCCH#cxi "wikilink") for retail applications available via
gamecard and eShop are exactly the same, except the exheader differs.
For SD applications exheader_systeminfoflags.flag
[bit1](NCCH#ncch_specs "wikilink") is set, for gamecard applications
this bit is clear. The ExeFS and RomFS are exactly the same for the
gamecard/eShop versions. The eShop version of the CXI has additional
padding.

When mounting the gamecard, the NATIVE_FIRM code compares the gamecard
programID with the application programIDs for each region of Ridge
Racer. When the gamecard programID matches the Ridge Racer programID,
this code will set a flag, however it's unknown what this flag is used
for. This is probably used for the Ridge Racer fix implemented with
[2.1.0-3](2.1.0-3 "wikilink").

## List

| TitleID Low | Region | Description                                                   | Versions                                                       |
|-------------|--------|---------------------------------------------------------------|----------------------------------------------------------------|
| 00032600    | ALL    | Pokédex 3D                                                    | v0, v16                                                        |
| 00040800    | USA    | Super Mario Land                                              | v16, v32                                                       |
| 00040A00    | EUR    | Super Mario Land                                              | v16, v32                                                       |
| 00042A00    | EUR    | The Legend of Zelda: Link's Awakening DX                      | v0, v16                                                        |
| 0004AA00    | USA    | [Nintendo Video](Nintendo_Video "wikilink")                   | v0                                                             |
| 0004AB00    | EUR    | [Nintendo Video](Nintendo_Video "wikilink")                   | v0, v3072, v3172                                               |
| 00051600    | JPN    | [Swapnote](Swapnote "wikilink")                               | v0, v1024, v2064                                               |
| 00051700    | USA    | [Swapnote](Swapnote "wikilink")                               | v0, v1024, v2064                                               |
| 00051800    | EUR    | [Nintendo Letter Box](Swapnote "wikilink")                    | v0, v1024, v2064                                               |
| 00056C00    | JPN    | [Flipnote Studio 3D](Flipnote_Studio_3D "wikilink")           | v64, v2192                                                     |
| 00057700    | USA    | Netflix                                                       | v0, v32                                                        |
| 0005AD00    | JPN    | Kid Icarus Uprising E3 Video                                  | v0                                                             |
| 0005AE00    | USA    | Kid Icarus Uprising E3 Video                                  | v0                                                             |
| 0005AF00    | JPN    | Paper Mario E3 Video                                          | v0                                                             |
| 0005B000    | USA    | Paper Mario E3 Video                                          | v0                                                             |
| 0005B100    | JPN    | Mario Kart E3 Video                                           | v0                                                             |
| 0005B200    | USA    | Mario Kart E3 Video                                           | v0                                                             |
| 0005B300    | JPN    | Animal Crossing E3 Video                                      | v0                                                             |
| 0005B400    | USA    | Animal Crossing E3 Video                                      | v0                                                             |
| 0005B500    | JPN    | Luigi's Mansion 2 E3 Video                                    | v0                                                             |
| 0005B600    | USA    | Luigi's Mansion 2 E3 Video                                    | v0                                                             |
| 0005B700    | JPN    | Zelda Ocarina of Time E3 Video                                | v0                                                             |
| 0005B800    | USA    | Zelda Ocarina of Time E3 Video                                | v0                                                             |
| 0005B900    | JPN    | Super Mario E3 Video                                          | v0                                                             |
| 0005BA00    | USA    | Super Mario E3 Video                                          | v0                                                             |
| 0005BB00    | JPN    | MGS Snake Eater 3D E3 Video                                   | v0                                                             |
| 0005BC00    | USA    | MGS Snake Eater 3D E3 Video                                   | v32                                                            |
| 0005BD00    | JPN    | Biohazard Revelations E3 Video                                | v16                                                            |
| 0005BE00    | USA    | Resident Evil Revelations E3 Video                            | v32                                                            |
| 0005BF00    | JPN    | Starfox 64 3D E3 Video                                        | v0                                                             |
| 0005EA00    | EUR    | Green Lantern 3D Trailer Video                                | v0, v16                                                        |
| 0005F000    | USA    | Green Lantern 3D Trailer Video                                | v0, v16                                                        |
| 00060F00    | EUR    | Pyramids (?)                                                  | v0, v16                                                        |
| 00062400    | EUR    | Kid Icarus Uprising E3 Video                                  | v0                                                             |
| 00062700    | EUR    | Paper Mario E3 Video                                          | v0                                                             |
| 00062A00    | EUR    | Mario Kart E3 Video                                           | v0                                                             |
| 00062D00    | EUR    | Animal Crossing E3 Video                                      | v0                                                             |
| 00063000    | EUR    | Luigi's Mansion 2 E3 Video                                    | v0                                                             |
| 00063300    | EUR    | Zelda Ocarina of Time E3 Video                                | v0                                                             |
| 00063600    | EUR    | Super Mario E3 Video                                          | v0                                                             |
| 00063900    | EUR    | MGS Snake Eater 3D E3 Video                                   | v0                                                             |
| 00063C00    | EUR    | Resident Evil Revelations E3 Video                            | v0                                                             |
| 00068F00    | EUR    | Pullblox                                                      | v16, v32                                                       |
| 0006E400    | JPN    | Super Mario Bros.                                             | v0, v1024                                                      |
| 0006E500    | USA    | Super Mario Bros.                                             | v0, v1024                                                      |
| 0006E600    | EUR    | Super Mario Bros.                                             | v0, v1024                                                      |
| 0006ED00    | JPN    | Metroid                                                       | v0, v1040                                                      |
| 0006EE00    | USA    | Metroid                                                       | v0, v1024                                                      |
| 0006EF00    | EUR    | Metroid                                                       | v0, v1024                                                      |
| 0006F000    | JPN    | The Legend of Zelda                                           | v0, v1040                                                      |
| 0006F100    | USA    | The Legend of Zelda                                           | v0, v1024                                                      |
| 0006F200    | EUR    | The Legend of Zelda                                           | v0, v1024                                                      |
| 0006F600    | JPN    | Wrecking Crew                                                 | v0, v1024                                                      |
| 0006F700    | USA    | Wrecking Crew                                                 | v0, v1024                                                      |
| 0006F800    | EUR    | Wrecking Crew                                                 | v0, 16                                                         |
| 0006F900    | JPN    | NES Open Tournament Golf                                      | v0, v1024                                                      |
| 0006FA00    | USA    | NES Open Tournament Golf                                      | v0, v1024                                                      |
| 0006FB00    | EUR    | NES Open Tournament Golf                                      | v0, v1024                                                      |
| 0006FF00    | JPN    | Donkey Kong Jr.                                               | v0, v1024                                                      |
| 00070000    | USA    | Donkey Kong Jr.                                               | v0, v1024                                                      |
| 00070100    | EUR    | Donkey Kong Jr.                                               | v0, v1024                                                      |
| 00070200    | JPN    | Balloon Fight                                                 | v0, v1024                                                      |
| 00070300    | USA    | Balloon Fight                                                 | v0, v16                                                        |
| 00070400    | EUR    | Balloon Fight                                                 | v0, v16                                                        |
| 00070500    | JPN    | Ice Climber                                                   | v0, v2048                                                      |
| 00070600    | USA    | Ice Climber                                                   | v0, v1024                                                      |
| 00070700    | EUR    | Ice Climber                                                   | v0, v32                                                        |
| 00070800    | JPN    | Zelda II: The Adventure of Link                               | v0, v1024                                                      |
| 00070900    | USA    | Zelda II: The Adventure of Link                               | v0, v1024                                                      |
| 00070A00    | EUR    | Zelda II: The Adventure of Link                               | v0, v1024                                                      |
| 00071100    | JPN    | Yoshi                                                         | v0, v1024                                                      |
| 00071200    | USA    | Yoshi                                                         | v0, v1024                                                      |
| 00071300    | EUR    | Yoshi                                                         | v0, v32                                                        |
| 00072400    | EUR    | Ambassador Certificate                                        | v0, v16                                                        |
| 00072500    | USA    | Ambassador Certificate                                        | v0, v16                                                        |
| 00074800    | JPN    | F-Zero: Maximum Velocity                                      | v0, v16                                                        |
| 00074900    | USA    | F-Zero: Maximum Velocity                                      | v0, v16                                                        |
| 00074A00    | EUR    | F-Zero: Maximum Velocity                                      | v0, v16                                                        |
| 00074B00    | JPN    | Mario Kart: Super Circuit                                     | v0, v16                                                        |
| 00074C00    | USA    | Mario Kart: Super Circuit                                     | v0, v16                                                        |
| 00074D00    | EUR    | Mario Kart: Super Circuit                                     | v0, v32                                                        |
| 00074E00    | JPN    | Wario Land 4                                                  | v0, v16                                                        |
| 00074F00    | USA    | Wario Land 4                                                  | v0, v16                                                        |
| 00075000    | EUR    | Wario Land 4                                                  | v0, v16                                                        |
| 00075200    | JPN    | Yoshi's Island: Super Mario Advance 3                         | v0, v32                                                        |
| 00075300    | USA    | Yoshi's Island: Super Mario Advance 3                         | v0, v16                                                        |
| 00075400    | EUR    | Yoshi's Island: Super Mario Advance 3                         | v0, v16                                                        |
| 00075500    | JPN    | Metroid Fusion                                                | v0, v32                                                        |
| 00075600    | USA    | Metroid Fusion                                                | v0, v16                                                        |
| 00075700    | EUR    | Metroid Fusion                                                | v0, v16                                                        |
| 00075800    | JPN    | WarioWare Inc: Mega Microgame                                 | v0, v16                                                        |
| 00075900    | USA    | WarioWare Inc: Mega Microgame                                 | v0, v16                                                        |
| 00075A00    | EUR    | WarioWare Inc: Mega Microgame                                 | v0, v16                                                        |
| 00075B00    | JPN    | Kirby & The Amazing Mirror                                    | v0, v16                                                        |
| 00075C00    | USA    | Kirby & The Amazing Mirror                                    | v0, v16                                                        |
| 00075D00    | EUR    | Kirby & The Amazing Mirror                                    | v0, v16                                                        |
| 00076600    | JPN    | Mario vs Donkey Kong                                          | v0, v16                                                        |
| 00076700    | USA    | Mario vs Donkey Kong                                          | v0, v16                                                        |
| 00076800    | EUR    | Mario vs Donkey Kong                                          | v0, v16                                                        |
| 00076900    | JPN    | Fire Emblem: The Sacred Stones                                | v0, v16                                                        |
| 00076A00    | USA    | Fire Emblem: The Sacred Stones                                | v0, v16                                                        |
| 00076B00    | EUR    | Fire Emblem: The Sacred Stones                                | v0, v16                                                        |
| 00076C00    | JPN    | The Legend of Zelda: The Minish Cap                           | v0, v16                                                        |
| 00076D00    | USA    | The Legend of Zelda: The Minish Cap                           | v0, v16                                                        |
| 00076E00    | EUR    | The Legend of Zelda: The Minish Cap                           | v0, v16                                                        |
| 00079C00    | USA    | Preview Video: Animal Crossing                                | v0                                                             |
| 0007AB00    | EUR    | Eurosport                                                     | v0, v16                                                        |
| 00080F00    | EUR    | Mario & Sonic - London 2012 Virtual Card Album                | v0                                                             |
| 000ACF00    | EUR    | Preview Video: Paper Mario: Sticker Star                      | v0, v16                                                        |
| 000AD000    | EUR    | Preview Video: Luigi Mansion: Dark Moon                       | v0, v16                                                        |
| 000AD100    | EUR    | Preview Video: New Super Mario Bros. 2                        | v0, v16                                                        |
| 000AE100    | ALL    | Pokemon Dream Radar                                           | v0, v16                                                        |
| 000C7300    | ALL    | [Save Data Transfer Tool](Save_Data_Transfer_Tool "wikilink") | v0                                                             |
| 000B0F00    | USA    | [YouTube](YouTube "wikilink")                                 | v16, v1056, v2096 (released (about/exactly?) October 15, 2015) |
| 000CCE00    | USA    | Donkey Kong Country Returns 3D                                | v48                                                            |
| 000CCD00    | EUR    | [YouTube](YouTube "wikilink")                                 | v0, v1040, v2080 (released (about/exactly?) October 15, 2015)  |
| 000D9A00    | EUR    | Donkey Kong Country Returns 3D: Trailer                       | v16                                                            |
| 0015D800    | USA    | IRONFALL Invasion                                             | v0 (content files removed on roughly 7 January 16), v2080      |
| 0011D600    | EUR    | Pikmin Short Movies 3D                                        | v0                                                             |
| 000B4600    | JPN    | Photos with Mario                                             | v0                                                             |
| 00137F00    | EUR    | New SUPER MARIO BROS. 2: Special Edition                      | v16                                                            |
| 00137E00    | USA    | New Super Mario Bros. 2: Gold Edition                         | v0,                                                            |
| 00137F00    | JPN    | New Super Mario Bros. 2: Gold Edition                         | v16                                                            |
| 00143300    | KOR    | New Super Mario Bros. 2: Gold Edition                         | v0                                                             |
| 00143400    | TWN    | New Super Mario Bros. 2: Gold Edition                         | v0                                                             |
| 0007AE00    | USA    | New Super Mario Bros. 2                                       | v16                                                            |
| 0007AF00    | EUR    | New Super Mario Bros. 2                                       | v0                                                             |
| 0007AD00    | JPN    | New Super Mario Bros. 2                                       | v32                                                            |
| 00053F00    | EUR    | Super Mario 3D Land                                           | v16                                                            |
| 00054000    | USA    | Super Mario 3D Land                                           | v48                                                            |
| 00054100    | JPN    | Super Mario 3D Land                                           | v16                                                            |
| 00089D00    | KOR    | Super Mario 3D Land                                           | v0                                                             |
| 000a5d00    | JPN    | Paper Mario: Sticker Star                                     | v0                                                             |
| 000a5e00    | USA    | Paper Mario: Sticker Star                                     | v0                                                             |
| 000B8A00    | TWN    | New Super Mario Bros. 2                                       | v0                                                             |
| 000b8900    | KOR    | New Super Mario Bros. 2                                       | v0                                                             |
| 00030700    | EUR    | Mario Kart 7                                                  | v2112                                                          |
| 00030A00    | KOR    | Mario Kart 7                                                  | v2048 (lesser ones haven't been checked)                       |
| 0f701400    | ALL    | Super Mario Kart                                              | v0                                                             |
| 00182200    | USA    | The Legend of Zelda: Tri Force Heroes (demo)                  | v0                                                             |
| 00182300    | EUR    | The Legend of Zelda: Tri Force Heroes (demo)                  | v0                                                             |
| 00182100    | JPN    | The Legend of Zelda: Tri Force Heroes (demo)                  | v0                                                             |
| 00031B00    | JPN    | パイロットウイングス リゾート                                 | v48                                                            |
| 00031C00    | USA    | Pilotwings Resort                                             | v32                                                            |
| 00031D00    | EUR    | Pilotwings Resort                                             | v16                                                            |
| 000D7C00    | JPN    | Steel Diver: Sub Wars                                         | v0                                                             |
| 000D7D00    | USA    | Steel Diver: Sub Wars                                         | v0                                                             |
| 000D7E00    | EUR    | Steel Diver: Sub Wars                                         | v0                                                             |
| 00196F00    | ALL    | Kirby's Blowout Blast                                         | v0                                                             |
| 00197000    | KOR    | Kirby's Blowout Blast                                         | v0                                                             |
| 00153500    | USA    | Nintendo Badge Arcade                                         | v4096                                                          |
| 0006EA00    | JPN    | Punch-Out                                                     |                                                                |
