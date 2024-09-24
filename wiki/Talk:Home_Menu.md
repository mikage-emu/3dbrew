The newest update fixs bug that I found. Before anyone can dump ram,so I
don't know whether it was exploitable or not...---Matyapiro31 14:09, 22
December 2011 (CET)

I had a little problem about region lockout: I just learned that Chinese
mainland 3DS XL can play The Legend of Zelda: Ocarina of Time 3D
cartridge of Taiwan. But from the [SMDH](SMDH "wikilink") page, they
belong to different BNR Regions, I wonder why.
--[黄金の轰龙](User:黄金の轰龙 "wikilink") 04:48, 30 November 2012 (CET)


Unless you have some other way of confirming the circumstances, I really
can't give a reason why that might be. There could be many factors which
could cause this.--[3dsguy](User:3dsguy "wikilink") 08:29, 30 November
2012 (CET)


Thanks... Can you tell me what “way of confirming the circumstances” is?
I will try my best to find it out.
--[黄金の轰龙](User:黄金の轰龙 "wikilink") 13:55, 30 November 2012 (CET)


I mean like, knowing for sure that the demo was definitely Taiwanese
demo, and the 3DS was definitely Chinese. But with what you've said on
GBATemp, most likely the demo was configured to be region free, because
other Taiwanese titles didn't work on the Chinese
3DS.--[3dsguy](User:3dsguy "wikilink") 14:23, 30 November 2012 (CET)

## Theory on Update Version organisation, by Razor83

It seems clear that only online updates increment the last number of the
firmware version, game card updates maintain the same last number as
whichever firmware you previously had installed (e.g. If you had updated
your 3DS firmware to 1.1.0-1 online, and then your next update was from
the Super Mario 3D Land game card, you would end up being on 2.2.0-1)
This seems like a really odd way of numbering updates, and I am sure it
will lead to much confusion in the future.

From looking at Nintendo's list, it seems logical to assume that 2.1.0-X
was also released on game cards, so probably Star Fox 64 3D and Doctor
Lautrec and The Forgotten Knights contained 2.1.0-X (This is just a
guess though)

This updated list seems likely:-

List of all updates released online so far.

`1.0.0-0`
`1.1.0-1`
`2.0.0-2`
`2.1.0-3`
`2.1.0-4`
`3.0.0-5`
`3.0.0-6`

List of all updates released on game cards so far.

`1.0.0-X`
`1.1.0-X`
`2.1.0-X`
`2.2.0-X`

X = Same last number as whatever firmware version you were previously on
before update (0, 1, 2, 3, 4, etc) Only online updates increment the
last number.

Offset 0x328 Hex and Binary Values and possible update version.

`00040000 = 0000 0000 0000 0100 0000 0000 0000 0000 = v1.0.0-X`
`15040000 = 0001 0101 0000 0100 0000 0000 0000 0000 = v1.1.0-X`
`15080000 = 0001 0101 0000 1000 0000 0000 0000 0000 = v2.1.0-X`
`28080000 = 0010 1000 0000 1000 0000 0000 0000 0000 = v2.2.0-X`

[Source](http://gbatemp.net/topic/308971-3dsexplorer/page__st__90)

Hopefully someone can interpret this and move this to Home Menu page,
but it's here for now because it's the best explanation yet.