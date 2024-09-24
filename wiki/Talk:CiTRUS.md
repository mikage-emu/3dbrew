About the XBSF format, is it a Nintendo's file format? Will It include
an executable image? Are there the sources of
CITRUS?--[Jocopoco](User:Jocopoco "wikilink") 08:08, 9 February 2012
(CET)

Not to downplay the usefulness of this program, but what purpose does it
serve for people who don't get to play around with dev 3DSes?
--[Luigi2us](User:Luigi2us "wikilink") 22:58, 27 February 2012 (CET)

"it can be retail signed, provided the right RSA keys" Which is
impossible, not even official devs have that retail RSA private
key.(they send their titles to Nintendo to sign, like they \*always\*
have) Therefore the output CXI \*is\* dev unit only.
--[Yellows8](User:Yellows8 "wikilink") 03:36, 2 March 2012 (CET)

This application and the linked .CXI are complete crap. The .bcwav file
in the application is a mutilated .WAV file, the .ctpk files are just a
series of random 0x00 and 0xFF, the .cbmd is another mutilated file (I
believe some image file), and the .cxi is complete crap (just look at
the file in a hex editor and tell me that's not immediately ridiculous).
Calling for deletion of this ridiculous page.
--[trap15](User:Trap15 "wikilink") 05:59, 2 March 2012 (CET)

Well the files may be legit, but since there's no way to obtain other
files than the ones he provided, this is mostly a toy. Have fun creating
the same output file over and over again :/
--[Luigi2us](User:Luigi2us "wikilink") 12:21, 2 March 2012 (CET)

Nintendo wouldn't use a bog-standard .WAV with changed header names. I
can 100% guarantee you that. I am about 99% sure that this code, and
[Xcution](User:Xcution "wikilink") are Complete Bullshit™.
--[trap15](User:Trap15 "wikilink") 19:12, 2 March 2012 (CET)


They [did](http://www.feshrine.net/hacking/doc/nds-sdat.html) and they
do. --[Elisherer](User:Elisherer "wikilink") 19:20, 2 March 2012 (CET)


@[trap15](User:Trap15 "wikilink") We don't need any drama in the 3DS
scene, take your flaming/trolling else
where.--[3dsguy](User:3dsguy "wikilink") 09:15, 3 March 2012 (CET)

Xcution Is there a way for decrypt your
demo?--[Jocopoco](User:Jocopoco "wikilink") 19:11, 2 March 2012 (CET)


No. --[trap15](User:Trap15 "wikilink") 19:12, 2 March 2012 (CET)

Why? Is it a fake? --[Jocopoco](User:Jocopoco "wikilink") 19:20, 2 March
2012 (CET)


Yes. --[trap15](User:Trap15 "wikilink") 20:22, 2 March 2012 (CET)

Xcution, here you can find the reason why none will use your tool for
creating homebrew:
[Talk:Homebrew_Format](Talk:Homebrew_Format "wikilink").--[Lazymarek9614](User:Lazymarek9614 "wikilink")
21:17, 2 March 2012 (CET)

If you adopt Nintendo's official software format,maybe some issues will
happen.

Official format should be known,cheating,illegal copying probably
happen.

This is the reason I suggest Homebrew Format. The format will be
different and developers should able to develop homebrew.


That was already discussed [here](Talk:Homebrew_Format "wikilink")...
"Official format should be known" Official format \*already\* is known.
Homebrew has \*always\* used the same format as official software. Not
using NCCH/whatever in homebrew won't slow down piracy much if at
all.--[Yellows8](User:Yellows8 "wikilink") 16:45, 3 March 2012 (CET)

Feedback:


1\. It puts together banner data for HomeMenu. It outputs a .bnr and
.icn, from the settings you chose and a few other files. For what it
does, it does work.

2\. The .CTPK / .ICN are fine. I built my own app using his output and
the icon is a large black "X" on a square white background. This is what
it looks like:
<http://img195.imageshack.us/img195/687/iconzviacitrustool.png>

Most likely you thought they looked like random FF and 00 because .ctpk
is an image format and that is an array of RGB data. What are the RGB
values of black and white pixels? (Black and white = xFF + x00)

3\. We've tested apps that used BCWAV format before. Here's one of the
sounds converted and tested with a real (dev/test) 3DS:
<http://www.mediafire.com/?lc1jcqcoxa9vl0m> , compare the headers.

4\. CBMD - the model/animation you see on the upper screen when you put
in a game/cartridge or hover over icons in Home menu.

5\. The "Chinese" versions of the title and publisher seem to get
removed in the "build" process, not sure if that's an issue with my PC
or your tool.

6\. Application77.cxi is invalid.

--[jl12](User:jl12 "wikilink")

In regards to the unencrypted ExeFS in the recently released homebrew
.CXI by Xcution, below are the offsets of the contents of the ExeFS for
those who want to slice it up.

The contents of the ExeFS with Offsets and sizes.

| OFFSET | SIZE   | DESCRIPTION                                            |
|--------|--------|--------------------------------------------------------|
| 0x00   | 0x200  | Header                                                 |
| 0x200  | 0x5A00 | Code                                                   |
| 0x5C00 | 0x4E20 | Banner (when extracted the official extention is .bnr) |
| 0xAC00 | 0x36C0 | Icon (when extracted the official extention is .icn)   |