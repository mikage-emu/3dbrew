- Can't help with nand reading but lib references give some indication
  of the filesystem.

**Note! some of these NAND paths below may be outdated**. Confirmed NAND
directories/directory structures are on the [Flash
Filesystem](Flash_Filesystem "wikilink") page.

|                                   |
|-----------------------------------|
| nand:/extdata                     |
| nand:/ro/                         |
| nand:/ro/sys/HWCAL0.dat           |
| nand:/ro/sys/HWCAL1.dat           |
| nand:/rw/                         |
| nand:/rw/sys/                     |
| nand:/rw/sys/config               |
| nand:/rw/sys/updater.log          |
| nand:/rw/sys/PlayHistory.dat      |
| nand:/rw/sys/PedometerHistory.dat |
| nand:/rw/sys/LocalFriendCodeSeed  |
| nand:/rw/sys/SecureInfo           |
| nand:/title                       |
| nand:/title/%08x/%08x             |
| nand:/title/%08x/%08x/%08x.app    |
| nand:/title/%08x/%08x/title.tmd   |
| nand:/ticket                      |
| nand:/ticket/%08x/%08x.tik        |
| nand:/tmp                         |

@yellows8, since the \titles directory is similar between nand and sdmc,
do you think it should have a separate page from the [SD
Filesystem](SD_Filesystem "wikilink")
page?--[3dsguy](User:3dsguy "wikilink") 02:36, 23 August 2012 (CEST)


Go ahead.(SD/NAND /title is exactly the same, except for the additional
encryption for SD perhaps) NAND has .db files too, but I'm not sure
where those are located. --[Yellows8](User:Yellows8 "wikilink") 02:59,
23 August 2012 (CEST)

## Possible firmware downgrade vulnerability

Please correct where I'm wrong. Assume we have NAND-dumps from two 3DS
units A and B for both firmware versions X and Y. I.e. 4 data sets AX,
AY, BX, BY. Assume that all clear data is identical for the same
firmware version or unique per console and stay untouched with firmware
version change (i.e. AX, BX is a brand-new console with a factory reset
dumps and AY, BY have just updated firmwares). Then AX xor AY = BX xor
BY and BX = BY xor AX xor AY.


There's no way to convert a NAND image from one 3DS for use on another
3DS, without generating the NAND xorpad(s) for both systems(requires
ARM9 code exec on both). Another reason why ARM9 exec is needed here is
because there's certain files stored in CTRNAND containing
console-unique AESMACs. Since that keyslot is initialized by bootrom
those AESMACs can only be calculated on the same 3DS which you're
calculating these CTRNAND AESMACs for.
--[Yellows8](User:Yellows8 "wikilink") 18:02, 10 April 2014 (CEST)


I'm not about converting a NAND image from system to another directly.
Can we alculate for a various firmware byte-to-byte XOR-difference,
which result the same xorpads for each system to annihilate. And for the
same CTRNAND files untouched with a firmware update this difference will
be zero. So applying this difference for another console CTRNAND will
update a firmware without the need of the actual console-unique
xorpad--[Duke srg](User:Duke_srg "wikilink") 21:48, 10 April 2014 (CEST)


The CTRNAND files /w console-unique AESMACs I'm referring to get updated
when sys-updates get installed, if those don't get updated
properly(invalid AESMACs for example) you would have a system which
would fail to boot when it tries to launch titles from CTRNAND-FS.
There's no way to properly update those files without proper NAND
xorpads/etc. --[Yellows8](User:Yellows8 "wikilink") 22:11, 10 April 2014
(CEST)


Ok, just to clarify, during system update AESMAC init file IS updated
with the new console-unique data. So after transferring firmware changes
from one system to another without complete decypher, during next boot
at least AESMAC file on CTR NAND partition contents will have wrong data
and REG_AESMAC being initialized with that will fail the following boot
process. Smart enough.--[Duke srg](User:Duke_srg "wikilink") 05:59, 11
April 2014 (CEST)


Yeah, at least one of those console-unique AESMACs would be rendered
invalid with method you're describing.
--[Yellows8](User:Yellows8 "wikilink") 06:21, 11 April 2014 (CEST)


Aren't you talking about a movable.sed file or there are others not
mentioned explicitly?--[Duke srg](User:Duke_srg "wikilink") 14:01, 11
April 2014 (CEST)


No, I mean this: [Title_Database](Title_Database "wikilink").
--[Yellows8](User:Yellows8 "wikilink") 18:23, 11 April 2014 (CEST)

## Note:

There is currently a third TWL partition whose location in NAND is
currently unknown. Said partition is TWLS, or TWL Sound. By default,
this partition is empty, however, if you record a sound with the DSi
Sound app, the partition is populated, similar to TWLP.
--[MassExplosion213](User:MassExplosion213 "wikilink") 23:03, 17 April
2016 (CEST)