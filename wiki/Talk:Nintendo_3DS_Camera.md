So there is a universal NCCH key for retail
units?--[3dsguy](User:3dsguy "wikilink") 16:48, 27 August 2012 (CEST)


No, there is no universal NCCH key for retail. \*Every\*
[AES](AES "wikilink") engine keyslot uses the hardware key-scrambler,(on
retail decrypted ticket titlekeys are the only exception) so there's no
way to retrieve the actual final normal-key used. Also, one part of the
input XY keys is unique per NCCH therefore the final normal-key is
unique per NCCH. --[Yellows8](User:Yellows8 "wikilink") 17:05, 27 August
2012 (CEST)