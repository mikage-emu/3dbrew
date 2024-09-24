Thanks for clearing that up about the free space on the "TWL", what
confused me about the name was how the dev unit handled ds games. You
know how the 3ds's code name is CTR(we don't know what that stands for
yet) and the ds's code name is NTR which mean Nitro. When a 3DS game is
inserted, the dev menu says a "CTR CARD" is inserted, but when a DS game
is inserted it says a "TWL CARD" is inserted instead of what I expected
which would be "NTR CARD". I still do not understand this. - 3dsguy


DS=NTR, DSLite=USG (japanese for thin..), DSi=TWL(Twelve), DSiXL=UTL,
3DS=CTR... DS (on the 3DS) is usually associated with DSi..
--[Elisherer](User:Elisherer "wikilink") 02:32, 19 October 2011 (CEST)


3dsguy, that game you inserted was released \*long\* before DSi
right?(also, sign your comments with the signature button)
--[Yellows8](User:Yellows8 "wikilink") 04:02, 19 October 2011 (CEST)

Elisherer thanks for clearing that up
:).--[3dsguy](User:3dsguy "wikilink") 09:46, 19 October 2011 (CEST)


Yellows8, no that game was not, but just now i tryed it with a game
released in 2006 and it still said 'TWL CARD', but what Elisherer said
explained this.--[3dsguy](User:3dsguy "wikilink") 09:46, 19 October 2011
(CEST)

<!-- -->


DS = NTR/Nitro

DSi = TWL/Twilight

3DS = CTR/Horizon

Wii = RVL/Revolution

<!-- -->


Yellows8 - if you have DS/Nitro code running on a DSi system, can you
escalate to DSi/TWL mode or load a TWL/DSi binary or similar.
[Jl12](User:Jl12 "wikilink")


No, that's impossible. When DSi launcher/sysmenu switches to DS-mode,
launcher clears the MSB of a DSi register disabling access to the
registers controlling what hw is enabled and the clock rate etc. Once
those regs are disabled, it's impossible to re-enable them again without
resetting the system via I2C etc.(Also, by the time any exploited title
is running homebrew code, those regs are already disabled too.)
--[Yellows8](User:Yellows8 "wikilink") 19:53, 7 November 2011 (CET)

Is the NAND encrypted as it is on 3DS? Also, does DSi use DLP \[for TWL
games\] at all? [Jl12](User:Jl12 "wikilink")


Yes, DSi NAND is encrypted with AES-CTR. DSiWare uses download-play but
the WMB/dlp binaries are DS-mode
only.--[Yellows8](User:Yellows8 "wikilink") 06:27, 14 November 2011
(CET)

@Yellows8 - I'm sorry for asking this so late, but what does NUS stand
for in this context "redistributing copyrighted content, in this case
NUS content, is \*not\* allowed here.". I do not understand why you
deleted my page: [Update Data](Update_Data "wikilink")


NUS = Nintendo Update Servers. Those archive(s) you linked to contained
files you downloaded from NUS, all of which are copyrighted. Besides,
mirroring NUS content without any decryption done at all is
\*completely\* pointless. --[Yellows8](User:Yellows8 "wikilink") 16:41,
12 December 2011 (CET)


So would it be better to provide update logs, so it can point people to
which update data is from which version as on the NUS the individual
update data for each title is not stored the same way for all titles,
providing people with further reference, so they know what they are
using. You may ask me what would they use them for, they are still not
decrypted and therefore pointless. ATM knowing which version is which on
the NUS \*maybe\* very important, but I can't tell you more until
later.--[3dsguy](User:3dsguy "wikilink") 01:19, 13 December 2011 (CET)


Yeah a list of titleIDs and versions would be fine. One could grab that
info from [Title_list](Title_list "wikilink") diffs, but that's not the
best way to handle this. I have lists of updated titles for each 3DS
system update, but of course I never bothered to document which version
was from what sysupdate beyond just adding them to the title list
page.(obtained from their system update SOAP)
--[Yellows8](User:Yellows8 "wikilink") 02:20, 13 December 2011 (CET)

@Yellows8 - Thanks for your progress everyday, really. i have
questions.. If feeling uneasy please tell me politely (and i will remove
these).

