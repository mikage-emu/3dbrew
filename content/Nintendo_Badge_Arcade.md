+++
title = 'Nintendo Badge Arcade'
+++

**Nintendo Badge Arcade** is an application that allows getting badges
for the 3DS's [Home Menu](Home_Menu "wikilink") via a claw machine-like
game.

## [SpotPass](SpotPass "wikilink") usage

The game can use four different URLs to retrieve game data.

- https://npdl.cdn.nintendowifi.net/p01/nsa/\<regionID\>/FGONLYT/playinfo_\<gameVersion\>.dat
- https://npdl.cdn.nintendowifi.net/p01/nsa/\<regionID\>/data/data_\<gameVersion\>.dat
  This file is a SARC archive with all game data (like machines and
  [Miiverse](Miiverse "wikilink") posts) that is available within a
  period of one week. This data is updated every Friday at 1:40 AM GMT
- https://npdl.cdn.nintendowifi.net/p01/nsa/\<regionID\>/data/allbadge_\<gameVersion\>.dat
  This has a SARC archive with all game badges and machines for the
  game.
- https://npdl.cdn.nintendowifi.net/p01/nsa/\<regionID\>/news/\<language\>/news_\<gameVersion\>.dat

Where gameVersion goes the version of the game, which can be v130 or
v131, langcode is the two-character language codes from
[config](Config_Savegame#languages "wikilink"), and regionID is from the
below table.

| Region | ID               |
|--------|------------------|
| JPN    | j0ITmVqVgfUxe0O9 |
| USA    | OvbmGLZ9senvgV3K |
| EUR    | J6la9Kj8iqTvAPOq |

## RomFS

Inside the romfs data, we can find the following folders:

```
root
├── message
├── primitive_renderer
├── region_common
└── region_XXX
```

- "message" has all in-game dialogues
- "region_common" has a similar scheme to data.dat, but has all in-game
  assets
- "region_XXX" is similar as region_common, but has all region specific
  files, like the first badge machine. Where XXX goes the region name
  (EUR, JPN, USA)

### message

The message folder has the following structure:

```
message
├── boss_EUR
    └─ XXxx
├── boss_JPN
    └─ XXxx
├── boss_USA
    └─ XXxx
└── rom
    └─ XXxx
```

Where XX goes the region and xx belongs to the language. The dialogues
are stored within SARC files.

The *boss* folders store the default online-related game dialogues. The
*rom* folder has the gameplay and error dialogues. The *boss* dialogues
can be overridden when they are providen by SpotPass.

Dialogue is formatted with [Format
Tags](Nintendo_Badge_Arcade/Format_Tags "wikilink").

### region_common

The region_common folder stores all assets that aren't region dependent.
Below are the assets folders:

```
region_common
├── banner
├── camera
├── cfl
├── effect
├── layout
├── model
├── scene
└── sound
```

#### banner

This folder has the game banner for each region on an ICN file?

#### camera

This folder has all camera animations? The contents are stored on Yaz0
compressed BCH files.

#### cfl

This folder's contents are unknown (Mii related?). The contents are
stored on Yaz0 compressed BCH files.

#### effect

This folder stores all of the effects used ingame. These are stored on
the following files:

- effect_CTR.ptcl
- elink.elk

#### layout

These folders contain layout, Images and Animation for basic UI

```
root
├── anim
├── blyt
└── timg
```

#### model

This folder has all of the games models. The contents are stored on Yaz0
compressed BCH files.

#### scene

This folder's contents are unknown (scene related?). The contents are
stored on Yaz0 compressed BCH files.

#### shader

This folder stores the shaders of the game. The contents are stored on
Yaz0 compressed BCH files.

#### sound

This folder has the sounds and music used ingame. It has the following
files inside:

```
sound
├── center.bcsar
├── center.bkas
├── dspaudio.cdc
└── stream
    ├── <audio file name>.aac
    └── <audio file name>.bcstm
```

## ExtData

Inside the extdata, we can find the following files:

- "addSaveData"
- "allbadge.sarc" A register of all badges retrieved from
  data_<gameVersion>.dat file?
- "boss.sarc" The data_<gameVersion>.dat file retrieved from SpotPass
- "savedata"

### allbadge.sarc

This file uses the
[PrizeCollection](Nintendo_Badge_Arcade/PrizeCollection "wikilink")
structure.

### boss.sarc

All game data stored here has the following structure:

```
root
├── message
├── post
├── sharc
├── talkpic
├── xml
└── Schedule.xml
```

#### message

This folder stores all online-related game dialogues on each language
supported by the region. It goes down the following directories:

```
message
└── boss_XXX
    └── XXxx
        └── boss
            └── slotAXX
                ├── BossText.msbt
                ├── Emergency.msbf
                ├── HallAd.msbf
                ├── PaidTalk.msbf
                ├── PostComment.msbf
                ├── RetnHall.msbf
                ├── StartUp.msbf
                ├── ThemeShop.msbf
                └── Training.msbf
```

Where X goes the region, and x belongs to the language. Within slotAXX,
A is a letter and XX are numbers.

#### post

This folder stores all Miiverse posts related to customizing the Home
Menu with themes and badges. Each SARC file inside here has the
following sructure:

```
root
├── Image.jpg
├── Mii.Etc1_a4
└── post.xml
```

The post.xml file contains the following data:

```
<?xml version="1.0" encoding="utf-8"?>
<DistributablePost xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <index>x</index>
  <Id><Post ID></Id>
  <Name>Mii name</Name>
  <PathMii>Mii.Etc1_a4</PathMii>
  <PathImage>Image.jpg</PathImage>
</DistributablePost>
```

The Mii.Etc1_a4 image has a 128x128 resolution.

#### sharc

This folder stores the
[PrizeCollection](Nintendo_Badge_Arcade/PrizeCollection "wikilink") file
with the badges and machines available for the belonging week.

The file is named using the starting and ending dates that the
collection is active for, in yy/mm/dd format separated with an
underscore. For example, a collection active between the dates December
15th, 2022 to December 22nd, 2022 is named `221215_221222.sarc`.

#### talkpic

This folder contains the promotional images shown on the hub inside SARC
files. Each SARC file has the following content:

```
root
└── talkpic
    └── <Name of SARC file>
        └── The images...
```

#### xml

This folder has some XML data that controls the parameters of the
promotional images. It has the following structure:

```
xml
└── talkpic
    └── TalkPic.xml
```

The TalkPic.xml file has the following data:

```
<?xml version='1.0' encoding='UTF-8' standalone='yes'?>
<CenterTalkPicProperty>
    <TalkPicSet>
        <TalkPic Key='<Name of image>' Arc='<Name of SARC file>' Width='512' Height='256' Format='Etc1 or Etc1_a4 or Rgb565' Type='400x240 (Original image resolution?)' Path='path/to/image'/>
    </TalkPicSet>
</CenterTalkPicProperty>
```

#### Schedule.xml

This file controls the availability of each of the features inside this
structure within the specified dates. It has the following data:

```
<?xml version="1.0" encoding="utf-8"?>
<FileItems xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema">
  <Items>
    <FileItem>
      <DateStartText>YYYYmmdd</DateStartText>
      <DateExpireText>YYYYmmdd</DateExpireText>
      <ColorText>#aaaaff</ColorText>
      <Comment />
      <RegexSetName>MessageDir</RegexSetName>
      <Expression>boss/output/message/(?<Region>boss_(JPN|EUR|USA))/(?<Locale>[a-zA-Z]+)/boss/(?<Dir>.+)</Expression>
      <KeyVariable>Boss/</KeyVariable>
      <ValueVariable>boss/$(Dir)/</ValueVariable>
      <OutputVariable>boss/archive_src/$(ArchiveName)/message/$(Region)/$(Locale)/boss/$(Dir)/</OutputVariable>
      <PreviewVariable />
      <CommandVariable>path/to/command_used.bat</CommandVariable>
      <ArgumentsVariable />
      <Key>Boss/</Key>
      <Value>boss/slotAXX/</Value>
      <Output>boss/archive_src/BossYYYYmmdd_YYYYmmdd/message/boss_XXX/XXxx/boss/slotAXX/</Output>
      <Preview />
      <SrcPath>boss/output/message/boss_XXX/XXxx/boss/slotAXX</SrcPath>
      <Command>path/to/command_used.bat</Command>
      <Arguments />
    </FileItem>
  </Items>
  <ItemsCount><Number of items></ItemsCount>
  <BasePath>%CTR_CENTER_ROOT%/</BasePath>
  <XMLPath>boss/archive_src/$(ArchiveName)/Schedule.xml</XMLPath>
  <ArchiveName>Boss$(DateFrom)_$(DateTo)</ArchiveName>
  <DateFrom>YYYY-mm-ddT00:00:00</DateFrom>
  <DateTo>YYYY-mm-ddT00:00:00</DateTo>
</FileItems>
```

Each FileItem's content varies depending on its RegexSetName. Below are
the possible values:

| RegexSetName    | Key                 | Value                    |
|-----------------|---------------------|--------------------------|
| MessageDir      | Boss/               | boss/slotAXX/            |
| TalkPicTex      | TalkPicTex/         | TalkPicTex/              |
| TalkPicXml      | TalkPicXml/         | TalkPicXml/              |
| PrizeCollection | sharc/pc00.sarc     | sharc/YYmmdd_YYmmdd.sarc |
| Post            | post/PostXX.sarc    | post/<Post ID>.sarc      |
| BonusStage      | BonusStageName      | <Stage Name>             |
| DefaultStage    | DefaultStageNameXXX | <Stage Name>             |

The *BonusStage* and *DefaultStage* data define the sets (crane
instances) available for each day of that week. The bonus catchers are
also available as a practice crane.
