Why would the [Dev
Menu](3DS_Development_Unit_Software#Dev_Menu "wikilink") titleID
(000400000ff40002) be found in the "ConfigInfoBlks" of a retail
unit?--[3dsguy](User:3dsguy "wikilink") 07:14, 23 July 2012 (CEST)


That block is only used on dev units, it presumably doesn't exist in the
retail config. --[Yellows8](User:Yellows8 "wikilink") 07:38, 23 July
2012 (CEST)


I thought you didn't have a dev unit?--[3dsguy](User:3dsguy "wikilink")
07:41, 23 July 2012 (CEST)


No I don't. The retail NS module checks whether the system is retail, or
dev/debug. For the former it loads the menu TID from a register, for the
latter it loads the menu TID from this config block.
--[Yellows8](User:Yellows8 "wikilink") 07:48, 23 July 2012 (CEST)


Well hang on, if the NS decides to load as dev/debug and proceeds to
load the menu with the TID in the Config Info Blocks, shouldn't this
title be either the Home Menu or Test Menu *not* the Dev
Menu?--[3dsguy](User:3dsguy "wikilink") 08:14, 23 July 2012 (CEST)


Yeah, this config block contains the TID of the menu which is launched
when the system boots up. --[Yellows8](User:Yellows8 "wikilink") 08:23,
23 July 2012 (CEST)