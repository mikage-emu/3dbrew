Thanks,3dsguy. How did you get it? Matyapiro31

As much as I'd like to say, I can't tell you where i got it. But i'm
trying to post info as much about Dev 3DS as possible

Does your development 3DS appear to be same hardware as ordinary one?
--Matyapiro31 16:10, 18 October 2011 (CEST)

Yes, Matyapiro31, it seems to be that way, i was surprised when i got
it, that it did not have parts of the case in red like a panda dev unit,
but it had the sticker on the back saying it was a "Development Unit".
Also the FCC id does not differ between my Development Unit and a Retail
Unit. This probably explains why in the Config menu, the "System Mode"
(which I believe is memory allowance) is stuck on "Prod". For some
reason Prod mode is 64mb. Why do you ask?

Hi 3dsguy, maybe you have something like a kiosk "demo unit" used at
stores (like GameStop, etc.).

- Do you have a retail 3DS unit? I'm curious if your test unit will
  communicate with a retail 3DS unit. ( downloadplay, street-pass, etc.
  )
- Does it connect to (production) nusd update servers for any updates?
- Do you have any other software or hardware with it? ( firmware
  updates? rewritable CTR cards? etc. )
- Can you get more of them however/wherever you received yours from?
- Would you be willing to run pre-compiled apps imported through your
  dev menu on your test unit? \[and if so do you have an email to send
  them to\]
- Would you be willing to lend or rent your unit out? I'm pretty sure
  you won't but it wouldn't hurt to ask.

\- [Jl12](User:Jl12 "wikilink")

No problem, I don't have a dev unit or anything so at least I can help
out a little this way, lol. [Nathan](User:Nathan "wikilink") 17:19, 20
May 2012 (CEST)

## 3DS Development System Talk

Quick link to a page on .CIA files, with sample .cia!!

I do not know a way of creating .CIA files. its just that
[Jl12](Jl12 "wikilink") asked me as part of a set of questions on my
talk page:

- "Would you be willing to run pre-compiled apps imported through your
  dev menu on your test unit? \[and if so do you have an email to send
  them to\]"

I said of course, and gave some details. Then, Jl12 responded to that
emailing me 3 apps to test. Jl12 on the other hand does know how to
compile apps in the .cia format and appears to have access to the DSi
SDK from what i gathered from the
email.--[3dsguy](User:3dsguy "wikilink") 22:37, 1 November 2011 (CET)


This is the problem many people seem to have with the test units. From
what I can tell, the only way to actually run some unsigned application
(not created by Nintendo) is by programming it on a development
flashcard. --[Neimod](User:Neimod "wikilink") 01:11, 2 November 2011
(CET)

I'm not sure why you deleted your previous post, but I agree that there
are **supposed** to be different kinds of media (development flashcard,
and copying from SD card to internal NAND) that allow running
applications on a test unit. However, of these methods, only so far the
development flashcard has proven to work with **unsigned** code. The
problem lies in the fact that the unsigned development CXI image uses a
dummy RSA private key to create the RSA signature, while official
Nintendo development CXI images use the real deal. So as it stands, no
developer can create proper CXI images for CIA importing.
--[Neimod](User:Neimod "wikilink") 14:11, 2 November 2011 (CET)

- I sent him 3 pre-compiled apps at first. ( all by Nintendo ). The
  first two don't boot because they're not compiled with the
  libs/firmware running on his test-unit. The 3rd TWL NAND app, doesn't
  have any icon/banner/title to identify itself after being installed,
  and although it imports/installs succesfully, it can't be selected or
  launched from Dev Menu or the Home Menu. Later, I sent him a
  self-built application ( one not by Nint. ), it installs, boots and
  runs properly and it just displays some information on the screens;
  those are the files and images he's linked to here. \[the "Hello
  Galaxy!!!" test-application.\]
- They're not unsigned. Dev/test units use a different set of keys then
  the retail/production units do.
- *So as it stands, no developer can create proper CXI images for CIA
  importing.* - What. I've sent self-built apps to test to 3dsguy and
  somebody else who owns a test unit running on a different firmware.
  They work fine. ( Although it's difficult to line up firmware
  revisions. )
- The one that runs was made (compiled/built) using the SDK/firmware
  revision matching his test-unit.
- He probably removed the 1st link because I asked him not to post
  anything with ( even potentially ) copyrighted contents for the sake
  of not getting this wiki associated with it, the binaries contained
  code from an e3 demo and the TWL/DSi SDK, we're not doing ourselves
  any benefit by posting it. The app that runs ( 'Hello Galaxy' ) is a
  self-compiled application, so it's probably not going to be mistaken
  for a game or another commercial application. \[thus probably safe for
  wiki.\] [Jl12](User:Jl12 "wikilink")



Interesting. That's the first I hear about running self compiled CIA's
on a test unit. And yes, sorry I said unsigned application, but I meant
signed with the development RSA private key provided by the SDK. The
official Nintendo development CIA's do not use keys from the SDK, but
rather, a private one that is not distributed.
--[Neimod](User:Neimod "wikilink") 02:17, 4 November 2011 (CET)

