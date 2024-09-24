## Old CIA Formats

### 24/06/2010 - CTR_SDK: 0_10

**CIA Header**

| START | SIZE   | DESCRIPTION                                      |
|-------|--------|--------------------------------------------------|
| 0x00  | 0x04   | Archive Header Size (Usually = 0x2020 bytes)     |
| 0x04  | 0x02   | Type                                             |
| 0x06  | 0x02   | Version                                          |
| 0x08  | 0x04   | Unused                                           |
| 0x0C  | 0x04   | Unused                                           |
| 0x10  | 0x04   | Zero Filled Data (usually 0x200 bytes in length) |
| 0x14  | 0x04   | Zero Filled Data (usually 0x200 bytes in length) |
| 0x18  | 0x08   | APP file size                                    |
| 0x20  | 0x2000 | Content Index                                    |

The order of the sections in the CIA file:

- Header
- Zero Data\*2
- APP file data

The APP data is cleartext. Only one executable supported.

### 06/07/2010 - CTR_SDK: 0_10_2

**CIA Header**

| START | SIZE   | DESCRIPTION                                  |
|-------|--------|----------------------------------------------|
| 0x00  | 0x04   | Archive Header Size (Usually = 0x2020 bytes) |
| 0x04  | 0x02   | Type                                         |
| 0x06  | 0x02   | Version                                      |
| 0x08  | 0x04   | Unused                                       |
| 0x0C  | 0x04   | [Ticket](CommonETicket "wikilink") size      |
| 0x10  | 0x04   | [TMD](TMD "wikilink") file size              |
| 0x14  | 0x04   | Unused                                       |
| 0x18  | 0x08   | APP file size                                |
| 0x20  | 0x2000 | Content Index                                |

The order of the sections in the CIA file:

- Header
- Ticket
- TMD
- APP file data

Very similar to the final CIA version(encryption, TMD, etc), except
there is no embedded Certificate Chain.

## Discussion

Good work Lazymarek9614, Now 3dsexplorer on the svn is 0.73 (you can
download it from the beta link) supports cia.
--[Elisherer](User:Elisherer "wikilink") 21:34, 10 November 2011 (CET)


@Elisherer where is that beta link?--[3dsguy](User:3dsguy "wikilink")
02:39, 11 November 2011 (CET)


[3DSExplorer](3DSExplorer "wikilink"), bottom of the bage.
--[Elisherer](User:Elisherer "wikilink") 08:09, 11 November 2011 (CET)

"Each section is cleartext for dev CIAs, for retail CIAs the APP data is
encrypted."


Dev/Production CIA use the same specification. So I'm not sure what you
mean by this.

The "ctrtool" on the CXI page already parses the CIA format, why
re-invent the wheel?

"CIA files can be created with the Nintendo 3DS SDK and installed on the
3DS test units by the Dev Menu."


Please keep the focus on documentation of the spec., we don't want to
explain things from the perspective of SDK users- but for someone that
knows (potentially) nothing about the 3DS. The SDK does not tell the
whole story of most file formats, and most people don't need to know
what the SDK can do for them but what they can do without the SDK. -
[Jl12](User:Jl12 "wikilink")



"Dev/Production CIA use the same specification. So I'm not sure what you
mean by this. " I originally worded it that way on the page because both
CIAs [3dsguy](User:3dsguy "wikilink") uploaded had cleartext APP data,
thus I wasn't sure if CTR-SDK had an option for encrypting the dev CIAs.
I don't get why [Elisherer](User:Elisherer "wikilink") re-implements
about everything ctrtool already does either...
--[Yellows8](User:Yellows8 "wikilink") 05:26, 12 November 2011 (CET)

\- Depending on which one it was, the link that was removed initially
was a old presentation from e3. It's just out dated enough that the cia
format probably hadn't been finalized. Anything before firmwares
0.10.0 - 0.11.0 neither use LZ compression nor encrypt (!) but - except
the use of keys, the SDK now produces .cia with close to retail specs.
[Jl12](User:Jl12 "wikilink")


If you like working with the windows command line be my guest. I got
more progress looking at the files with 3dsexplorer... (And i'm not
re-inventing 3dsexplorer didn't support cia so I added it, I will
continue fixing the structure to be as accurate it can be)
--[Elisherer](User:Elisherer "wikilink") 09:48, 12 November 2011 (CET)


