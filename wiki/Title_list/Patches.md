[Go Back to Title list](Title_list "wikilink")

## Overview

These are the same as the application's main [CXI](NCCH#CXI "wikilink"),
except the ExeFS/RomFS only contains files which were updated. When
launching an application, [NS](NS "wikilink") will first try to
[launch](Process_Manager_Services "wikilink") the specified title with
the programID-high changed to 0x0004000E(update-data), if that fails NS
will then try launching the title with the actual input programID. The
programID stored in the update-data NCCH header matches the update-data
NCCH titleID, however the programID stored in the exheader is set to the
original application programID instead.

The application code mounts the update RomFS and loads data from
there/the main application romfs as needed.

CXI builds which include a game-update(gamecard/standalone-eShop titles)
have a different .text from the update-title, presumably due to not
needing separate update-romfs.

## List

| TitleID Low | Region | Description                                         | Versions                                                                                                  |
|-------------|--------|-----------------------------------------------------|-----------------------------------------------------------------------------------------------------------|
| 00022800    | EUR    | StreetPass Mii Plaza \[Update Data\]                | v3 (v6160)                                                                                                |
| 00030600    | JPN    | Mario Kart 7 \[Update Data\]                        | v1.1 (v1040)                                                                                              |
| 00030700    | EUR    | Mario Kart 7 \[Update Data\]                        | v1.1 (v1040)                                                                                              |
| 00030800    | USA    | Mario Kart 7 \[Update Data\]                        | v1.1 (v1040)                                                                                              |
| 00032100    | JPN    | New Love Plus \[Update Data\]                       | v1024, v2048                                                                                              |
| 0004EE00    | ?      | ?                                                   | v1024                                                                                                     |
| 00056C00    | JPN    | [Flipnote Studio 3D](Flipnote_Studio_3D "wikilink") | v5120                                                                                                     |
| 00072A00    | ?      | ?                                                   | v1040                                                                                                     |
| 00078500    | ?      | ?                                                   | v1024, v3072                                                                                              |
| 0007A000    | ?      | ?                                                   | v1024                                                                                                     |
| 000EDF00    | USA    | Super Smash Bros. for Nintendo 3DS \[Update Data\]  | v3136, v4176, v5232, v7312, v9392, v10432, v12512, v14576, v16656, v18720, v20784, v22848, v24928, v33216 |