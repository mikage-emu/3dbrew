Now I figured that I didn't explain the target of this app... It's
suppose to be an Explorer like program to see inside the different
filesystems that the 3ds has. Now it's the ExeFS, RomFS and SAVE. As
knownledge keep flowing i'll continue to develop the application. With
the goal of making a full functional drag&drop file explorer for image
files. --[Elisherer](User:Elisherer "wikilink") 18:35, 15 September 2011
(CEST)

It fails showing the tmd file content. Have you finshed working on this
feature?--[Lazymarek9614](User:Lazymarek9614 "wikilink") 15:49, 20
September 2011 (CEST)


No, I don't have time to work on it..it's not interesting enough
--[Elisherer](User:Elisherer "wikilink") 15:36, 21 September 2011 (CEST)


Yeah, the 3DS doesn't care when the tmd file was modified... it's not
useful for hacking.--[Lazymarek9614](User:Lazymarek9614 "wikilink")
21:09, 21 September 2011 (CEST)

I downloaded the sources,but I can't find Save.cs and reference
"System.Development". Matyapiro31


You are right... I fixed it.. notice that the source is not the released
version it has some experimental stuff in it...
--[Elisherer](User:Elisherer "wikilink") 10:53, 30 September 2011 (CEST)

Do you know [Mono Develop](http://monodevelop.com/)? You can release it
as multi-patform,such as Linux,Machitosh,etc.


I did not know that until now. But I don't have time to make the
transition. I'm happy with VS2008 and it's relatively easy to make
changes and new features for the app. The source is open and you can
make a linux port if you want. --[Elisherer](User:Elisherer "wikilink")
18:16, 30 September 2011 (CEST)

You need no change.mono can run c# program like Java VM. Matyapiro31


I tried to compile it,but That was old one,and there is
"System.development."


[This](http://stackoverflow.com/questions/5865060/c-on-os-x-and-linux)
says that I need to fix stuff after I convert my project. and then work
with the mono app which I don't find very convinient... and about the
reference I don't know what it's about..I don't know a namespace called
System.Development --[Elisherer](User:Elisherer "wikilink") 17:42, 2
October 2011 (CEST) (P.s you can sign your messages with the quick
signature button or 4 tildes: '~' 4 times)

lblBrew_Click() had no exception handler,

you have to change this method in fmExplorer.cs to

`   private void lblBrew_Click(object sender, EventArgs e)`
`       {`
`           try`
`           {`
`               System.Diagnostics.Process.Start(lblBrew.Text);`
`           }`
`           catch (Exception ex)`
`           {`
`               MessageBox.Show("Cannot open link that was clicled.\n"+ ex.Message);`
`           }`
`       }`

Matyapiro31

The algorithm for the Image Hash might be either MD2 or MD4. I found out
by using HxD and Notepad. --[Kiddyshaq34](User:Kiddyshaq34 "wikilink")


Ok, but of what? (i know it's suppose to be 128 bit) And why not MD-5?
--[Elisherer](User:Elisherer "wikilink") 07:10, 9 October 2011 (CEST)


Because MD5 is longer and the Image Hash has the same number of bytes as
MD2 and MD4.


MD2, 4 & 5 are all 128bit which is 0x10 bytes...
--[Elisherer](User:Elisherer "wikilink") 20:28, 9 October 2011 (CEST)


Oh, I've forgotten about MD5. You are right.

3DS include RSA Securuty 's
[BSafe](http://www.rsa.com/node.aspx?id=1204)

from 3DS manual. Matyapiro31


Thanks Matyapiro31 but I think RSA is used for encryption and \*not\*
hashing. So the RSA might be used for ROMs and WiFi...
--[Elisherer](User:Elisherer "wikilink") 14:48, 9 October 2011 (CEST)

あほ。RSA BSafe support all security method.See
[this.](http://www.rsa.com/japan/products/bsafe/CRYPTOCJ_DS_1101-J.pdf)

I cannot find English version,sorry. Matyapiro31


I guess if you mean [this](http://www.rsa.com/node.aspx?id=3063) then
the digest algorithms are the ones that we know of..we havn't tried HMAC
yet or CNG but from experience we see that nintendo uses regular digest
algorithms like CRC16-Modbus and SHA-256. I'll add the HMAC ones to the
brute force hash tool to see if it finds something...
--[Elisherer](User:Elisherer "wikilink") 22:36, 12 October 2011 (CEST)

I've tried to decrypt 'Super Mario 3D Land' but your tool shows me an
'Corrupt Save File'
error.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 18:36, 18
November 2011 (CET)


Corrupted save file might be from 2 reasons: \* Size is not right (128K
or 512k) \* CRC on wearleveling wrong. Both problems occur from NDS
adapter plus malfunctioning...try blowing on the cart and the adapter
and download the savefile again...
--[Elisherer](User:Elisherer "wikilink") 20:16, 18 November 2011 (CET)


I actually don't use the useless NDS Adapter Plus, but I used DSM and
I've tried it two times (always the same data).. I hope Nintendo doesn't
use a new encryption now! Shall I send you the sav
file?--[Lazymarek9614](User:Lazymarek9614 "wikilink") 20:27, 18 November
2011 (CET)


Yes please, I could check it within the application...
--[Elisherer](User:Elisherer "wikilink") 20:35, 18 November 2011 (CET)


Have you found anything?--[Lazymarek9614](User:Lazymarek9614 "wikilink")
21:25, 18 November 2011 (CET)


No..it's seems that the key found isn't the right key (even that it
appears 4 times in the file). we need to figure out how to decrypt the
save files without searching blindly for the key.
--[Elisherer](User:Elisherer "wikilink") 21:33, 18 November 2011 (CET)

I got an idea. Xor the image's 0x100-0x103 with every (0x200 block)'s
0x100-0x103 to see if it produces 'DISA' ..it should work with the
already known files and might be faster to find. i'll try it tomorrow..
--[Elisherer](User:Elisherer "wikilink") 21:40, 18 November 2011 (CET)


Mind linking to a SM3DL save here so I could look at it?(Btw, you're not
looking for a "key", you're looking for an AES-CTR xorpad.)
--[Yellows8](User:Yellows8 "wikilink") 06:03, 22 November 2011 (CET)


I'll ask for permission. In the meanwhile, can we talk about it at
n-dev.net? I made a [thread](http://n-dev.net/showthread.php?tid=4)
there. --[Elisherer](User:Elisherer "wikilink") 16:26, 22 November 2011
(CET)


Yes, you can share them!--[Lazymarek9614](User:Lazymarek9614 "wikilink")
17:24, 22 November 2011 (CET)

Catch the files on my server
[<http://www.sherer.co.il/saves>](http://www.sherer.co.il/saves) (Super
Mario 3D Land).--[Elisherer](User:Elisherer "wikilink") 17:43, 22
November 2011 (CET)


I'm stumped too. Since some chunks of data appears several times in
these saves, in theory the CTR should still be repeating.(CTR seems to
repeat \>0x200 bytes now, not sure.) Didn't really manage to decrypt
much via xor. --[Yellows8](User:Yellows8 "wikilink") 22:08, 22 November
2011 (CET)

I would guess they finally fixed the bug that limited the xor stream to
just 0x200 bytes repeating, and now it behaves more like the data saved
to SD cards? --[Neimod](User:Neimod "wikilink") 01:30, 25 November 2011
(CET)

But you can see that same blocks share the same xorpad in the file...the
DISA header is in the file 4 times and encrypted the same all the 4
times.. so the key may not repeat but maybe every block has it's own
xorpad based on its offset in the image (my speculation)
--[Elisherer](User:Elisherer "wikilink") 09:02, 25 November 2011 (CET)

## \*FS#.bin decrypt

Maybe I found the key: I think it's the unknown value at Rom. It's 16
characters long. When I use it, it doesn't give a error or something.
--[Gericom](User:Gericom "wikilink") 16:06, 12 December 2011 (CET)

## Extracting Data Files?

Hello! I'm SuperMario64DS, I hack Mario Kart Wii & The Super Mario
Galaxy 1 & 2 ( Co-creator of the BDL Editor!). Okay, so I was wondering
about extracting files from a 3DS ROM; can the program do that? I think
I heard some where that it can decrypt 3DS ROMS and veiw their
filesystem, is this true? And if not, will his feature be added? And if
so, will an option to extract files from a ROM be added? I've been
looking into studying Mario Kart 7's formats, and to see how to game
works. --[SuperMario64DS](User:SuperMario64DS "wikilink"), 04:43, 20
December 2011 (CET)


As soon as you get the 3ds common key we could decrpyt the romfs & exefs
from the CXIs and then learn the file system... We could however have
your help in understanding the CGFX format which has 3d models in it.
--[Elisherer](User:Elisherer "wikilink") 07:22, 20 December 2011 (CET)

<!-- -->



Well how faraway would you say we are from decrypting 3DS ROMs? I'd
REALLY like to see inside of Mario Kart 7, I know it uses Yaz0, so it
can be de-coded. 1: How might we find the decryption key? And 2: How
much more longer do you think it will be until we can extract a 3DS
ROM's file system? It would be really helpful. --
[SuperMario64DS](User:SuperMario64DS "wikilink"), 16:34, 20 December
2011 (CET)


We are VERY far. (but then again it could happen any day). Nintendo was
smart enough to use AES-CTR which is a very strong encryption which
can't be cracked even if you have encrypted and decrypted data (and even
the initialization vector) you basicly need the key and it's far inside
the 3ds (maybe even coded in hardware and not just inside the 3ds
flash). So unless we were told what the key is I don't see us getting
anywhere. For now, we do what we can.
--[Elisherer](User:Elisherer "wikilink") 18:29, 20 December 2011 (CET)


So, we just need that key? How might we look into the 3DS's Film Ware?
Or couldn't you just observe the "Lock" (The 3DS ROM) And find the shape
of the "Key"? (Encryption Key). Then if we took the "Lock" apart, we
could re-build a replica of the "Key" and un-lock the File System. --
[SuperMario64DS](User:SuperMario64DS "wikilink"), 19:59, 20 December
2011 (CET)


We know the "shape" of the key, it's 16 bytes long, combined with an IV
you can decypher anything. Please read the rest of the pages on 3dbrew
before posting more questions. And you might want to look at
[GBAtemp.net](http://gbatemp.net/f201-3ds-hacking-homebrew) for more
information. --[Elisherer](User:Elisherer "wikilink") 22:01, 20 December
2011 (CET)


You completely missed my point there (A good point too), but since you
want me to stop asking questions I will stop.
--[SuperMario64DS](User:SuperMario64DS "wikilink"), 05:40, 21 December
2011 (CET)


Please don't stop asking questions. Asking questions leads us to finding
things... just ask them in the right place, like GBAtemp or the irc
channel. The title of this discussion is "Extracting data files" and
clearly it can't happen for now so this talk is useless.
--[Elisherer](User:Elisherer "wikilink") 09:30, 21 December 2011 (CET)

## Xentax

I would love to get the models from ace combat assault horizon legacy
but I know its a long long way off. but if you are looking to decrypt
the files you might want to try xentax. they have a whole decompression
section and since you have a tool you have some "street credit"


I rekon you're talking about the website, I looked it up but it doesn't
have any information about decryption.. only game file editors.. They do
have a program called MultiEx editor (for blizzard files) that seems
similiar to 3dsexplorer... --[Elisherer](User:Elisherer "wikilink")
07:28, 29 January 2012 (CET)

I only mean the other users might be of help on the forum anyway i look
and see if anyone else is doing the same kind of work as you and send
them your way

## questions

You can use Moma to scan 3DSExplorer for Mono
compatibility--[Jocopoco](User:Jocopoco "wikilink") 17:14, 10 February
2012 (CET)

Elisherer can you make the entries in the TMD sections editable for cia
files?--[3dsguy](User:3dsguy "wikilink") 13:04, 28 March 2012 (CEST)


Probably, but I want to make an all-around solution for editing because
it is needed by other formats too. I might need to add a struct to each
line on the list which will include data-type and editable boolean... it
might take some time... --[Elisherer](User:Elisherer "wikilink") 08:09,
29 March 2012 (CEST)

Elisherer there is a bug in your program, when it tries to read .cia
files which do not have a 'SMDH' or banner, like in the case of TWL
converted applications and some old .CIA files, 3DS Explorer crashes. It
is possible to read these kind of .CIA file in 3DSExplorer by entering a
false banner size, so I know this is where the problem lies. Can you
patch 3DSExplorer to read .cia files and not try to load information on
banners when the banner size is '0'--[3dsguy](User:3dsguy "wikilink")
02:25, 18 May 2012 (CEST)


I don't really understand the problem...if you look at mdlCIA.cs file
you'll see that i'm checking if the bannerLength \> 0 so I wouldn't know
what to change here.. --[Elisherer](User:Elisherer "wikilink") 10:45, 18
May 2012 (CEST)


Edit the sample .CIA on the .CIA wiki page and make the banner size
zero, then try to open it 3DSExplorer. On my computer this causes
3DSExplorer to crash--[3dsguy](User:3dsguy "wikilink") 12:50, 18 May
2012 (CEST)

Sorry correction, it crashes when you try to open a .cia file(that has
no banner size) when it is associated to be run with 3DSExplorer. But if
you try to load a .cia file(that has no banner size) from the open file
tab of 3DSExplorer, it tells me that an unhandled exception has occured,
"Object reference not set to an instance of an object."
--[3dsguy](User:3dsguy "wikilink") 16:57, 18 May 2012 (CEST)


OK, I found the bug that you were talking about... If the banner's size
is zero I try to put the icons in the file view anyway and that's
wrong..I'll try to fix the association bug and release a new version.
--[Elisherer](User:Elisherer "wikilink") 10:22, 19 May 2012 (CEST)

Found some more bugs. 3DSExplorer crashes when it tries to open .BNR
files and .BCWAV files. For example try the sample .BCWAV and .BNR file
in the 0.2 CiTRus release.--[3dsguy](User:3dsguy "wikilink") 12:32, 22
May 2012 (CEST)

I made it be able to send e-mail,but I don't have SMAP server and
knowledge about web application.
Here.[1](https://docs.google.com/folder/d/0B_1DNe-beZjwaWdKME1PTF9zYjA/edit)

--Matyapiro31 14:53, 9 July 2012 (CEST)


\[+\]How about release your source codes on Google Drive?

If you want to,everyone can edit it,see on web. I think it is very good
service.--Matyapiro31 14:53, 9 July 2012 (CEST)



Hi Matyapiro31, thank you for you efforts, the source code is maintained
by a version control system, this way i can revert to older versions if
necessary, Google Drive can't do it. The source is free to download
using checkout or browsing (on the site), You don't need to send
feedback because the google code site offers "Issues" you can open and I
will respond. --[Elisherer](User:Elisherer "wikilink") 08:01, 10 July
2012 (CEST)

Thank you to reply me.

I think it is easier for light-users to send mails than to write
comments on Google Code ----people who can debug,find solution of
error,use software without seeing any helps is worth being called
"Hacker".but they are minority in the 3DS game player.It is nice try to
construct a system to send feedbacks easily.

This is the time to decide 3DS homebrew standard including support,
internationalism,extensibility and easy development.--Matyapiro31 13:42,
10 July 2012 (CEST)

@elisherer are you going to update 3DSExplorer to read CIA files
differently as with the updated specs(this includes reading the .ICN
flags)? Also what about allowing the .CFA (NCCH) format to be read
without renaming to .CXI, and destinguishing between CFA and CXI when
viewing a CCI/CSU in 3DSExplorer?--[3dsguy](User:3dsguy "wikilink")
20:10, 20 July 2012 (CEST)

Why don't you add the function to read-and-write phtcache.bin? 3DSCamera
use the file to find the videos and pictures in
*SDDIR*/DCIM/XXXNIN03,but I succeeded to read a picture in other folder
by changing it.


That's nice, but I work only on small stuff for now because i'm very
busy.. maybe in the future if it becomes necessary
--[Elisherer](User:Elisherer "wikilink") 00:31, 16 January 2013 (CET)

I changed bad
codes.[MarshalUtil.cs](https://docs.google.com/file/d/0B_1DNe-beZjwdHgxMEVBRnkxNTg/edit?usp=sharing)
--Matyapiro31 15:20, 14 February 2013 (CET)


Big thanks! it will be changed to your edit in the near future
--[Elisherer](User:Elisherer "wikilink") 18:05, 14 February 2013 (CET)