- Would you need a tool that can use specified patterns to mark the
  decrypted binary (certainly it can not be perfect) ? Or have you find
  a disassembler so powerful that you don't need that a tool any more?
  please tell me. if that is useful, let me and my friend make that.


The tool would have such ability in resolving the configuration file.
Comment, Include, CmdID (with no params), CmdID (with specified params),
CmdID (with no specified params). such as 80001000:0103:4,0102:4,Any:4.
(ie this can mark 800010000102 out as a second type).

- Just curious. It has been a long time since neimod's latest update.
  Have you got a board from him, or you are only using the exploit (not
  with the board). If the board is helpful, is there any access to
  get/purchase one? (if no i think i should learn how to diy one then)

it seems to be a long time for you to do all the documentations by
yourself. (Orz i forgot my suggestion)
--[Syphurith](User:Syphurith "wikilink") 02:35, 15 April 2013 (CEST)


I don't have any 3DS ramhaxx, I use software savegame haxx of course.
"is there any access to get/purchase one? (if no i think i should learn
how to diy one then)" You should be asking neimod about that instead,
but
[the](https://secure.flickr.com/photos/neimod/6238747088/in/photostream)
[soldering](https://secure.flickr.com/photos/neimod/6212627980/in/photostream)
for 3DS ramhaxx would be \*really\* difficult. I'm not sure what you
mean regarding that tool either, are you referring to a tool which would
locate the code for service commands in a binary?
--[Yellows8](User:Yellows8 "wikilink") 03:10, 15 April 2013 (CEST)


Thanks for reply. I will try to contact him for boards. About the tool
--sniff--.

- Cons: can not detect structures; may make mistake; need configuration
  file (can be made by writing the header code)
- Pros: can visually color the matched patterns; can load unlimited size
  of file (result will be divided into segments of 1MB or other)

It would not be too difficult to make. However may take one or two
weeks. --[Syphurith](User:Syphurith "wikilink") 03:49, 15 April 2013
(CEST)


I have no need for a tool which searches for service commandIDs, when I
can just search for commandIDs etc in my text-editor for disassembled
code. --[Yellows8](User:Yellows8 "wikilink") 04:04, 15 April 2013 (CEST)


Well thanks for reply. I removed the details above. I will left it
undone. Have a good day.--[Syphurith](User:Syphurith "wikilink") 04:21,
15 April 2013 (CEST)

I've seen there are users without contributions flew in. There are even
some guys cheating (or just making jokes) with your names.. What's your
opinion about that? PS3Brew is blocking those without edits (daily).
--[Syphurith](User:Syphurith "wikilink") 17:03, 17 April 2013 (CEST)


I don't care much about either,(neither of those fake accounts were used
to edit anything at least) I'm not an admin here though.
--[Yellows8](User:Yellows8 "wikilink") 17:36, 17 April 2013 (CEST)

Hello Yellows8, I have a question regarding the release of the hack. You
guys said, that you won't release it, because it is very easy to patch.
Now the new firmware was released and in fact the exploit was patched.
So releasing it now wouldn't change anything, because Nintendo already
patched it.

But if you release it now, people could start develloping homebrew and
when you guys find a new exploit for the new firmware, we would already
have a good base of homebrew applications.

So why still hiding it from the world?

Best regards and thank you for your work

elBirx


"the exploit was patched" Only the code execution haxx was
[fixed](5.0.0-11 "wikilink"), the savegame haxx was not fixed. "But if
you release it now, people could start develloping homebrew" No,
currently it's **only** useful for reverse engineers. Almost everyone
that wants that savegame haxx would have no use for it right now, since
"it's **only** useful for reverse engineers".
--[Yellows8](User:Yellows8 "wikilink") 18:46, 21 April 2013 (CEST)


So i do think only one that want to do Reverse engineering and do have
skills in ARM disassembly can ask you for such a thing. Yellows8, what
would i need to learn if i want to analyse those (taken ARM references
in consideration)? --[Syphurith](User:Syphurith "wikilink") 03:07, 22
April 2013 (CEST)


What are you referring to by "those"?
--[Yellows8](User:Yellows8 "wikilink") 04:26, 22 April 2013 (CEST)


I'm so sorry for my poor expression skill. If i want to analyse the ram
or anything that you used as a material.. Exefs is ARM code so i think
to check those (you can get using exploit/haxx) need arm knowledges. i
mean, that is those service APIs. you did say you can check disassembled
code. Even i don't know what is left to be done.
--[Syphurith](User:Syphurith "wikilink") 07:31, 22 April 2013 (CEST)


"what would i need to learn..." You could learn to read/write ARM
assembly, and learn reverse engineering.
--[Yellows8](User:Yellows8 "wikilink") 07:38, 22 April 2013 (CEST)


Thanks. Confirmed~ That's clear to me now.
--[Syphurith](User:Syphurith "wikilink") 11:53, 22 April 2013 (CEST)

Eh. Yellows8, i got some n00b questions about the ARM execution.

There is non-executable sections in the memory layout, but where did
these "This can be executed" flags got initialized (I mean that is made
of hardware circuits or bios or other software section)? If that is not
changable, would all those ARM cores use the same non-execution flags
settings(possibly no so we may change the core to keep that work?). Even
more, can we sniffer the data app to core and change its execution
length then inject.

Also, is there any method to let the core execute those commands (that
you detected) and use that to produce something you interested in?


The ARM11 kernel
[initializes](Memory_layout#ARM11_User-land_memory_regions "wikilink")
the MMU tables. "Also, is there any method to let the core execute those
commands (that you detected) and use that to produce something you
interested in?" By running code on a 3DS of course.
--[Yellows8](User:Yellows8 "wikilink") 17:27, 17 June 2013 (CEST)


Thanks. But still feeling strange of that strategy. I think at least the
Home Menu may be able to re-map or deactive this mark.

-snip- Sorry for being noob (i would try learning arm soon). Hope you
good work.--[Syphurith](User:Syphurith "wikilink") 02:46, 19 June 2013
(CEST)

Home Menu starts application processes via [NS](NS "wikilink"),
terminating and "suspending" process execution(the process is still
running with that, the application threads wait for a
[NS](NS "wikilink") notification for resuming actual execution) is done
via NS as well. The ARM11 kernel handles mapping the processes' virtual
memory for .text, .rodata, and .data. The ARM11 kernel handles
terminating processes as well of course. The only process which has
access to [svcControlProcessMemory](SVC "wikilink") for mapping memory
or changing memory permissions, is [RO](RO_Services "wikilink") module,
and of course that module will only map R-X .text pages for the signed
[CRO](CRO0 "wikilink") .text. --[Yellows8](User:Yellows8 "wikilink")
03:16, 19 June 2013 (CEST)


I can still remember ns/ro is also a title in title list. (if manually
start that may fails/cause failure) if you launch a title with those
commands manually, would it be exposed (in ram?)(, if so we may dump the
firmware/modules)? MPS let multiple processes can share the same
resources (with home menu?). or have we to modify the real memory
externally? There are just thoughts, if interesting please think for a
while; if not just tell me
"NONE".--[Syphurith](User:Syphurith "wikilink") 05:17, 19 June 2013
(CEST)

I saw you update the AES page recently. you can confirm some keyslots
are with the same data, but how had you done that (by comparing the
data, or just the same memory location)? Can you even fetch those keys
to decrypt the CDN TMD key strings? if so that would be a potential way
to go.. BTW you're disasm those in-memory content not the decrypted
Romfs right?

I do wonder if contents decrypted succussfully, shall we need any
customed disassembler? --[Syphurith](User:Syphurith "wikilink") 16:51,
26 June 2013 (CEST)


"some keyslots are with the same data" I encrypted an all-zero block
with each AES engine keyslot with CTR=0, and encrypted that data again
with each keyslot with keyY=0. When the output block for the former is
the same for multiple keyslots, those keyslots use the same keyX/keyY.
When the latter output block is the same for multiple keyslots, those
keyslots use the same keyX. "decrypt the CDN TMD key strings" TMDs have
nothing to do with decrypting the ticket titlekey.
[RomFS](RomFS "wikilink") does not contain code(besides
[CRO0](CRO0 "wikilink") for web browser), that's stored in
[ExeFS](ExeFS "wikilink"):/.code. There's no need to dump code from
memory when one can just use the [AES](AES "wikilink") engine.
--[Yellows8](User:Yellows8 "wikilink") 17:40, 26 June 2013 (CEST)


oh well. sorry for been n00b again. then have you ever found something
that you can execute to decrypt those CDN data? i badly wanna try it..
ExeFS.. okey.. hope good work--[Syphurith](User:Syphurith "wikilink")
08:04, 27 June 2013 (CEST)

-snip- --[Syphurith](User:Syphurith "wikilink") 08:36, 27 June 2013
(CEST)


You do not "call" crypto functions here, this is a hardware
[AES](AES "wikilink") engine with a hardware key-scrambler. "found
something that you can execute to decrypt those CDN data" Not sure what
you mean when we had system-version v4.5 total-control code exec haxx
since December. --[Yellows8](User:Yellows8 "wikilink") 09:52, 27 June
2013 (CEST)


I forgot that hours ago. sorry. I thought we would be able to feed those
raw data we got from CDN, and let it decrypt and extract for us. then at
least we may be able to find those differences in modules implemented
between two nearby versions. Some just fix crash - stablility, and some
would fix some vulnerables we may use, and some would indicates those
internal logical process of the module's implementation. we can not
always rely on those ROP or other black-box methods. when we get the
opportunity to build a CFW or a special homebrew that would affect the
original behaviours of the system, we may need to modify it right? also
that should show us some interesting points if we have ones dedicated on
analysing those. --[Syphurith](User:Syphurith "wikilink") 14:51, 27 June
2013 (CEST)


Total-control code exec haxx = access to the [AES](AES "wikilink")
engine obviously. "build a 'CFW'" That's not possible because of
[RSA](NCCH "wikilink"), the only way around that would be to exploit
software while the system is booting or exploit Home Menu. And patching
the NCCH signature checks(from like savegame haxx with a game) is rather
pointless, because you would have to re-patch \*every\* time you boot
your 3DS(there's no need to run a regular homebrew application via NCCH
this way either tbh). --[Yellows8](User:Yellows8 "wikilink") 16:06, 27
June 2013 (CEST)

Thx. That's exactly how cfw works. (sorry i only have psp and 3ds)
procfw on psp, have ipl flashed (psp has one special section inside its
battery) can auto-patch the cfw code into the system while booting. But
have no news for how those men repair customer's device i definitely
have no clubs about the existence of similiar mechism. Besides, patching
is not that easy, well. i know you have full access to AES engine, and i
just want to know have you ever tried or thought of using contents from
CDN and decrypt them and disassemble to seek something interesting.
--[Syphurith](User:Syphurith "wikilink") 05:31, 28 June 2013 (CEST)


Using the AES engine is basically the only way to obtain cleartext NCCH
for updated titles, without finalizing the install for titles. That's
obviously where stuff like the new [savegame](6.0.0-11 "wikilink") keyY
info came from. --[Yellows8](User:Yellows8 "wikilink") 07:16, 28 June
2013 (CEST)

Okey, good. you can take use of that (however still not related to
exefs..) have a good day.

There is ClCertA on CDN. Important keys are stored in hardware
key-scrambler right? A.ClCertA's private key stored in hardware and
there is api called with write access in the package. B.ClCertA's key
stored in NAND or somewhere else so we can eventually grab that and
setup a proxy to remote while replacing the original ninty ones to our
own self-sign ones (Then we would be able to decode the data transfers
between proxy to 3ds and proxy to remote). C.ClCertA.. The workers think
their private key can never be leaked so no CRL and just stored in
hardware with a package cheating their boss. Which one you think would
be the best answer? BTW i do really think there is ones with R/W access
to the hardware.. Hope you find new
apis.--[Syphurith](User:Syphurith "wikilink") 02:35, 4 July 2013 (CEST)


ClCertA contains the SSL client RSA cert/private-key, when one has that
one can only access their servers(like with a PC) with that, \*nothing\*
more. I'm not sure why they store that data in a CFA seperate from SSL
module, those two files stored in the ClCertA RomFS use additional
encryption to begin with. "BTW i do really think there is ones with R/W
access to the hardware" I'm not sure what you mean by that.
--[Yellows8](User:Yellows8 "wikilink") 03:24, 4 July 2013 (CEST)


-snip-


I don't think you understand what "SSL client certificate
authentication" is, you should google it etc. A fake server would
require the SSL server private-key from the real server, which you can't
obtain of course. The AES engine has \*nothing\* to do with this besides
being used to decrypt those two files in that CFA RomFS. This CFA is a
system title so it's obviously stored in NAND, but of course you can't
change any NCCH data due to RSA signing of course(modifying ClCertA is
pointless anyway). There's not much point changing the SSL client
cert/private-key, each 3DS prior to that update would be using the old
ClCertA, and system updates require that SSL client auth for
SOAP(besides SOAP that stuff isn't really interesting tbh). SSL module
is the only process which uses ClCertA. "... write/read which section of
memory" I have no use for that. --[Yellows8](User:Yellows8 "wikilink")
17:30, 4 July 2013 (CEST)


oh well thanks. So only SSL module then. Without the ability to modify
the original data, even a tunnel proxy would not work properly..(what
annoying the rsa signature is - maybe as me to you. i means, 3ds with
replaced, child cert and key of a self-signed, connects to a proxy with
self-signed cert and key; the proxy takes the original cert and key that
of 3ds client, to connects to ninty CDN. the two connections are all
connecting with proper key and cert, that client signed by server; but
3ds's original cert and key must be replaced by one signed by our
proxy's server cert and key, as what ninty does with 3ds. cause
inability to change the content, it is nothing now.)(maybe better quick
head to learning disasm and someday to have a try) BTW haven't seen Jl12
for long, seeing someone impeach him for just taking \$ away lol. (even
i don't think about that before. oh no this is your page and i should
not be short to you) --[Syphurith](User:Syphurith "wikilink") 02:16, 5
July 2013 (CEST)

So please let me say that. "Sorry". also hope you find something today.

### Spam attack

I guess the simple captcha isn't enough, do you have an idea what to do?
(i'm asking you because you are the most active admin here).
I think we should adopt a method of registration and waiting for an
admin to approve it. the recent changes page is spammed hard and a lot
of google pages, I guess, are being created linking to those pages.
--[Elisherer](User:Elisherer "wikilink") 09:40, 31 May 2013 (CEST)


Mha is the only one that can do anything about anti-spam, I can't do
much about it myself. Mha said that he would work on this tomorrow.
--[Yellows8](User:Yellows8 "wikilink") 22:19, 31 May 2013 (CEST)


A. Stop registeration for several weeks (NOT GOOD).

B. Ajax to load captcha (maybe reCAPTCHA?). Not well-made bots will have
trouble loading the javascript code or lose the speed (there is ones
with javascript but can not act so quickly)(MAYBE USEFUL). This method
is widely used *it may be not so useful* (against latest tools).

C. Use auto filter to auto check those suspicious content and block
those users, given an access for those by accident closed guys to talk
about their opinion. (I do wonder if the wiki admin backdoor provide you
such a tool)(Hey Regex~)

D.find their IP and block the IP section for a while.(Similiar as A)

E. Use man-made Email to validate (I means, instead of the system
writing mail to user to validate, let user write mails to admin or other
trusted -- use SPAM filter)(NOT WELL PRATICAL, Haven't tested, SO..)

F. Calls for someone can trust and give him only those block and delete
power (DIFFICULT). Well just a little tries..

G. Try to update your wiki version first, i mean the version of this
website framework. (MAYBE USEFUL? DOUBT..)

If you tried the actions of blocking and the spam still flow in you need
to update or call wiki program's supporters (may be exploit..) But i do
wonder why they tried to attack here, a (script) guy (with latest
tool)?(if so he should try to improve his skill first).

Oh well, Recent changes. Guys have a good day (International Children's
Day).--[Syphurith](User:Syphurith "wikilink") 09:39, 1 June 2013 (CEST)

We are able to mark those pages as spam but however no effects in deed
if no one comes to remove those spam accounts.
Well.--[Syphurith](User:Syphurith "wikilink") 10:17, 17 June 2013 (CEST)

### Fundraiser

Hello Yellows8, I know you're not the one that is responsible for the
chip decapping fundraiser, but I didn't manage to contact Jl12 via
E-Mail (He's not responding). So, have you guys noticed that the
donations hit the 2000\$ last week? Will the decapping start anytime
soon or do you need some more money for buying the 3DS itself? Best
regards


Jl12 has had a broken 3DS for decapping before the fundraiser even
started. And of course we noticed that, however since Jl12 is usually
very busy it might be a while before he sends his 3DS for decapping.
--[Yellows8](User:Yellows8 "wikilink") 00:26, 5 June 2013 (CEST)

Hi again, anything regarding the chip decapping happened in the past
week? Will the images be released to the public? Best regards


We still haven't heard anything from Jl12.
--[Yellows8](User:Yellows8 "wikilink") 19:34, 15 June 2013 (CEST)

So Still no news from Jl12? Seems not seeing him for
long.--[Syphurith](User:Syphurith "wikilink") 02:35, 4 July 2013 (CEST)

Hi Yellows8, sorry to bother you again, but I would like to know, if you
heard something from Jl12 since July. As far as I know
[mercluke](http://gbatemp.net/members/mercluke.109574/) donated the
remaining 300\$ months ago. Has this money never arrived or is this
whole thing nothing but a scam after all and Jl12 ran off with the
money? This would be really disappointing for all donaters and a very
sad end for a very promising project.


"if you heard something from Jl12 since July" Nope, he's very busy. When
we do hear anything from him he would presumably update the donate page
anyway, so no need to ask here. --[Yellows8](User:Yellows8 "wikilink")
17:14, 5 November 2013 (CET)

<http://n-dev.net/donate.php> is gone.

## I have tried to send you an email

I don't know if it will go through though. It is about help with dumping
a 3DS kiosk demo, which is an earlier build than the final game.
--[Hiccup](User:Hiccup "wikilink") 16:15, 31 May 2015 (CEST)

## Contact

Look, I'm sorry to bother you, but I was wondering, how would I get in
contact with you? --[MassExplosion213](User:MassExplosion213 "wikilink")
06:20, 9 September 2015 (CEST)


EFNet IRC is preferred. --[Yellows8](User:Yellows8 "wikilink") 06:24, 9
September 2015 (CEST)

## The [Games](Games "wikilink") page

Could you explain its purpose. Also, I think it needs to be remade,
because it seems to be based around the idea that there should only be
one row per game, but it doesn't take into account the existence of
revisions and region-free games. --[Hiccup](User:Hiccup "wikilink")
([talk](User_talk:Hiccup "wikilink")) 21:57, 4 January 2016 (CET)


Not sure why a homebrew wiki really needs an official-games-list tbh,
there's more complete list(s) elsewhere anyway.
--[Yellows8](User:Yellows8 "wikilink")
([talk](User_talk:Yellows8 "wikilink")) 23:07, 4 January 2016 (CET)


Do you think
[Title_list/eShop_Titles](Title_list/eShop_Titles "wikilink") is needed?
If you do, I will continue to add titles to it.
--[Hiccup](User:Hiccup "wikilink") ([talk](User_talk:Hiccup "wikilink"))
14:59, 6 January 2016 (CET)


Likewise for that page, there's much more complete list(s) elsewhere.
--[Yellows8](User:Yellows8 "wikilink")
([talk](User_talk:Yellows8 "wikilink")) 15:44, 6 January 2016 (CET)


Could you link me to these lists? The only thing I can think of is
No-intro, but that probably doesn't cover some system titles and it
doesn't list the "v" versions. --[Hiccup](User:Hiccup "wikilink")
([talk](User_talk:Hiccup "wikilink")) 15:49, 6 January 2016 (CET)

## Nintendo Channel demos

Is it still possible to use [these
tools](https://code.google.com/archive/p/wmb-asm/wikis/NintendoChannel.wiki)
to download Nintendo Channel demos? Or are the servers offline? Did you
(or anyone else) ever download any ROMs? It'd be a shame if they were
lost. --[Hiccup](User:Hiccup "wikilink")
([talk](User_talk:Hiccup "wikilink")) 15:02, 17 February 2017 (CET)


Don't think so, likewise @ downloading *all* of those demos.
--[Yellows8](User:Yellows8 "wikilink")
([talk](User_talk:Yellows8 "wikilink")) 16:11, 17 February 2017 (CET)


Do you still have any download(s) you made to test it?
--[Hiccup](User:Hiccup "wikilink") ([talk](User_talk:Hiccup "wikilink"))
14:46, 18 February 2017 (CET)

Many of these were archived and are included in the No-Intro "Nintendo -
Nintendo DS (Download Play)" DAT. [Vague
Rant](User:Vague_Rant "wikilink")
([talk](User_talk:Vague_Rant "wikilink")) 15:04, 18 February 2017 (CET)