\- I was thinking more the wiki and the "documentation" of the
structures then 3dsexplorer tool. (I thought this was based on binaries,
though) [Jl12](User:Jl12 "wikilink")

I personaly like a command line tool more, but it's really annoying to
have for each format another tool. Shall I create a new page for the
certs and tickets?--[Lazymarek9614](User:Lazymarek9614 "wikilink")
15:06, 13 November 2011 (CET)


The format of the certs/tickets seem to be the same as before,(besides
the new signature types already described on the TMD page) not really
necessary to create pages for those.(Any info on what cert is used to
sign what should be on a /sys/cert.sys page or so later IMO)
[Elisherer](User:Elisherer "wikilink"), you're re-inventing the wheel
aka re-implementing CXI/CIA code which ctrtool had for months, which is
a waste of time IMO. --[Yellows8](User:Yellows8 "wikilink") 19:24, 13
November 2011 (CET)


[Yellows8](User:Yellows8 "wikilink"), I didn't write any new code for
the CXI/CCI/TMD/CIA opening, I just copied it from the ctrtool (as I
mentioned when I just written the app). The rest (which is the SAVE
flash) became the prime goal of the app and with it I discovered a lot
of new information. I try implementing most of the file structures we
know so it would be more accessible to everyone (Hoping it would help
solving more mysteries). I know that now it's not clear why 3dsexplorer
opens these sort of file--[Elisherer](User:Elisherer "wikilink") 00:11,
3 February 2012 (CET)s but with time more information will come and it
will grow to extract more important information. I hope you understand.
--[Elisherer](User:Elisherer "wikilink") 20:27, 13 November 2011 (CET)

Sorry guys, this discussion doesn't really has anything to do with the
CIA format. Please choose another page for this or stop it now. @
[Yellows8](User:Yellows8 "wikilink"): I think it's not important to
create a new page for it too, only some links to the TMD format and
wiibrew wiki are
necessary.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 20:44, 13
November 2011 (CET)


Other than that TMD code, that CXI/CIA code looks nothing like the
ctrtool code to me - but whatever.
--[Yellows8](User:Yellows8 "wikilink") 22:07, 13 November 2011 (CET)

<!-- -->


Maybe you guys would like a forum... it would be less clumsy or
interefering to the wiki then plastering talk page with comments. Not to
mention we could use pictures and attach files directly. I don't mind
setting up something like that if it's actually going to be used.
[Jl12](User:Jl12 "wikilink")


I think a forum is not a bad idea, but I also don't mind using the Talk
page on the wiki aslong as it is relevant. Maybe
[Mha](User:Mha "wikilink") can take a look into setting up a forum on
the 3dbrew host? --[Neimod](User:Neimod "wikilink") 21:51, 18 November
2011 (CET)

- <http://n-dev.net>

[Jl12](User:Jl12 "wikilink")


I prefer having a forum running on the 3dbrew host and managed by the
3dbrew administrators. The forum link above is fine for now as a
temporary measure. --[Neimod](User:Neimod "wikilink") 04:48, 20 November
2011 (CET)

Is there any reason it has to be on the 3dbrew host? If it's an issue of
forum management I can just move your account(s) to the administrator
group. Nobody's forced to use it, of course.
[Jl12](User:Jl12 "wikilink")

I agree with Neimod.--Matyapiro31 11:56, 20 November 2011 (CET)

The link to [Jl12](User:Jl12 "wikilink")'s CIA example is broken
(probably since the FBI took down MegaUpload). Could someone re-upload
it somewhere else? Thanks! [CHR15x94](User:CHR15x94 "wikilink") 23:41, 2
February 2012 (CET)


Download it contents
[here](http://sherer.co.il/3ds/cia/Sample%20Cia/)--[Elisherer](User:Elisherer "wikilink")
00:11, 3 February 2012 (CET)

## Content Index?

What on earth is the "Content Index"? To me it sounds critical to
understanding the contents chunk.--[Henke37](User:Henke37 "wikilink")
([talk](User_talk:Henke37 "wikilink")) 17:39, 22 July 2016 (CEST)


It's a number that identifies an NCCH to be installed by that CIA,
equivalent to the [partition number](NCSD#Overview "wikilink") of a CCI:
indeed, 0=main, 1=manual, 2=remote app are used in exactly the same way.
The number of mazimum possible partitions is however much higher in
CIAs! --[Ryccardo](User:Ryccardo "wikilink")
([talk](User_talk:Ryccardo "wikilink")) 18:19, 22 July 2016 (CEST)