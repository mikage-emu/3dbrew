Yellows8 what makes you think the developer home menu title is read from
[config](CfgS:GetConfigInfoBlk2#ConfigInfoBlks "wikilink")? Why would
Nintendo make it different from
retail?--[3dsguy](User:3dsguy "wikilink") 09:04, 22 July 2012 (CEST)


Register 0x1FF80014 contains various info for the unit type. When
bitmask 0xFE for that register value is set, the TID is loaded from
config, otherwise it's loaded from some array. I'm not entirely sure
which path is for retail and which one is dev, since I don't remember
what other modules check this bitmask instead of bit0 in that register.
--[Yellows8](User:Yellows8 "wikilink") 19:45, 22 July 2012 (CEST)