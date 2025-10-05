+++
title = 'Talk:SMDH'
+++

Thanks for clearing this up, yellows8! I remember if I saw the SMDH magic in CIAs and wondered why its structure was in CIAs only...--[Lazymarek9614](User:Lazymarek9614 "wikilink") 15:47, 9 April 2012 (CEST)

"*while CIA icons are only displayed while selecting CIAs from SD card on a dev 3DS*" When selecting CIA files from a SD card on my Dev 3DS, I don't see any icons. (rev 37904)--[3dsguy](User:3dsguy "wikilink") 05:24, 12 April 2012 (CEST)

  
Where are those CIA icons displayed then?(fix that on the page as needed) --[Yellows8](User:Yellows8 "wikilink") 05:57, 12 April 2012 (CEST)

  
I'm not quite sure what they are for, As I have changed the icons and names in a CIA file, then installed it. And during the process of installing it I never saw the changed icons or names anywhere. My best guess is that they are dummies put there so devs can double check the CIA contains the app that the dev wants. Maybe Nintendo plans to utilise the dummy icons and names in future version of Dev Menu, but at the moment every Dev Menu revsion I have used/seen has not utilised the dummy icons or names at all.--[3dsguy](User:3dsguy "wikilink") 11:36, 12 April 2012 (CEST)

## Are the second set of "flag" bytes (0x202A and 0x202B) reserved, or more undocumented flags?

The flags are documented to be 0x4 size in the first table in the Application Settings section, yet the Flags table is only documenting 0x2 size bitmask values. Does anyone know if the other two bytes are reserved, or if there are undocumented flags that go in addresses 0x202A and 0x202B?

If it's the former, then the size in the "Flags" entry should be changed from 0x4 to 0x2, and a "reserved" entry with starting address 0x202A and with size 0x2 should be added, to dispel confusion. If it's the latter, a note should be put in saying we don't yet have the other two bytes documented.

Edit: It could also be not reserved but unused... either way, I feel like it should be more clearly documented.
