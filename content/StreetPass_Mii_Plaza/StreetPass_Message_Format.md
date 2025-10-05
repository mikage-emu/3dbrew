+++
title = 'StreetPass Message Format'
+++

This is the format of the message that is sent to other devices over StreetPass. StreetPass messages are stored in the [CECD_Savegame](CECD_Savegame "wikilink")

## Header

Common header that is used by any title

| Offset | Length | Desciption |
|----|----|----|
| 0 | 70 | Header. See [CECD_Savegame](CECD_Savegame "wikilink") |
| 70 | C88 | News icon (40x40 px) extra header and data. See CECD_Savegame |
| CF8 | XX | News text header and data. Length depends on the text size. See CECD_Savegame |

## Body

The actual data. A number (CF8+XX from the header) has to be added to the offsets to get the real offset in the file. This number is different for every language because the news text has a different length in every language.

| Offset | Length | Desciption |
|----|----|----|
| 0 | 8 | Title ID of last played game |
| 8 | 18 | Unknown |
| 30 | 2000 | Name struct of last played game. See [SMDH#Application_Titles](SMDH#application_titles "wikilink") |
| 2030 | 8 | Reserved |
| 2038 | 1680 | Icon graphics of last played game. See [SMDH#Icon_graphics](SMDH#icon_graphics "wikilink") |
| 36B8 | 4 | Unknown |
| 36BC | 18 | Header of CFPB container |
| 36D0 | 70 | Encrypted Mii data. See [Mii_Maker#Mii_QR_Code_format](Mii_Maker#mii_qr_code_format "wikilink") and [Mii#Mii_format](Mii#mii_format "wikilink") |
| 3744 | 18 | Footer of CFPB container |
| 375C | 4 | Unknown |
| 3760 | 400 | UTF-16 encoded names of country of origin of Mii. |
| 3B60 | 400 | UTF-16 encoded names of region of origin of Mii. |
| 3F60 | 4 | Number of StreetPass Tags |
| 3F64 | 2 | Plaza Population |
| 3F66 | 1 | Equipped Outfit |
| 3F67 | 1 | Likes dogs or cats |
| 3F68 | 1 | Dream |
| 3F69 | 1 | Hobby |
| 3F6A | 6 | Unknown |
| 3F70 | 22 | Greeting text. UTF-16 encoded |
| 3F92 | A0 | List of IDs for personal greetings. Every ID (Mii ID + MAC address) is 10 bytes -\> Space for 16 IDs. List is built from last entry to first entry. |
| 4032 | 220 | List of personal greeting messages. Every message is 34(0x22) bytes long (16 UTF-16 characters + null terminator). Index corresponds to IDs |
| 4252 | 220 | List of greetings that where received while setting the personal greeting. Index corresponds to IDs |
| 4472 | 10 | Unknown |
| 4482 | 2 | Fantastic ratings |
| 4484 | 140 | List of IDs for fantastic ratings. Every ID (Mii ID + MAC address) is 10 bytes -\> Space for 32 IDs. |
| 45C4 | E | Collected pieces of first/preinstalled 7 puzzles from Puzzle swap. 2 bytes per puzzle |
| 45D2 | 1 | Unused |
| 45D3 | 1B18 | Collected pieces of additional 102 downloadable puzzles. 0x44 bytes per puzzle for possible 540 pieces. See [<https://tcrf.net/StreetPass_Mii_Plaza#540_Pieces_Puzzle>](https://tcrf.net/StreetPass_Mii_Plaza#540_Pieces_Puzzle) |
| 60EB | 1 | Unused |
| 60EC | 40 | 16 bit values to tell that Mii that it looks 'fantastic'. Index corresponds to the IDs for fantastic ratings |
| 612C | 10 | Greeting emote for personal greetings. List is built from highest to lowest byte. |
| 613C | 10 | Greeting emote from received greetings. |
| 614C | 4 | Emote for default greeting |
| 6150 | 4 | Unknown/Unused |
| 6154 | 4 | Flags if StreetPass Game of Game Pack 1 has save data (0x1 = Battle; 0x2 = Garden; 0x4 = Mansion; 0x8 = Squad) |
| 6158 | E8 | [StreetPass Battle Statistics](StreetPass_Mii_Plaza#streetpass_battle_statistics "wikilink") |
| 6240 | 500 | [StreetPass Garden Statistics](StreetPass_Mii_Plaza#streetpass_garden_statistics "wikilink") |
| 6740 | 100 | [StreetPass Mansion Statistics](StreetPass_Mii_Plaza#streetpass_mansion_statistics "wikilink") |
| 6840 | 100 | [StreetPass Squad Statistics](StreetPass_Mii_Plaza#streetpass_squad_statistics "wikilink") |
| 6940 | 10 | Speech bubbles for personal greetings |
| 6950 | 10 | Speech bubbles for received greetings |
| 6960 | 1 | Speech bubble for default greeting |
| 6961 | 7 | Unknown/Unused |
| 6968 | 4 | Flags if StreetPass Game of Game Pack 2 has save data (0x1 = Fishing; 0x2 = Zombie) |
| 696C | 200 | [StreetPass Fishing Statistics](StreetPass_Mii_Plaza#streetpass_fishing_statistics "wikilink") |
| 6B6C | 200 | [StreetPass Zombies Statistics](StreetPass_Mii_Plaza#streetpass_zombies_statistics "wikilink") |
| 6D6C | 2 | Unknown (Has StreetPass Premium?) |
| 6D6E | 2 | Steps (Pedometer, It's limited to 50000 steps) |
| 6D70 | 4 | Flags if StreetPass Game of Game Pack 3 has save data (0x1 = Slot Racer; 0x2 = Trader) |
| 6D74 | 400 | [StreetPass Slot Racer Statistics](StreetPass_Mii_Plaza#streetpass_slot_racer_statistics "wikilink") |
| 7174 | 100 | [StreetPass Trader Statistics](StreetPass_Mii_Plaza#streetpass_trader_statistics "wikilink") |

### StreetPass Battle Statistics

| Offset | Length | Desciption                                                  |
|--------|--------|-------------------------------------------------------------|
| 0      | 4      | Unknown (Type of Castle?)                                   |
| 4      | 4      | StreetPass Battle Army Size                                 |
| 8      | 18     | Unknown                                                     |
| 20     | 4      | Type of first army third (Always 1; Infantry)               |
| 24     | 4      | Number of infantry                                          |
| 28     | 4      | Type of second army third (Always 2; Cavalry)               |
| 2C     | 4      | Number of cavalry                                           |
| 30     | 4      | Type of third army third (Always 3; Archer)                 |
| 34     | 4      | Number of archers                                           |
| 38     | 18     | Header of CFPB container                                    |
| 50     | 70     | Encrypted Mii data for the top scorer in StreetPass Battle. |
| C0     | 18     | Footer of CFPB container                                    |
| D8     | 4      | Unknown                                                     |
| DC     | 4      | StreetPass Battle Top Scorer's score                        |
| E0     | 8      | Unknown                                                     |

### StreetPass Garden Statistics

| Offset | Length | Desciption |
|----|----|----|
| 0 | 4 | Unknown |
| 4 | 4 | Unknown |
| 8 | 2 | Invited Guests |
| A | 2 | Unknown |
| C | 2 | Number of Journal Entries |
| E | 2 | Unknown |
| 10 | 1 | Unknown If not 0 or FF garden can be viewed |
| 11 | 3 | Unknown |
| 14 | 4 | Unknown |
| 18 | 4 | Unknown |
| 1C | 4 | Unknown |
| 20 | 4 | Unknown |
| 24 | 4 | Unknown |
| 28 | 4 | Unknown |
| 2C | 4 | Unknown |
| 30 | 2 | Unknown |
| 32 | 1 | Yaw of Leaf 1 of currently equipped flower |
| 33 | 1 | Pitch of Leaf 1 of currently equipped flower |
| 34 | 1 | Roll of Leaf 1 of currently equipped flower |
| 35 | 2 | Unknown |
| 37 | 1 | Unknown |
| 38 | 2 | Scale factor 1 of Leaf 1 |
| 3A | 2 | Scale factor 2 of Leaf 1 |
| 3C | 4 | Unknown |
| 40 | 2 | Unknown |
| 42 | 1 | Yaw of Leaf 2 of currently equipped flower |
| 43 | 1 | Pitch of Leaf 2 of currently equipped flower |
| 44 | 1 | Roll of Leaf 2 of currently equipped flower |
| 45 | 2 | Unknown |
| 47 | 1 | Unknown |
| 48 | 2 | Scale factor 1 of Leaf 2 |
| 4A | 2 | Scale factor 2 of Leaf 2 |
| 4C | 4 | Unknown |
| 50 | 2 | Unknown |
| 52 | 1 | Yaw of Leaf 3 of currently equipped flower |
| 53 | 1 | Pitch of Leaf 3 of currently equipped flower |
| 54 | 1 | Roll of Leaf 3 of currently equipped flower |
| 55 | 2 | Unknown |
| 57 | 1 | Unknown |
| 58 | 2 | Scale factor 1 of Leaf 3 |
| 5A | 2 | Scale factor 2 of Leaf 3 |
| 5C | 4 | Unknown |
| 60 | 2 | Unknown |
| 62 | 1 | Yaw of Leaf 4 of currently equipped flower |
| 63 | 1 | Pitch of Leaf 4 of currently equipped flower |
| 64 | 1 | Roll of Leaf 4 of currently equipped flower |
| 65 | 2 | Unknown |
| 67 | 1 | Unknown |
| 68 | 2 | Scale factor 1 of Leaf 4 |
| 6A | 2 | Scale factor 2 of Leaf 4 |
| 6C | 4 | Unknown |
| 70 | 370 | Unknown (Probably further stats for the model of the flower) |
| 3E0 | 4 | Unknown |
| 3E4 | 4 | Unknown |
| 3E8 | 4 | Unknown |
| 3EC | 4 | Unknown |
| 3F0 | 4 | Unknown |
| 3F4 | 4 | Garden Index |
| 3F8 | 80 | 32 [object](StreetPass_Mii_Plaza#object "wikilink") entries with 4 bytes per entry for the viewable garden |
| 478 | 40 | 8 [flower datas](StreetPass_Mii_Plaza#flower_data "wikilink") for the placed flowers in the viewable garden. These are referenced by the slot index in the object entries. |
| 4B8 | 48 | Unknown/Unused |

#### Object

| Offset | Length | Desciption |
|----|----|----|
| 0 | 1 | Slot index(if flower)/ID(if decoration) of object 1 (Bit 1-8; Least significant) |
| 1 | 1 | Object ID of object 1 (Bit 1-4; Most significant); Type of object (Bit 5-8; 0=Flower, 1=Decoration, 2-15=Empty slot) |
| 2 | 1 | Rotation of object 1 (no effect on decorations) |
| 3 | 1 | Position/Slot in garden of object 1 |

#### Flower Data

These datas are referenced by the slot index from an object entry if the type is flower.

| Offset | Length | Desciption                             |
|--------|--------|----------------------------------------|
| 0      | 1      | Blossom shape                          |
| 1      | 1      | Color of petals                        |
| 2      | 1      | Leaf shape ID                          |
| 3      | 1      | Stem structure ID                      |
| 4      | 2      | Grow height/status (200 = fully grown) |
| 6      | 1      | Pot of flower                          |
| 7      | 1      | Flags: 0x01 show flower petals         |

### StreetPass Mansion Statistics

The statistic is only updated when a floor is completed.

| Offset | Length | Desciption |
|----|----|----|
| 0 | 4 | Unknown |
| 4 | 2 | Maximum HP |
| 6 | 2 | Highest Floor completed |
| 8 | 8 | [Item Slot](StreetPass_Mii_Plaza#item_slot "wikilink") 1 |
| 10 | 8 | Item Slot 2 |
| 18 | 8 | Item Slot 3 |
| 20 | 8 | Item Slot 4 |
| 28 | 8 | Item Slot 5 |
| 30 | 8 | Item Slot 6 |
| 38 | 8 | Item Slot 7 |
| 40 | 8 | Item Slot 8 |
| 48 | 2 | Number of item slots that have an item |
| 4A | 2 | Unknown |
| 4C | 2 | Puzzle Box 1 Record Time (Divide by 10 to get the seconds as a decimal number) |
| 4E | 2 | Puzzle Box 2 Record Time |
| 50 | 2 | Puzzle Box 3 Record Time |
| 52 | 2 | Puzzle Box 4 Record Time |
| 54 | 2 | Puzzle Box 5 Record Time |
| 56 | 2 | Puzzle Box 6 Record Time |
| 58 | 2 | Puzzle Box 7 Record Time |
| 5A | 2 | Puzzle Box 8 Record Time |
| 5C | 2 | Puzzle Box 9 Record Time |
| 5E | 2 | Puzzle Box 10 Record Time |
| 60 | 2 | Puzzle Box 11 Record Time |
| 62 | 2 | Puzzle Box 12 Record Time |
| 64 | 2 | Puzzle Box 13 Record Time |
| 66 | 2 | Puzzle Box 14 Record Time |
| 68 | 2 | Puzzle Box 15 Record Time |
| 6A | 2 | Puzzle Box 16 Record Time |
| 6C | 2 | Puzzle Box 17 Record Time |
| 6E | 2 | Puzzle Box 18 Record Time |
| 70 | 2 | Puzzle Box 19 Record Time |
| 72 | 2 | Puzzle Box 20 Record Time |
| 74 | 2 | Puzzle Box 21 Record Time |
| 76 | 2 | Puzzle Box 22 Record Time |
| 78 | 2 | Puzzle Box 23 Record Time |
| 7A | 2 | Puzzle Box 24 Record Time |
| 7C | 2 | Puzzle Box 25 Record Time |
| 7E | 2 | Puzzle Box 26 Record Time |
| 80 | 2 | Puzzle Box 27 Record Time |
| 82 | 2 | Puzzle Box 28 Record Time |
| 84 | 2 | Puzzle Box 29 Record Time |
| 86 | 2 | Puzzle Box 30 Record Time |
| 88 | 2 | Puzzle Box 31 Record Time |
| 8A | 2 | Puzzle Box 32 Record Time |
| 8C | 2 | Puzzle Box 33 Record Time |
| 8E | 2 | Puzzle Box 34 Record Time |
| 90 | 2 | Puzzle Box 35 Record Time |
| 92 | 2 | Puzzle Box 36 Record Time |
| 94 | 2 | Puzzle Box 37 Record Time |
| 96 | 2 | Puzzle Box 38 Record Time |
| 98 | 2 | Puzzle Box 39 Record Time |
| 9A | 2 | Puzzle Box 40 Record Time |
| 9C | 2 | Puzzle Box 41 Record Time |
| 9E | 2 | Puzzle Box 42 Record Time |
| A0 | 2 | Puzzle Box 43 Record Time |
| A2 | 2 | Puzzle Box 44 Record Time |
| A4 | 2 | Puzzle Box 45 Record Time |
| A6 | 2 | Puzzle Box 46 Record Time |
| A8 | 2 | Puzzle Box 47 Record Time |
| AA | 2 | Puzzle Box 48 Record Time |
| AC | 2 | Puzzle Box 49 Record Time |
| AE | 2 | Puzzle Box 50 Record Time |

#### Item Slot

| Offset | Length | Desciption                                                |
|--------|--------|-----------------------------------------------------------|
| 0      | 1      | Item Type (0 = Weapon; 1 = Usable Item; 2 = Passive Item) |
| 1      | 1      | Item ID                                                   |
| 2      | 2      | Current Experience                                        |
| 4      | 1      | Skill ID of Weapon                                        |
| 5      | 1      | Skill Level                                               |
| 6      | 1      | Max Level of Weapon                                       |
| 7      | 1      | Current Level of Weapon                                   |

### StreetPass Squad Statistics

| Offset | Length | Desciption                                         |
|--------|--------|----------------------------------------------------|
| 0      | 4      | Unknown                                            |
| 4      | 2      | Current title                                      |
| 6      | 2      | Unknown                                            |
| 8      | 4      | Arcade Mode Normal Highscore                       |
| C      | 2      | Level reached in Arcade Mode Normal (-1 if beaten) |
| E      | 2      | Level reached in Arcade Mode Normal                |
| 10     | 4      | Arcade Mode Hard Highscore                         |
| 14     | 2      | Level reached in Arcade Mode Hard                  |
| 16     | 2      | Level reached in Arcade Mode Hard (?)              |
| 18     | 4      | 1-1 Highscore                                      |
| 1C     | 4      | 1-2 Highscore                                      |
| 20     | 4      | 1-3 Highscore                                      |
| 24     | 4      | 2-1 Highscore                                      |
| 28     | 4      | 2-2 Highscore                                      |
| 2C     | 4      | 2-3 Highscore                                      |
| 30     | 4      | 3-1 Highscore                                      |
| 34     | 4      | 3-2 Highscore                                      |
| 38     | 4      | 3-3 Highscore                                      |
| 3C     | 4      | 4-1 Highscore                                      |
| 40     | 4      | 4-2 Highscore                                      |
| 44     | 4      | 4-3 Highscore                                      |
| 48     | 4      | 5-1 Highscore                                      |
| 4C     | 4      | 5-2 Highscore                                      |
| 50     | 4      | 5-3 Highscore                                      |

### StreetPass Fishing Statistics

| Offset | Length | Desciption |
|----|----|----|
| 0 | 4 | Unknown |
| 4 | 4 | Unknown |
| 8 | 4 | Unknown |
| C | 4 | Unknown |
| 10 | 2 | Index number of mysterious fish (e.g. 0xA0 for Giant Squid, 0xFFFF for no fish) |
| 12 | 2 | Remaining stamina of mysterious fish (divided by 100) |
| 14 | 1 | Index of island where mysterious fish where failed to be catched |
| 15 | 1 | Index of fishing spot where mysterious fish where failed to be catched |
| 16 | 2 | Unknown |
| 18 | 4 | Unknown |
| 1C | 4 | Catches |
| 20 | 4 | Catched Species |
| 24 | 2 | Record of Sardine's size (multiplied with factor 0.0013) |

### StreetPass Zombies Statistics

| Offset | Length | Desciption |
|----|----|----|
| 0 | 4 |  |
| 4 | 4 | CRC32 of the 0x200 bytes in this statistic with this field being 0 |
| 8 | 4 | Station Highscrore |
| C | 4 | Hospital Highscore |
| 10 | 4 | Car Park Highscore |
| 14 | 4 | Back Alley Highscore |
| 18 | 4 | Stadium Highscore |
| 1C | 4 | Stadium Showdown Highscore |
| 20 | 4 | Mall Entrance Highscore |
| 24 | 4 | Mall Walkway Highscore |
| 28 | 4 | Mall Plaza Highscore |
| 2C | 4 | Warehouse Highscore |
| 30 | 4 | Food Court Highscore |
| 34 | 4 | Food Court Showdown Highscore |
| 38 | 4 | Suburb Highscore |
| 3C | 4 | Construction Site Highscore |
| 40 | 4 | Gas Station Highscore |
| 44 | 4 | Highway Highscore |
| 48 | 4 | Cornfield Highscore |
| 4C | 4 | Suburb Showdown Highscore |
| 50 | 4 | Tunnel Highscore |
| 54 | 4 | Graveyard Highscore |
| 58 | 4 | Power Plant Highscore |
| 5C | 4 | Hydroelectric Dam Highscore |
| 60 | 4 | Reservior Highscore |
| 64 | 4 | Graveyard Showdown Highscore |
| 68 | 4 | Research Center Entrance Highscore |
| 6C | 4 | Slime Center Highscore |
| 70 | 4 | Laboratory Highscore |
| 74 | 4 | Elevator Highscore |
| 78 | 4 | Rooftop Highscore |
| 7C | 4 | Rooftop Showdown Highscore |
| 80 | 180 | Unknown/Unused |

### StreetPass Slot Racer Statistics

| Offset | Length | Desciption |
|----|----|----|
| 0 | 4 | Unknown |
| 4 | 4 | CRC32 of the 0x400 bytes in this statistic with this field being 0 |
| 8 | 4 | Unknown |
| C | DC | Unknown Probably Custom Car |
| E8 | 1 | Record minutes of Smooth Circuit |
| E9 | 1 | Record seconds of Smooth Circuit |
| EA | 1 | Record hundredth of Smooth Circuit |
| EB | 1 | Record minutes of Fairytale Glade |
| EC | 1 | Record seconds of Fairytale Glade |
| ED | 1 | Record hundredth of Fairytale Glade |
| EE | 1 | Record minutes of Rolling Mountain |
| EF | 1 | Record seconds of Rolling Mountain |
| F0 | 1 | Record hundredth of Rolling Mountain |
| F1 | 1 | Record minutes of Smooth Night Circuit |
| F2 | 1 | Record seconds of Smooth Night Circuit |
| F3 | 1 | Record hundredth of Smooth Night Circuit |
| F4 | 1 | Record minutes of Autumn Fairytale |
| F5 | 1 | Record seconds of Autumn Fairytale |
| F6 | 1 | Record hundredth of Autumn Fairytale |
| F7 | 1 | Record minutes of Isle O'Thrills |
| F8 | 1 | Record seconds of Isle O'Thrills |
| F9 | 1 | Record hundredth of Isle O'Thrills |
| FA | 1 | Record minutes of Boom Town Streets |
| FB | 1 | Record seconds of Boom Town Streets |
| FC | 1 | Record hundredth of Boom Town Streets |
| FD | 1 | Record minutes of Desert Whirl |
| FE | 1 | Record seconds of Desert Whirl |
| FF | 1 | Record hundredth of Desert Whirl |
| 100 | 1 | Record minutes of Sunset Isle O'Thrills |
| 101 | 1 | Record seconds of Sunset Isle O'Thrills |
| 102 | 1 | Record hundredth of Sunset Isle O'Thrills |
| 103 | 1 | Record minutes of Boom Town Nightlife |
| 104 | 1 | Record seconds of Boom Town Nightlife |
| 105 | 1 | Record hundredth of Boom Town Nightlife |
| 106 | 1 | Record minutes of Sugar Dash! |
| 107 | 1 | Record seconds of Sugar Dash! |
| 108 | 1 | Record hundredth of Sugar Dash! |
| 109 | 1 | Record minutes of Soaring Skyway |
| 10A | 1 | Record seconds of Soaring Skyway |
| 10B | 1 | Record hundredth of Soaring Skyway |
| 10C | 1 | Record minutes of Dizzy Woods |
| 10D | 1 | Record seconds of Dizzy Woods |
| 10E | 1 | Record hundredth of Dizzy Woods |
| 10F | 1 | Record minutes of Dinner Dash! |
| 110 | 1 | Record seconds of Dinner Dash! |
| 111 | 1 | Record hundredth of Dinner Dash! |
| 112 | 1 | Record minutes of Stormy Skyway |
| 113 | 1 | Record seconds of Stormy Skyway |
| 114 | 1 | Record hundredth of Stormy Skyway |
| 115 | 1 | Record minutes of Sundown at Rolling Mountain |
| 116 | 1 | Record seconds of Sundown at Rolling Mountain |
| 117 | 1 | Record hundredth of Sundown at Rolling Mountain |
| 118 | 1 | Record minutes of Starry Desert Whirl |
| 119 | 1 | Record seconds of Starry Desert Whirl |
| 11A | 1 | Record hundredth of Starry Desert Whirl |
| 11B | 1 | Record minutes of Deep Dark Dizzy Woods |
| 11C | 1 | Record seconds of Deep Dark Dizzy Woods |
| 11D | 1 | Record hundredth of Deep Dark Dizzy Woods |
| 11E | 1 | Record minutes of Outer Space |
| 11F | 1 | Record seconds of Outer Space |
| 120 | 1 | Record hundredth of Outer Space |
| 121 | 6 | Unknown/Maybe record time of 2 unreleased tracks |
| 127 | 3F | Previous record time of tracks(?) |
| 166 | 2A | Unknown |
| 190 | 13 | Type of booster used for the record time (0 = grey; 1 = blue; 2 = gold) |

### StreetPass Trader Statistics

| Offset | Length | Desciption                                              |
|--------|--------|---------------------------------------------------------|
| 0      | 4      | Unknown                                                 |
| 0      | 4      | Unknown                                                 |
| 8      | 8      | Current amount of                                       |
| 10     | 4      | Cummulative number of Day Tradings                      |
| 14     | 4      | Number of Day Trades of Piece-by-Piece Deliveries       |
| 18     | 4      | Number of Day Trades of Kingfinder Studios              |
| 1C     | 4      | Number of Day Trades of Leisura Aerospace               |
| 20     | 4      | Number of Day Trades of Sparkleseed Landscaping         |
| 24     | 4      | Number of Day Trades of Conqueror Construction          |
| 28     | 4      | Number of Day Trades of Arzodius Research Labs          |
| 2C     | 4      | Number of Day Trades of Poseidon Island Fisheries       |
| 30     | 4      | Number of Day Trades of Hobbiville Pharmaceuticals      |
| 34     | 4      | Unknown                                                 |
| 38     | 4      | Highest profit per second in Piece-by-Piece Deliveries  |
| 40     | 4      | Highest profit per second in Kingfinder Studios         |
| 48     | 4      | Highest profit per second in Leisura Aerospace          |
| 50     | 4      | Highest profit per second in Sparkleseed Landscaping    |
| 58     | 4      | Highest profit per second in Conqueror Construction     |
| 60     | 4      | Highest profit per second in Arzodius Research Labs     |
| 68     | 4      | Highest profit per second in Poseidon Island Fisheries  |
| 70     | 4      | Highest profit per second in Hobbiville Pharmaceuticals |
| 78     | 4      | Profit/loss in Piece-by-Piece Deliveries                |
| 80     | 4      | Profit/loss in Kingfinder Studios                       |
| 88     | 4      | Profit/loss in Leisura Aerospace                        |
| 90     | 4      | Profit/loss in Sparkleseed Landscaping                  |
| 98     | 4      | Profit/loss in Conqueror Construction                   |
| A0     | 4      | Profit/loss in Arzodius Research Labs                   |
| A8     | 4      | Profit/loss in Poseidon Island Fisheries                |
| B0     | 4      | Profit/loss in Hobbiville Pharmaceuticals               |
| B8     | 4      | Unknown                                                 |
| BC     | 44     | Unknown/Unused                                          |
