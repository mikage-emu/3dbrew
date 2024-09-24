First 4 bytes IS a Mii ID, you can check gold-bottomed MIIs.


I see Gold-bottomed Miis have a header of 0x11 instead of 0x91 but
what's a MiiID? Where did you hear of that concept? (btw use the
signature button) --[Elisherer](User:Elisherer "wikilink") 21:39, 7
February 2012 (CET)


Nevermind...I read about it
[here](http://code.google.com/p/jmiieditor/source/browse/trunk/src/jMiiEditor/mii/Mii.java)
and it seems true...so the mac address is the 3DS
Id...kindof..--[Elisherer](User:Elisherer "wikilink") 21:49, 7 February
2012 (CET)

I get the suspicion that the block from 0x18 to 0x5C is in the same
format as [Wiimote Mii data](http://wiibrew.org/wiki/Wiimote/Mii_Data),
however it seems to be little-endian in the case of the 3DS. This may or
may not help figuring out the encryption. Also, the 0x14 bytes at 0x5C
may be a SHA1 hash of the Mii data, and the 0x10 bytes at 0x10 may be
used as an IV for AES-CTR encryption or something...
--[Luigi2us](User:Luigi2us "wikilink") 23:17, 7 February 2012 (CET)


I'm not dismissing anything but from some of my decrypted miis it seems
similiar but not the same, plus, it would mean that the Mii id and the
mac would appear again inside the encrypted data, (and another point:
the distance, in bytes, between the name and the creator's name is not
the same), I agree about the AES-CTR and the IV
--[Elisherer](User:Elisherer "wikilink") 23:32, 7 February 2012 (CET)


Oh right, I counted wrong. Also the last 0x14 bytes can't be a SHA1, the
first 2 bytes don't change between two Miis with the same ID... I don't
know of 0x12-byte hash algorithms, and afaik Nintendo doesn't use MD5,
so all I can think of is a AES-CBC MAC...
--[Luigi2us](User:Luigi2us "wikilink") 23:42, 7 February 2012 (CET)

We should try to make Miis on PC with MyAvatarEditor
(http://www.softpedia.com/progDownload/My-Avatar-Editor-Download-180170.html),
export it to WiiMote with MiiTransfer
(http://mirror.transact.net.au/pub/sourceforge/w/project/wd/wdml/WDML%20-%20MiiTransfer/)
and transfer to 3DS via Mii channel and then we can analyse the
differences and assure that only MiiID and MAC section is used as a key.
Unfortunately I do not have a Wii for that, but all other steps worked
fine with Dolphin. --[Duke srg](User:Duke_srg "wikilink") 07:50, 8
February 2012 (CET)