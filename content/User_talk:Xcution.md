**EDIT: As promised, <http://n-dev.net/showthread.php?tid=15> is where
you'll find my update.**

Hi.

Today I bring news of 2 developer applications which I did not see in
"3DS Development Unit Software" :

CecLotCheckTool and WM Test

<figure>
<img src="Ceclotchecktool.jpg" title="Ceclotchecktool.jpg"
width="500" />
<figcaption>Ceclotchecktool.jpg</figcaption>
</figure>

<figure>
<img src="Devmen2app.jpg" title="Devmen2app.jpg" width="500" />
<figcaption>Devmen2app.jpg</figcaption>
</figure>

CecLotCheckTool and WM Test tools do not appear to have an icon.

**Info CecLotCheckTool :**

First, you may wonder what "CEC" stands for. It means Chance Encounter
Communication, AKA StreetPass. It is noted by lib that StreetPass is not
possible between a dev unit and a retail system. CECLotCheckTool is used
to check StreetPass info. Unfortunately, I only have 1 dev unit =p so I
can't really do a whole lot with this, since it's only developer unit
-\> developer unit. I still think it's interesting though..

**Info WM Test :**

Unfortunately I do not have pictures of WM Test as it seems to freeze on
my somewhat outdated rev although lib/sdk states it is a TWL program BUT
lib states WM Test has 2 unique features :

It runs through DevMen in "TWL Compatibility" mode AND runs in "Noise
mode"

And another unfortunate point to bring is I could not find so far
information about these 2 modes, which is sort of a let down =/ but
interesting that it notes those two things.

Are you Collosalpokemon from GBA Temp, because they look like his(or
her) photos--[3dsguy](User:3dsguy "wikilink") 02:54, 27 November 2011
(CET)

Also if you want to test streetpass between dev 3DSs, your best chance
of doing this is at a nintendo public event where they are likly to have
3DS demos running on Dev 3DSs.--[3dsguy](User:3dsguy "wikilink") 02:59,
27 November 2011 (CET)

Yes, that's why my pictures are the same. I thought I'd show some stuff
that 3DBrew doesn't documented yet. Also I would avoid bringing this to
a public event as this is my only copy of the developer 3ds, and if I
was caught by a nintendo employee that wouldn't be great :p I came
across an interesting format while digging through the lib, it wasn't
even mentioned in nintendo's documentation lol so I'm still learning
what it does exactly. I'll add my findings to the file format list here,
just know it wasn't much yet--[Xcution](User:Xcution "wikilink") 03:50
27 November 2011

Well thanks for the info on CECLotcheckTool, you gave me enough to get
me started on working out on what it does, you should see my findings on
my 3DS Development Unit Software page soon. Also WM Test is a wireless
test app, more info should also appear on my page
soon.--[3dsguy](User:3dsguy "wikilink")

Ah, right. WM Test was for wireless according to lib. Also I updated the
format list with 3 formats noted in the compiler, but hidden from
documentation. I also found 1 more format which I did not list yet,
called OLS. It seems to be something similar to a CIA but I remember
seeing it somewhere documented in the lib so I'm checking it out. Also,
I've figured out the format of RSF so maybe I'll add that to 3DBrew
documentations soon.--[Xcution](User:Xcution "wikilink")

[Xcution](User:Xcution "wikilink"), can you upload any files with an
undocumented format (mentioned in [File
Formats](File_Formats "wikilink")) that we can document them
successfuly? Maybe we are also able to find out their
purpose.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 11:29, 27
November 2011 (CET)

[Lazymarek9614](User:Lazymarek9614 "wikilink") unfortunately not all of
them. The best I could get you guys would be CFA, NSA, RSF, AXF, BCWAV,
and DESC files but not the few I've found in the lib. btw RSF and DESC
are both in plain text. I could also make you guys some custom CXI's to
see but I'm not sure how useful they would be to anyone. Lib references
Common Header Keys also. I have successfully generated my own CXI file
(Hello World), can I upload it here? It had to be made with a nintendo
linker but I made the file so does it count as "copyrighted" by
nintendo? they didn't approve of this work so I don't think so but I'd
rather be safe than sorry.--[Xcution](User:Xcution "wikilink")

I'm not sure about the copyright... Can you upload the other formats
first (if you are allowed to) and wait until you're sure about the
copyright stuff. Are the common header keys for 3ds test units only or
for the public normal 3ds? I think not all formats are useful for us,
but the CXI is.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 12:06,
27 November 2011 (CET)

Ah. I'll see about those. The Common Header Keys are likely for both
retail and dev 3ds because lib allows building for both retail and dev
files using the same keys, however I don't know if they are dummy keys
like the RSA are. I'll try to get the format BCWAV (3DS Audio Wave
files) soon.--[Xcution](User:Xcution "wikilink")

OK, so please look for the keys you can get & publish legal and upload
some files.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 16:18, 27
November 2011 (CET)


