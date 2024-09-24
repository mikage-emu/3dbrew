If the CPU is ARM does it have JTAG or SWD test access points.

We need a datasheet about the ARM11!

I thought the ARM11 has a JTAG support? How can we dump the NAND,
through its pinout yes, but how can we do it exactly? I would like to do
some tests on it to see how it
works.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 23:36, 10
September 2011 (CEST)


The ARM11 IP (intellectual property) has JTAG support, however this port
can probably be permanently disabled internally. So there is no way of
knowing if this port even still works or exists in the first place.

For dumping NAND, you need to hook up the NAND pins to an FPGA or
microcontroller. Then you need to follow the eMMC hardware protocol to
read out the data in the various sectors.
--[Neimod](User:Neimod "wikilink") 07:06, 11 September 2011 (CEST)

\- Was there data on the raw NAND dumps that wasn't encrypted? Also, was
it from a retail unit?

\- Are pins exposed underneath the white-banding on the edges of the 3
largest chips? thx [Jl12](User_talk:Jl12 "wikilink")

Are there any photos of the back of the 3DS's PCB? Anything available in
a higher resolution (front or back)? Closeups of the SoC and surrounding
components (front and back)? Any help greatly appreciated, thanks!
--[CHR15x94](User:CHR15x94 "wikilink") 00:35, 13 September 2011 (CEST)


You could ask the
[Doctor](http://www.youtube.com/watch?v=OFoZGt8tCNw&feature=related)
--[Elisherer](User:Elisherer "wikilink") 19:16, 13 September 2011 (CEST)


Hop... found
[some](http://tvgzone.com/viewthread.php?tid=6136&highlight=3ds). Maybe
we should add them to our page? --[Elisherer](User:Elisherer "wikilink")
19:23, 13 September 2011 (CEST)


That's
[from](http://www.ifixit.com/Teardown/Nintendo-3DS-Teardown/5029/2)
[iFixit](http://guide-images.ifixit.net/igi/IkjXAUHUgmdZch6A.large),
which is already linked to on the page.
--[Yellows8](User:Yellows8 "wikilink") 20:50, 13 September 2011 (CEST)


Crap, I always manage to miss things like that... \>_\< Anyway, thanks
Elisherer and Yellows8. --[CHR15x94](User:CHR15x94 "wikilink") 21:11, 13
September 2011 (CEST)

Yes, please add them or replace the existing ones if
nesessary.--[Lazymarek9614](User:Lazymarek9614 "wikilink")

Hi, My friend, kouchan can't dump the eMMC of his new 3DS. He has
already succeeded in dumping old 3DS with the same card reader. Is the
pinout of new 3DS really correct?--[173210](User:173210 "wikilink")
11:43, 16 April 2015 (CEST)


He finally succeeded. It seems
correct.--[173210](User:173210 "wikilink") 08:08, 20 April 2015 (CEST)

## Disply dump

pinout point ("TP"+number)

|               |             |
|---------------|-------------|
| point name    | signal name |
| 184           | R0          |
| 178           | R1          |
| 172           | R2          |
| 166           | R3          |
| 183           | R4          |
| 177           | R5          |
| 171           | R6          |
| 165           | R7          |
| 186           | G0          |
| 180           | G1          |
| 174           | G2          |
| below 180(14) | G3          |
| 185           | G4          |
| 179           | G5          |
| below 179(15) | G6          |
| 167           | G7          |
| 188           | B0          |
| 182           | B1          |
| 176           | B2          |
| 170           | B3          |
| 187           | B4          |
| 181           | B5          |
| 175           | B6          |
| 169           | B7          |
| CLK           | 189         |
| VSYNC         | 191         |
| HSYNC         | 190         |
|               |             |

\[\[File:Pinout_point.jpg\|File:Pinout_point.jpg\]\] RGB signal (touch
screen)... I'll add later.--Matyapiro31 16:59, 4 March 2012 (CET)

If you want to buy the kit ,e-mail or pm me with :

Name

Estimation or buy

the number

way to purchase

way to sending

Postal code

Your address

--Matyapiro31 03:07, 31 March 2012 (CEST)

Are you talking about selling a 3DS version of this?
<http://home.comcast.net/~olimar/DSCapture/>
--[MegaByte](User:MegaByte "wikilink") 05:58, 5 April 2012 (CEST)

## L2 cache on O3DS

Is there any L2 cache present on O3Ds at all? The wording "additional
2MB L2 cache" makes it sound like it. If applicable, do we have any idea
how big the O3DS's L2 cache is? [Neobrain](User:Neobrain "wikilink")
16:39, 29 September 2015 (CEST)


You are right, there is no L2 cache on the O3DS afaik.
[Plutooo](User:Plutooo "wikilink") 16:43, 29 September 2015 (CEST)

## Even larger SD cards

I myself can confirm that a 256 GB microSD card works fine within my
personal New 3DS XL. The system does take ~25 seconds starting up though
(part of this might be me running an emuNAND off it as well). It also
takes forever loading large numbers of application tiles. My O3DS also
runs a 128 GB microSD, also with an emuNAND, taking about ~20 seconds on
boot.
I'm pretty sure the SD card controller can handle even larger SD cards,
but I simply don't have larger SD cards to test. I also think each card
and each system will react differently to each other, I had the O3DS
microSD in my N3DSXL for a long time (also using an emuNAND, it's a lot
easier to replace an SD card than a motherboard) and if I remember
correctly it also took forever booting up, longer than the O3DS takes
right now. <https://www.3dbrew.org/wiki/User:Hail>