## 概述

3DS使用SD卡存储游戏数据、音乐以及使用3DS拍摄的照片和视频

SD卡

`├── DCIM 目录`
`└── Nintendo 3DS 目录`
`    ├── `<ID0>
`    │   └── `<ID1>
`    │       ├── `[`SD数据备份`](SD数据备份 "wikilink")
`    │       ├── `[`dbs`](Title_Database "wikilink")
`    │       ├── `[`extdata`](extdata "wikilink")
`    │       ├── `[`title`](Title_Data_Structure "wikilink")
`    │       └── `[`Nintendo DSiWare`](DSiWare_Exports "wikilink")
`    └── `[`Private`](SD_Filesystem#Private "wikilink")
`   `

- 存储在sdmc/Nintendo 3DS/<ID0>/<ID1>目录下的所有数据都是console-unique
  [keyslots](AES "wikilink")加密的, 存储在
  [nand/data/<ID0>](Flash_Filesystem "wikilink") 目录下的文件只用于MAC
  keyslots. 这些目录的CTR文件都使用
  [nand/private/movable.sed](nand/private/movable.sed "wikilink")
  初始化keyslots.
- ID0 是SHA256 [hash](nand/private/movable.sed "wikilink") 的前
  0x10-bytes from .
- ID1是从SD卡初始化创建的CID获得的。从CID生存目录名，首先把生成该目录名称的CID翻转8位到左边,然后每个U16以下表所示的方式加密：

| Input rotated CID u16 index | Output CID u16 index |
|-----------------------------|----------------------|
| 6                           | 0                    |
| 7                           | 1                    |
| 4                           | 2                    |
| 5                           | 3                    |
| 2                           | 4                    |
| 3                           | 5                    |
| 0                           | 6                    |
| 1                           | 7                    |

**DCIM** - [Nintendo 3DS
Camera](Nintendo_3DS_Camera "wikilink")拍摄的相片和影片存储在这里.
网络浏览器下载的图像也存储在这里。

Note: 播放/录制
(3D)视频是在[3.0.0-5](3.0.0-5 "wikilink")系统新增的功能.3D视频是MJPG编码的avi格式的文件。

**SD数据备份** - 这个目录包含了SD Title
的数据备份。欲了解更多信息，请参阅[SD数据备份](SD数据备份 "wikilink")。

**dbs** - 包含安装于SD卡中title相关的数据库. 这些文件是加密的,详见[Title
Database](Title_Database "wikilink")。

**title** - 安装于SD卡中的title.这个目录的所有数据是
[keyslot](AES "wikilink") console-unique加密的. SD卡中的title列表可以在
[Title list](Title_list "wikilink") 查看. title数据结构的更多信息,请参阅
[Title Data Structure](Title_Data_Structure "wikilink")。

**Nintendo DSiWare** - DSiWare titles 详见
[exported](DSiWare_Exports "wikilink")。

## Extdata

附加的游戏数据储存在这里:


/Nintendo 3DS/<SomeID>/<SomeID>/extdata/00000000

`00000082 - eShop - JPN (Unconfirmed)`
`0000008f - Some `[`2.0.0-2`](2.0.0-2 "wikilink")` data, unknown doesn't appear in extdata management.`
`00000098 - eShop - EUR (Unconfirmed)`
`00000207 - Mii Maker - JPN `
`0000020d - Face Raiders - JPN`
`00000210 - Some `[`2.0.0-2`](2.0.0-2 "wikilink")` data, unknown doesn't appear in extdata management.`
`00000217 - Mii Maker - USA`
`00000219 - eShop USA`
`0000021d - Face Raiders - USA`
`00000227 - Mii Maker - EUR`
`0000022d - Face Raiders - EUR`
`0000030c - Nintendogs + Cats - EUR`
`00000326 - Pokédex 3D - EUR`
`0000032d - Super Street Fighter IV 3D - USA`
`0000033b - Ridge Racer 3D - EUR`
`0000033c - Super Street Fighter IV 3D - EUR`
`0000034d - Samurai Warriors Chronicles - USA`
`00000358 - Ridge Racer 3D - USA`
`0000038a - Dead or Alive Dimensions - EUR`
`00000481 - Monster Hunter Tri G (Download-Quests) - JPN`
`000004aa - Nintendo Video - USA`
`000004ab - Nintendo Video - EUR`

所有[extdata](extdata "wikilink")下的附加数据（extra
data）都是加密的。尽管这些文件使用类似于闪存(FLASH)[存档](Savegames "wikilink")的0xFF区块，附加数据却不能用对待闪存存档的异或操作来解密。所有附加数据文件都不能被拷贝到别的3DS的SD卡上，它们被锁在3DS本体上。（straybirdsnest注：保存了一台3DS附加数据的SD卡直接（或者拷贝到另外的SD卡后）插入到另外一台3DS上无法被识别，猜测原文是指这个。）

（All "extra data" under [extdata](extdata "wikilink") is encrypted.
Although these files use 0xFF blocks similar to FLASH
[saves](Savegames "wikilink"), extdata can't be decrypted with the
xorpad fail like FLASH saves. All "extra data" files can't be copied to
other 3DS SD cards, they are locked to the console.）

## import.db 与 title.db

6月更新后，文件夹结构有了细微变化。你会在 /Nintendo
3DS/<SomeID>/<SomeID>/
的exetdata旁找到"dbs"和"title"文件夹。"dbs"文件夹包含两个文件：import.db和title.db——用途目前不明。import.db似乎包含来自DSiWare
SRL的数据。

文件数据的开头部分是加密的，但剩余部分是明文(cleartext)。这个文件总是3.1MB大小，因此它不包含大多数DSiWare的完整的SRL。里面的数据排列方式也与源SRL——ARM7代码，ARM9代码的排列顺序不同，它们混（mix）在一起。文件包含未安装的DSiWare数据，只在源DSi上被列出，用于DSiWare转移。(翻译待考证)

（The data at the beginning of the file is encrypted, but the rest is
cleartext. This file is always 3.1MB, thus this doesn't contain the
whole SRL for most DSiWare. The data stored here is not ordered the same
way as the src SRL: ARM7 code, ARM9 code, and data are mixed together.
The file can contain data from DSiWare that wasn't installed, only
listed on the src DSi for DSiWare transfer. (This file is likely some
temporary data storage used for DSiWare install etc).）

title.db似乎是加密的。

- [新旧 import.db 与 title.db
  异或后，泄露了某些明文(plaintext)](https://gist.github.com/1113cbe10f124e5a2c72).

## title

`/title/00040000/ 包含 eshop 下载的数据 (有人能帮忙查证和加上地区吗?):`
`00032600 - Pokedex 3D - EUR (verified)`
`00042a00 - Legend of Zelda - Link's Awakening - EUR`
`0004ab00 - Nintendo Video - EUR`
`00052000 - Let's Golf 3D - EUR`
`00054300 - 3D Classics Excitebike - USA`
`00054e00 - 3D Classics Excitebike - EUR (verified)`
`00054300 - 3D Classics Excitebike - USA`
`00045C00 - 3D Classics Excitebike - JPN`

要查看更多的ID，请参阅[Title_list](Title_list "wikilink")上的00040000标题(title)。

上面的游戏标题文件(title directories)包含两个目录: content 和 data
。content 包含 00000000.tmd、.app文件，某些cmd目录包含
00000001.cmd，所有这些文件都使用一个本体唯一的密钥（console-unique
key）加密。data目录包含
00000001.sav，这是游戏标题(title)的加密游戏存档。尽管这些存档看起来很像闪存游戏存档，但是它们对文件内每个AES块使用了唯一的CTR，而CTR在每个游戏存档写入的时候又会改变。重命名这些游戏存档文件将引起主菜单在启动游戏（title）时挂起(hang)，修改存档将像游戏卡带闪存存档一样抛出checksum/hash错误。

（The above title directories contain two dirs: content and data.
content contains 00000000.tmd, .app files, and some cmd dir containing
00000001.cmd, all of which are encrypted with a console-unique key. The
data dir contains 00000001.sav, this is the title's encrypted savegame.
Although these saves look similar to FLASH savegames, these savegames
use proper unique CTR for each AES block in the file, and the CTR
properly changes for each savegame write. Renaming these savegames
causes home-menu to hang while launching titles, modifying saves throws
the usual checksum/hash corruption like gamecard flash saves.）

重命名content文件夹下任意文件或目录的时候，主菜单上的图标仍会被显示。修改这些文件与重命名有同样效果。重命名cmd文件夹下的cmd文件，或
00000000.app
,则3D标题会消失。重命名cmd目录或目录下的文件时，主菜单会拒绝运行游戏程序，说明书（译者注：即菜单里的软件说明书，3DSware和马里奥大陆3D这样的游戏会自带）将无法工作。（会显示“SD卡未插入”的黑屏）。重命名
00000001.app时，说明书将不会被载入，因此 .app 可能是说明书？主
00000000.app
二进制文件被重命名的时候，无法启动该游戏程序，并且显示说明书的地方将显示游戏程序的图标和标题。（译者注：这段按本人理解翻译，有兴趣的可以亲自试验一下，记得先备份SD卡内容）重命名tmp文件夹里面的文件将不会引起主菜单的任何改变。

（When renaming *any* of these files/dir under content, the icon in
home-menu is still displayed. Modifying any of these files has same
result as renaming them. When renaming the cmd dir/cmd file, or
00000000.app, the 3D banner isn't displayed. When renaming the cmd dir
or the file contained in that dir, home-menu will refuse to run the
title, and the manual will not work.(will display the black screen
saying sdcard isn't inserted) Manual won't load when 00000001.app is
renamed, so that .app might be the manual? When the main 00000000.app
binary is renamed, the title will not launch and in the manual
placeholder text is used for the title name/icon. Home-menu doesn't care
at all when tmd is renamed.）

## Private

保存在这里的Private数据似乎是明文:

`/Nintendo 3DS/Private/`

<Title ID Low>

/

`00020400 - Nintendo 3DS Camera `
`00020500 - Nintendo 3DS Sound`

camera private 目录是 [phtcache.bin](phtcache.bin "wikilink").
想在3DS放入并能查看图片的时候，重命名为8位数字的mpo文件并保存到/DCIM目录下。
sound private 目录是 voice/XX/\*.m4a. 这里的XX是01-10,存储为m4a文件.