I wouldn't recommend uploading anything to 3dbrew because it \*might\*
be illegal. I recommend using the PM in gbatemp to ask. There are only
few people here that would benefit from looking at these files (and by
saying 'these' i don't mean any specific files).
--[Elisherer](User:Elisherer "wikilink") 17:03, 27 November 2011 (CET)


Yes, it has to be legal! [Xcution](User:Xcution "wikilink"), maybe if
you want to send me 'these' files, click on my username to see the
e-mail contact and don't upload anything illegal on
3dbrew.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 18:57, 27
November 2011 (CET)

Can you send me also, please? --[Jocopoco](User:Jocopoco "wikilink")
19:33, 27 November 2011 (CET)



Just because Nintendo SDKs can build software for retail doesn't mean
they include the retail AES key(s). When devs send binaries for RSA
signing Nintendo takes care of encrypting the binaries with the retail
keys as well.(AFAIK they have \*never\* included retail keys in their
SDKs) --[Yellows8](User:Yellows8 "wikilink") 03:31, 28 November 2011
(CET)


^ This is true but DSi/Twl development builds actually do run on retail
systems. ;P --[Jl12](User:Jl12 "wikilink")

Also, I think you mean "release" builds. Development builds have
debugging functions enabled and aren't optimized. The SDK can build
retail (release) builds that include optimization and are stripped of
debugging information and some internal debug flags. This is to get
ready for retail ROM mastering. It doesn't mean it uses retail
encryption or signing methods. (It doesn't.)
--[Jl12](User:Jl12 "wikilink")


"DSi/Twl development builds actually do run on retail systems" After
those builds are sent to Nintendo for retail RSA signing and modcrypt
encryption, sure. --[Yellows8](User:Yellows8 "wikilink") 04:41, 30
November 2011 (CET)


^ No, I mean that just like it sounds. Development builds can be ran on
retail units prior to being mastered by Nintendo. I've tried this.
--[Jl12](User:Jl12 "wikilink")


Er, how did you run these dev builds on retail DSi?
--[Yellows8](User:Yellows8 "wikilink") 04:58, 30 November 2011 (CET)

I wouldn't think they contained retail keys, Yellow8, just it contained
some keys (probably dummy keys) called Common Header Keys and they
seemed interesting for a moment imho I didn't see your post there lol
I'm still considering whether or not they're legal. In a way, they are
legal because I'm not technically hired by Nintendo so the CXIs, CIAs,
etc I make are not copyrighted by them like retail or licensed
developers, but in another way it's not legal because I am using part of
the lib to make the files. Gah!--[Xcution](User:Xcution "wikilink")


It's not necessary to document \*all\* the formats their toolchain uses
that are \*never\* used on retail at all IMO.(like those temporary files
used during CXI building) --[Yellows8](User:Yellows8 "wikilink") 03:31,
28 November 2011 (CET)

Ok, after some thought and looking around here I shouldn't have a
problem posting non-commercial (and not copyrighted for developers, ie
DevMen or Config) CIAs because user Jl12 has done this without having a
problem with copyrights. CFA is essentially a bundle of CIAs so I
shouldn't have a copyright issue there as long as the CIAs inside are
not commercial and not developer copyrighted (ie I can't post commercial
or DevMen/Config/etc), however according to Jl12's upload of his custom
CIA it is OK to upload custom CIAs, and in essence CFAs. I'm looking
into the legality of other formats,
though.--[Xcution](User:Xcution "wikilink")

- Please only post what you've written/compiled yourself, no files from
  the SDK(s) or that has been mastered by N. ( such as roms, etc. ).
  --[Jl12](User:Jl12 "wikilink")

Today I'll start documenting a little bit of what I find. Currently I'm
still learning so this'll probably be amended a lot.

**CSU : (CTR System Updater)**

NCSD block starts @ offset 0x00000100

NCCH block starts @ offset 0x00001100

CSU Program ID / Title ID @ offset 0x00001150

NCCH block starts @ offset 0x00004100

CSU Program ID / Title ID @ offset 0x00004150

CSU have Program IDs similar to CIA...(either a name or CTR-X-XXXX)


Seems just like [CCI](CCI "wikilink"), maybe CCI isn't really a format,
rather then a use for that "multiple CIAs" format.
--[Elisherer](User:Elisherer "wikilink") 22:17, 27 November 2011 (CET)

Hi Elisherer, is not exact format as [CCI](CCI "wikilink") actually.
Just I show the most plain objects. CSU does **not** have SDK
informations shown (example : \[SDK+NINTENDO:CTR_SDK-0_14_23_200_none\])
like CCI has, or CSU has not this in plain text like CCI has..
--[Xcution](User:Xcution "wikilink")

- Note, you can't decrypt .CSU with the same development keys a CCI/CIA
  can be decrypted with, not sure if that's because it has a different
  set of keys or because of a difference of format though. I admit I
  haven't dug deeply. CCI/CSU do appear very similar and both need to be
  burned to a blank cartridge to be ran. --[Jl12](User:Jl12 "wikilink")

**CTR Fun Facts :**

Before release, CTR was in development back in 2009 under the codename
"Horizon". Unfortunately lib doesn't give what "CTR" stands for
=p--[Xcution](User:Xcution "wikilink")

- Sup Xcution. this is gshock, though you probably could guess that from
  the userid. \o/
- Maybe you guys can consider taking this conversation to n-dev.net lol
  --[Jl12](User:Jl12 "wikilink")