I had a look at your previous post, 3dsguy, where you have posted a
download link for a CIA file. We don't know much about CIA files so it
was interesting to see a file and look into it. The actual data for the
app/tmd/cmd files seems to be encrypted (expected that) there's only
some plain text like "Root"", "CA00000004" and "Root-CA00000004" to name
a few (...) which obviously are paths on the NAND FS. However, I've
found out that the name of the files/directories (eg name of the app
<file:%22ad7e6744>") which are saved on the SD card after installing the
archieve seem to be in the CIA file: Not as plain text, they're actually
hex values. I'm not really sure about that. It would be nice if you
could post another CIA file, 3dsguy, that we can compare them and find
out more about it. Shall we actually create a new page about CIA
files?--[Lazymarek9614](User:Lazymarek9614 "wikilink") 21:48, 2 November
2011 (CET)


They're certificates.

It's mentioned partially under "[Download
Play](Download_Play "wikilink")", because it's another use of the same
file format. [Jl12](User:Jl12 "wikilink")

Yes I think we should create another page made for .CIA file and move
some of this page to its discussion page. But I've got another .cia file
and and boots. see [1](http://121.215.146.1/3ds/more_cia_stuff.rar) for
everything you may want to know about it and perhaps from this we can
start a new page.--[3dsguy](User:3dsguy "wikilink") 07:52, 3 November
2011 (CET)


I think this is more about getting our own code running on the 3DS/CTR
then it is about CIA. [Jl12](User:Jl12 "wikilink")

Lazymarek9614, those "paths" are from the cert chain and the ticket. CIA
is based on WAD. --[Yellows8](User:Yellows8 "wikilink") 16:25, 3
November 2011 (CET)


If you are right and the format is based on WAD, then it might be little
endian (unlike WAD). First there's an unknown byte (0x20) and then 4
bytes (0x20000000), which looks a lot like the header size in WAD (which
is 'always' 32, in BE). So if this is the same field, I'm pretty sure
it's LE. --[lesderid](User:Lesderid "wikilink") 19:45, 3 November 2011
(CET)

@3dsguy - if the situation changes about being able to get any other
test-units please let me know, thanks. [Jl12](User:Jl12 "wikilink")

@[Jl12](User:Jl12 "wikilink"): Do you have the Nintendo SDK? If so, can
you upload it (correct me if this is a crime)?


If I did, I wouldn't be posting it here, see bullet \#5 above.
-[Jl12](User:Jl12 "wikilink")


Oops, sorry. Maybe can you upload some more CIA files which differs in
some cases only like the title name, icon
etc.?--[Lazymarek9614](User:Lazymarek9614 "wikilink") 18:20, 5 November
2011 (CET)

@--[lesderid](User:Lesderid "wikilink"): "So if this is the same field,
I'm pretty sure it's LE." I think it's HE. Is the header size actually
0x20 large? There's always a 0x80 byte after 0x20
bytes...--[Lazymarek9614](User:Lazymarek9614 "wikilink") 22:09, 4
November 2011 (CET)

Who ever has the ip "151.26.190.77" living in Campobasso, Italy, stop
probing the website where I've hosted the files. There are no SDKs on
that website so stop trying find something that does not
exist.--[3dsguy](User:3dsguy "wikilink") 13:13, 5 November 2011 (CET)

Just a simple question, 3dsguy. In the CIA page you uploaded a CIA
example. Can you upload also the binary format
uncrypted,please?--[Jocopoco](User:Jocopoco "wikilink") 07:42, 18
November 2011 (CET)

@[Jocopoco](User:Jocopoco "wikilink") - you should ask
[Jl12](User:Jl12 "wikilink") for it, it's his app after all. If he asks
you which one it is it's this one "JlTestApp -
test_02.cia"--[3dsguy](User:3dsguy "wikilink") 17:39, 18 November 2011
(CET)


[Jocopoco](User:Jocopoco "wikilink"), that CIA isn't encrypted at all,
just use ctrtool to extract the CXI and ExeFS.(and anything else)
--[Yellows8](User:Yellows8 "wikilink") 18:44, 18 November 2011 (CET)

Sure? In the content folder there is a file named \[*id*?\].app it's
encrypted I cant find anything, arm opcodes, text plain
--[Jocopoco](User:Jocopoco "wikilink") 19:09, 18 November 2011 (CET)


That .app CXI is encrypted the same way as titles downloaded via eShop
stored on SD card for retail 3DS,(besides different keys) the sample.cia
is cleartext. --[Yellows8](User:Yellows8 "wikilink") 20:37, 18 November
2011 (CET)

@[3dsguy](User:3dsguy "wikilink"): About the [SHBIN](SHBIN "wikilink")
in [romfs.bin](RomFS "wikilink"). Have you ever found there is .shbin
inside it? Look at which you uploaded to dropbox (*today or yesterday,
named "CIA"*) and find that one in folder "CIA\Extracted CIA Content\CXI
extract" and check offset 0x10C0. There is [SHBIN](SHBIN "wikilink")
name "font_RectDrawerShader.shbin" just above the offset (with 00
padding, also with the length of name 0x3a). There is also some other
clear text. you can extract the file in hex to check the shbin (maybe
0x3A0+0x8/0x18, of that file). if you think there is chance to check
those shbin, you may have to fetch some different CIA that generated and
decrypt and then extract its Romfs. i will be eager to see the
*extracted decrypted romfs*. If there is the proper source code of those
files that may be even easier to check the function's ASM. (well best
way is *use dev unit to generate a series of versions of the title and
extract all CIAs and decrypt to check those shbins*)
--[Syphurith](User:Syphurith "wikilink") 05:07, 28 March 2013 (CET)


