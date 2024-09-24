Obviously the 3DS Retail titles have TitleIDs as well and they share the
same prefix as the eShop titles:

Should we put a new category or put eShop and retail titles togather?
--[Elisherer](User:Elisherer "wikilink") 19:15, 6 September 2011 (CEST)

`0004000000037500 Tom Clancy's Ghost Recon: Shadow Wars - EUR`
`0004000000038900 Super Monkeyball 3D - EUR`
`0004000000038c00 Lego Star Wars III: The Clone Wars - EUR`

IMO that extdata section would be more appropriate on the
[SD_Filesystem](SD_Filesystem "wikilink") page, this Title list page
isn't meant for savedata/extdata-related info.(Those "TitleID low/high"
aren't correct either, 00000000 is just an extdata ID while the other ID
is the titleID_low\>\>8.) --[Yellows8](User:Yellows8 "wikilink") 17:26,
16 November 2011 (CET)

Game trials have .ctx files... Why? --Matyapiro31 16:03, 13 December
2011 (CET)

I think 0004000200060201 is the Resident Evil Revelations Trial.
--11111.11106^2 21:37, 19 January 2012 (EST)

"Serial structure" The info described there is not a "serial", it's the
TitleID. This is actual [serials](serials "wikilink").
--[Yellows8](User:Yellows8 "wikilink") 20:33, 1 March 2012 (CET)


"A [serial number](http://en.wikipedia.org/wiki/Serial_number) is a
unique number assigned for identification which varies from its
successor or predecessor by a fixed discrete integer value". I think it
matches its definition...but you can change it if you like :)
--[Elisherer](User:Elisherer "wikilink") 23:03, 1 March 2012 (CET)

I think there is no merit to write all eshop titles information here,
how do you think about?


Indeed. Really don't see the need for listing so many useless retail
titleIDs which originated from warez either.
--[Yellows8](User:Yellows8 "wikilink") 18:05, 29 March 2012 (CEST)

On developer 3DS' programs with the title type '0138' are recognised as
firmware rather than an application and in DevMenu a special option
appears which allows the user to update the system firmware when a
'0138' .cia is selected.


Guess you discovered that by modifying the titleID stored in a .cia?
--[Yellows8](User:Yellows8 "wikilink") 22:43, 15 May 2012 (CEST)


