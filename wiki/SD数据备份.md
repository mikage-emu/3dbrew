## 概述

本文介绍了[6.0.0-11](6.0.0-11 "wikilink")的用户可以备份SD卡中title上限为30条的[游戏存档](Savegames "wikilink")。用户在[主菜单界面](主菜单界面 "wikilink")中选中应用程序后，有备份数据的选项出现。在[系统设置](系统设置 "wikilink")中用户能够删除、恢复备份。例外可以参阅[Exclusions](SD_Savedata_Backups#Exclusions "wikilink")。

## 备份

备份数据存储在目录:

sdmc:/Nintendo 3DS/<ID0>/<ID1>/backups

备份目录的结构（每条存档都有这个结构）：

backups └───XXX

`    └───`<Application TitleID>

- **XXX** - 一对三位的十六进制数字代表插槽编号，比如000-01D
- **<Application TitleID>** -
  目录包含了备份title的data目录的每个字节（存档文件本来就放在那里的）

每条存档槽只有一个存档数据，备份数据的详细信息是由[System Settings's
Extdata](Extdata "wikilink") 记录的，不能手动创建。如果[System
Settings's Extdata](Extdata "wikilink")
发生损坏，备份槽的详细信息可以从备份目录中的文件来恢复。

## 例外

有些title的备份是受限的。这些受限的备份仅在title被删除后做一次恢复。然而GBA
title完全不允许备份，原因不明。NS CFA 的
[ctr_backup_black_list](NS_CFA "wikilink") 文件，包含了一个 Unique-ID
的黑名单。

### 常规 3DS Title

| JPN UniqueID | USA UniqueID | EUR UniqueID | Title Name                                |
|--------------|--------------|--------------|-------------------------------------------|
| 000950       | 000ba8       | 000ba9       | Pokemon Mystery Dungeon                   |
| 000343       | 000465       | 0004b3       | Cubic Ninja                               |
| 000481       | 000ae4       | 000b1d       | Monster Hunter 3G                         |
| ?            | 00048d       | 0005f6       | Reel Fishing 3D Paradise                  |
| 0004d7       | 00066c       | 00066d       | Pokemon Rumble Blast                      |
| ?            | ?            | 000933       | Freakyforms Deluxe                        |
| ?            | 000ae1       | ?            | Pokemon Dream Radar                       |
| 0009f6       | ?            | ?            | Senran Kagura Burst: Guren no Shoujotachi |
| 000a4d       | ?            | ?            | Sengoku Musou Chronicle 2nd               |
| ?            | ?            | 0008c9       | Marvel Pinball 3D                         |
| 000862       | 000863       | 000864       | Animal Crossing: New Leaf                 |
| 000321       | ?            | ?            | New Love Plus                             |
| 00065e       | ?            | ?            | Dragon Quest VII - Eden no Senshitachi    |
| 0006d2       | ?            | ?            | Fantasy Life                              |
| ?            | ?            | ?            | Dillon's Rolling Western                  |
| ?            | ?            | ?            | Zen Pinball 3D                            |

### VC Title

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

### 未登入

| UniqueID | Title Name |
|----------|------------|
| 000395   | ?          |
| 000496   | ?          |
| 000528   | ?          |
| 00055d   | ?          |
| 00055e   | ?          |
| 0005dc   | ?          |
| 0006a2   | ?          |
| 00072a   | ?          |
| 000732   | ?          |
| 000775   | ?          |
| 0007fc   | ?          |
| 000863   | ?          |
| 0008c3   | ?          |
| 0008c4   | ?          |
| 0008c5   | ?          |
| 0008c8   | ?          |
| 0008e3   | ?          |
| 0008fa   | ?          |
| 000913   | ?          |
| 0009aa   | ?          |
| 0009d6   | ?          |
| 0009fa   | ?          |
| 000a27   | ?          |
| 000b4a   | ?          |
| 000bae   | ?          |
| 000c34   | ?          |
| 000c6f   | ?          |
| 000c71   | ?          |
| 000c72   | ?          |
| 000c9e   | ?          |
| 000cc5   | ?          |
| 000cc6   | ?          |
| 000cfd   | ?          |
| 000d10   | ?          |
| 000d2e   | ?          |
| 000d4a   | ?          |
| 000e68   | ?          |
| 000edc   | ?          |