[Syphurith](User:Syphurith "wikilink"), I knew about the .shbin in the
RomFS. I've updated the archive to include it. It's not a particularly
special file, I've seen it in lots of CXIs. You know you can use ctrtool
to extract and view everything in the .CIA file, as it is a debug CIA.
If you want the application's executable code, then you should look in
the code.bin inside the "exefs_extracted"
directory.--[3dsguy](User:3dsguy "wikilink") 07:07, 28 March 2013 (CET)


@[3dsguy](User:3dsguy "wikilink"), thanks for the information. well is
there any way to check the relations that between assembly and source
code? well i found those in exefs is salted (ie 0x5A03, with 0x00 0x10
0x20 chars. so if there is some source code of that CIA, the analyse can
be even easier)(Since it is salted we may find out the salt hex and can
make a tool to filter them all out). BTW, please take a look at these
below:

- Generate CIA series with Dev Unit (i mentioned above) and decrypt and
  try to compare those generated to see the assembly.
- Decap the chip and try to gain the *Creator Power* and we can take
  down Home Menu then (but there should be lots of work to do).
- Check all the potential storage media to look for 3ds Common Key, and
  use that and cetk of firmware on CDN to decrypt the firmware and check
  if there is any exploits that patched so the devices with lower
  version would have a chance to break in.
- Crack the storage chips and use something like a proxy to record all
  the data streams to a prepared storage (or to PC)
- Or simply let us wait for some progress?


You need to read up on the 3DS file formats, and boot order. It's
nowhere near as simple as that.--[3dsguy](User:3dsguy "wikilink") 07:59,
2 April 2013 (CEST)


I know there is a page of how 3DS got boot up (haven't found one telling
me how a title got launched). Well i think i should try to read those
documents (especially those has 'boot' or those word) again.
--[Syphurith](User:Syphurith "wikilink") 09:33, 2 April 2013 (CEST)

<!-- -->



I hope you can get some inspiration and find a new way. Well i'm
wondering about where could be a 'CTR Common Prod 1' key stored. (if
that can be written somehow, we may be able to cheat the system (if we
can get its private key from device and use that for decrypt, sorry) I
check those "CTR Common Prod 1" of my Japanese 3ds and one Usa 3ds of my
friend, and found there is nothing different in hex. if you need more
detail about that, pm me.) is that still more important finding the way?
--[Syphurith](User:Syphurith "wikilink") 09:50, 28 March 2013 (CET)

You won't find the 3DS common key by analysing 3DS communications. The
common key(s) are stored in two parts, and scrambled, deep inside the
3DS.--[3dsguy](User:3dsguy "wikilink") 07:59, 2 April 2013 (CEST)


That's right (yellows8 edited 'ClCertA' page and i knew that days ago);
i've given up finding one without hardware help (now waiting and also
learning some basis about hardware methods from Hackmii). Thanks.
--[Syphurith](User:Syphurith "wikilink") 09:33, 2 April 2013 (CEST)

<!-- -->


I tried to check the 'exefs.bin' in your archive uploaded, and found it
not easy to analyse. There're many things seems to be timestamps (that
WinHex told me).. and those text inside are merely readable (but you can
get 'NULL' or something else like 'Mem' or 'display'). I tried hard to
get some but found that not useful as a clue. Also the header and
reserved in exefs are 0x180 length now. If you can get many decrypted
exefs.bin please tell me (especially those on a same branch of source
code), thx. Well hope you get progress everyday.
--[Syphurith](User:Syphurith "wikilink") 07:22, 2 April 2013 (CEST)


That is the decrypted ExeFS, BTW the ExeFS format is already
[reversed](ExeFS "wikilink"). You will probably find it hard to make
anything out of the code actual game code, as it is a dissected version
of an ARM ELF.--[3dsguy](User:3dsguy "wikilink") 07:59, 2 April 2013
(CEST)


Oh.. Thanks. I may try to find another way. (sorry for my being noob,
that is really not easy) --[Syphurith](User:Syphurith "wikilink") 09:33,
2 April 2013 (CEST)

That ExeFs seems to need decoding before trying to get anything from it
(via disassemblers). So no usage now indeed (regarding yellow reading
those in memory..)? or maybe we will need a customed disassembler
dealing these for us? --[Syphurith](User:Syphurith "wikilink") 17:15, 21
June 2013 (CEST)

## Add me! 0662 - 4312 - 7555

Add me! 0662 - 4312 - 7555