Yeah, have a look [here](http://n-dev.net/showthread.php?tid=1276), I
put my finding there. Though I think it's not quite ready for the wiki
yet.--[3dsguy](User:3dsguy "wikilink") 02:13, 16 May 2012 (CEST)


I already saw that thread. --[Yellows8](User:Yellows8 "wikilink") 03:40,
16 May 2012 (CEST)

3dsguy, almost all of those system titles are from the system update
SOAP response. 000400100002X600 wasn't listed because it was never
listed in SOAP replies. --[Yellows8](User:Yellows8 "wikilink") 17:04, 8
May 2012 (CEST)

On my Developer 3DS, I can bring up the revision of the Home Menu, at
the Home Menu, but it is different to the revision SYSMENU
(0004003000009802). They can't be the same but on the title list page
SYSMENU links to the Home Menu. So... is there something I'm missing
here?--[3dsguy](User:3dsguy "wikilink") 10:59, 15 May 2012 (CEST)


Yes, SYSMENU is Homemenu. Either the dev "revision" is different from
retail, or that's separate from the TMD title version.
--[Yellows8](User:Yellows8 "wikilink") 17:43, 15 May 2012 (CEST)


So they are the same. Well what ever the reason for revision
inconsistency, some
photos:<img src="homemenrev.JPG" title="homemenrev.JPG" width="200"
alt="homemenrev.JPG" />
<img src="Homemenrev2.JPG" title="Homemenrev2.JPG" width="200"
alt="Homemenrev2.JPG" />--[3dsguy](User:3dsguy "wikilink") 02:13, 16 May
2012 (CEST)


That's definitely not the TMD title version, that revision is way higher
than any title version. AFAIK the REV field on that error screen is the
SDK revision. The one displayed in homemenu might be SDK-revision
related too. --[Yellows8](User:Yellows8 "wikilink") 03:40, 16 May 2012
(CEST)


When you say SDK revision, do you mean the SDK revision of the 3DS
firmware or the SDK revision of the the SDK Lib used to build
it.--[3dsguy](User:3dsguy "wikilink") 11:01, 16 May 2012 (CEST)


The error screen REV is the SDK-revision used when building the NCCH.
Not sure what that homemenu revision is.
--[Yellows8](User:Yellows8 "wikilink") 17:00, 16 May 2012 (CEST)

If Korea, China, Taiwan have region coding separate to JPN/USA/EUR, do
you think that they will use different regions in the e-Shop for dsi
titles, because Taiwan doesn't have a dsi region and in turn nor a
dsiware region?--[3dsguy](User:3dsguy "wikilink") 07:19, 24 May 2012
(CEST)


AFAIK DSi CHN/KOR doesn't even have separate regions for DSiWare.
--[Yellows8](User:Yellows8 "wikilink") 08:06, 24 May 2012 (CEST)


For the DSi they did
[DSiBrew.org](http://dsibrew.org/wiki/Title_list#Region_Codes)--[3dsguy](User:3dsguy "wikilink")
09:55, 24 May 2012 (CEST)


I mean they wouldn't have separate 3DS CHN/KOR DSiWare regions when DSi
didn't even have those.(Yes, there's CHN/KOR DSi region-codes but
DSiWare using those regions doesn't exist AFAIK.) Also, generally only
region V is used for DSiWare on DSi for regions outside of USA/JPN.
--[Yellows8](User:Yellows8 "wikilink") 17:14, 24 May 2012 (CEST)

My scripts which check for system updates are now publicly accessible
[here](http://yls8.mtheall.com/reports.php).
--[Yellows8](User:Yellows8 "wikilink") 23:49, 24 May 2012 (CEST)

"*System tickets are retrieved via a SOAP request to NUS, instead of
directly downloading the cetk with HTTPS.*" Did you know that are tmd
and cetk are also available via HTTP for 3ds
titles?--[3dsguy](User:3dsguy "wikilink") 15:56, 25 May 2012 (CEST)


Of course, but this time the 3DS uses SOAP for common/system tickets
instead of HTTP. Also, \*every\* region-specific CTR title also has the
CHN/TWN/KOR regions, just haven't bothered to add those yet.(partly
because some of them use separate title versions) The AUS
region-specific titles are missing too, but trying to retrieve the CTR
AUS titlelist from the twl SOAP server returns nothing.
--[Yellows8](User:Yellows8 "wikilink") 18:10, 25 May 2012 (CEST)


I don't think AUS has a separate CTR title list(I might be
misunderstanding what your saying, but), Australian 3DSs are a part of
the EUR 3DS region, and all of its downloads (including TWL) all are the
EUR version. Also the title versions (for system applications at least)
differ between regions, trying to request versions other than '0' listed
on 3dbrew only work for the USA versions of the
titles--[3dsguy](User:3dsguy "wikilink") 03:34, 26 May 2012 (CEST)


Perhaps the AUS SOAP region is identical to EUR then. The titlelist I'm
referring to is the one returned from SOAP, like
[this](http://yls8.mtheall.com/titlelist.php?date=05-14-12_08-05-00&sys=ctr&reg=E&soap=1).
Some region-specific titles have the same versions for each region, not
sure how many have separate versions though.
--[Yellows8](User:Yellows8 "wikilink") 04:31, 26 May 2012 (CEST)

"For game patches update data, these are the same as the game's *NCSD*,
except these only contain the updated code and updated RomFS data."
Yellows8, are you saying that the content downloaded for game patches
are in CCI format not CXI format? Just asking as it would make more
sense for the 3DS to download a patch
CXI.--[3dsguy](User:3dsguy "wikilink") 11:46, 20 June 2012 (CEST)


Apps downloaded from eShop are NCSD, so I'm assuming game patch titles
are NCSD too.(Retail NAND titles from CDN are NCCH however)
--[Yellows8](User:Yellows8 "wikilink") 17:09, 20 June 2012 (CEST)


I highly doubt that eshop content is ever in NCSD form. If apps
downloaded from the eShop are in NCSD format, why can the TMD of eShop
downloads, specify more than one content(ie app and manual). The size of
the content(s) specified in the TMD, is the same size as the content,
downloaded from the eshop and the content on the SD card is the same
size as well. And on development units, when a SD card app is
installed(via CIA), the content installed on the SD card is the same
size(s) as the CXI(s) extracted from the CIA which installed it, so the
content on the SD card is NCCH form.--[3dsguy](User:3dsguy "wikilink")
01:45, 21 June 2012 (CEST)


So is the dlp child NCCH stored in a separate content for eShop apps as
well?(don't have any eShop app titleIDs for those)
--[Yellows8](User:Yellows8 "wikilink") 02:10, 21 June 2012 (CEST)


I don't have a CIA which installs a dlp child NCCH, but I do have one
with a manual. I'm thinking of preparing a better sample CIA, now that I
understand better how the file formats work.(When I gave the sample cia
to 3DBrew made by Jl12, I had no clue how the 3DS file formats
worked)--[3dsguy](User:3dsguy "wikilink") 07:30, 21 June 2012 (CEST)


Scratch that, I've just found a cia which has a dlp child NCCH. I'll see
what I can do--[3dsguy](User:3dsguy "wikilink") 15:53, 21 June 2012
(CEST)


I've put decrypted examples of a dlp child and manual NCCH on the
[CXI](CXI "wikilink") page if you want to have a look at the contents of
one--[3dsguy](User:3dsguy "wikilink") 12:33, 23 June 2012 (CEST)

@Yellows8 the title you've called "SAFE_MODE System Settings (mset)",
(000400100002XF00), on my dev unit, this launches straight into 'System
Update', you can't do anything else, it's not the whole system settings.
Does it act different for you, as I wouldn't call the system updater
standalone title "SAFE_MODE System
Settings"?--[3dsguy](User:3dsguy "wikilink") 09:34, 19 July 2012 (CEST)


I don't have a dev 3DS so I can't launch that title myself. That title
is \*exactly\* the same as the regular mset, except only system update
is accessible from it. --[Yellows8](User:Yellows8 "wikilink") 17:32, 19
July 2012 (CEST)

3dsguy, why do you think PTM is "Battery"? That system module handles
play history and pedometer stuff. --[Yellows8](User:Yellows8 "wikilink")
05:08, 21 July 2012 (CEST)


It's because I have a compiled SDK Demo for PTM and it's a battery
status reader it monitors the battery level, whether it is charging and
if a charger is connected.--[3dsguy](User:3dsguy "wikilink") 05:15, 21
July 2012 (CEST)

Would it be a good idea to list, some developer application titleIDs on
this list?--[3dsguy](User:3dsguy "wikilink") 05:53, 23 July 2012 (CEST)


That's not really relevant here, TIDs for dev apps are rather useless
unless one has a dev unit. However, NS can load system modules 00001902
and 00003602 which are presumably dev modules, go ahead and add those
system modules to the title list if you know what those are.
--[Yellows8](User:Yellows8 "wikilink") 06:11, 23 July 2012 (CEST)

"No, that title does exist for CHN, TWN, and KOR. AC uses this data
archive, not the NZone app." The archive is used by AC to identify NZone
Hotspots, but those regions don't have the NZone app according to the
Title List, so why would AC use them. Granted they still download
them(according to your logs), but why would they, if it's just used for
NZone?--[3dsguy](User:3dsguy "wikilink") 01:36, 25 July 2012 (CEST)


"N/A" implies that the title doesn't exist for that region, but it does
exist here. The AC module doesn't care what the region is, it loads the
hotspot list regardless of region.
--[Yellows8](User:Yellows8 "wikilink") 03:07, 25 July 2012 (CEST)

Why is it necessary to list practically every retail/eShop title here?
This page is already way too long because of that retail/eShop list.
--[Yellows8](User:Yellows8 "wikilink") 17:24, 30 August 2012 (CEST)


Well it's only really practical to list all the system titles on this
page. As IMO they are the important titles. Having SD card titles on
this list, essentially keep the list complete. Perhaps moving SD card
titles to another page would be better and leaving an excerpt list on
this page linking to the full SD Card title list? Also I don't think the
retail card Title ID list is necessary at
all.--[3dsguy](User:3dsguy "wikilink") 02:01, 31 August 2012 (CEST)


The retail/eShop titles section is close to 5x the lines for system
titles. The retail and demos section should be completely removed. The
eShop section can stay, but most of the unknown/paid-for titles should
be removed. --[Yellows8](User:Yellows8 "wikilink") 02:21, 31 August 2012
(CEST)

Well i found in TMDs there is some titles in this list with a higher
title version. should i change that or just keep going?
--[Syphurith](User:Syphurith "wikilink") 10:40, 28 March 2013 (CET)


Go ahead and fix any incorrect versions.(There's some CHN/TWN/KOR
[titles/versions](http://yls8.mtheall.com/titlelist.php?sys=ctr) still
not listed on this page as well) --[Yellows8](User:Yellows8 "wikilink")
17:52, 28 March 2013 (CET)

For those who want to get many newest versions (value, of the titles)
quickly, you can use this script *with nodejs executable*
[1](https://skydrive.live.com/redir?resid=A6D0BCEF437037D4!277&authkey=!ANGBM3GKlfEkzGA).
It will help you check the titles, however *it does not directly
generates the wiki table*. You can modify, distribute, use freely (not
Commercial yeh) *If you've downloaded a r0 version please fetch the
newest r2* --[Syphurith](User:Syphurith "wikilink") 05:29, 29 March 2013
(CET)

@[Yellows8](User:Yellows8 "wikilink"): well you said the package
0004001B00010702 is not used in NATIVE_FIRM. Well i do wonder if you can
decrypt the CDN packages now (i mean manually call the API).. (You said
there is CFA containing two files sized 96b and 64b -- the file on CDN
is 0x4200Bytes). If that is correct maybe we can find some clues from
the NATIVE_FIRM packages? Thx. --[Syphurith](User:Syphurith "wikilink")
07:20, 10 April 2013 (CEST)


That title is used by NS not NATIVE_FIRM. I'm not sure what that CFA is
used for but it's probably not really interesting - the data stored in
key.bin is not random either. "You said there is CFA containing two
files sized 96b and 64b -- the file on CDN is 0x4200Bytes" "key.bin" is
12-bytes, "value.bin" is 8-bytes, and the total RomFS size is
0x4000-bytes. --[Yellows8](User:Yellows8 "wikilink") 07:44, 10 April
2013 (CEST)


Thanks for reply. (So that is not a proper way.) Ok i think i should
wait for your progress then. (In fact i do wonder if you can decrypt
those packages.) --[Syphurith](User:Syphurith "wikilink") 09:35, 10
April 2013 (CEST)

## How to work out meaning of version?

I don't understand the instructions. --[Hiccup](User:Hiccup "wikilink")
12:45, 29 October 2015 (CET)


Also; how do you convert a title id into the four letter code used on
the front of cards etc and vice versa?
--[Hiccup](User:Hiccup "wikilink") ([talk](User_talk:Hiccup "wikilink"))
15:00, 6 January 2016 (CET)


I'm quite sorry I don't find direct relationship between TitleID and
Title ProductCode. Mainly the ProductCode of a title is the ProductCode
of its first NCCH content, which is likely to be a CXI. And i don't know
how to get that through memory or other ways, sorry.
--[Syphurith](User:Syphurith "wikilink")
([talk](User_talk:Syphurith "wikilink")) 11:36, 7 January 2016 (CET)

## Dlp Content

Just to note that after you unpack the Dlp Content using 3dstool, its
romfs contains a CIA, which have the similar TitleID. For example
00040000000F8100 is Mario Party Tour Island, and the Dlp CIA contained
is 00040001000F8100. However I can not unpack the content inside Dlp
CIA.. --[Syphurith](User:Syphurith "wikilink") 04:41, 13 November 2015
(CET)