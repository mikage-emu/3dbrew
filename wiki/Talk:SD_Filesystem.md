Are you sure that those offsets aren't exclusive to your SD card? Also,
if an offset is hexadecimal, then you should put "0x" before the
offset.--[T3a](User:T3a "wikilink") 18:04, 8 April 2011 (CEST)


They're not offsets, they're filenames.
[Bushing](User:Bushing "wikilink") 23:39, 8 April 2011 (CEST)


oh, my bad--[T3a](User:T3a "wikilink") 04:37, 9 April 2011 (CEST)

Extra data downloaded from internet are able to download from PC. So we
do MITM attack when download the data,we may find the server. data
downloaded from PC are not encrypted not to use with other
3DS.[Matyapiro](User_talk:Matyapiro31 "wikilink")

- It makes an encrypted connection to the update servers initially.
  [Jl12](User:Jl12 "wikilink")

This probably won't matter to most people but if you interrupt the
transfer of a eShop title before it completes downloading you're left
with an extra 00000001.ctx file in the directory of the 0000000x.app and
other files associated with it. The .app file is created filled with
0xFFFF padding ( at full size ) and chunks are sequentially over-written
with the correct encrypted data as the title downloads onto the SD card.
However if the download is interrupted before it finishes, the title can
still be loaded/selected/launched, and it will appear in the 3DS home
menu ( logo, sound, model, etc. ). It doesn't mind that most of the file
is corrupt/junk. When opening or launching it of course you'll just get
a generic error and forced to return to Home menu screen. If you erased
or padded far enough into the header - or ended the download early
enough - then the title/logo won't even appear in the home menu, but the
tile \*will still show there, but without the logo/model when selected.
( if you place your cursor over it, nothing appears where the game title
should normally be. It will not be launchable.)
[Jl12](User:Jl12 "wikilink")

## Save files

The article mentions

- The data dir contains 00000001.sav, this is the title's encrypted
  savegame. Although these saves look similar to FLASH savegames, these
  savegames use proper unique CTR for each AES block in the file, and
  the CTR properly changes for each savegame write.

Wouldn't this imply that the whole save file is modified for each save?
When I diff two 00000001.sav from different (subsequent) writes, they
only differ at certain portions (the first 0x10 bytes, certain blocks of
subsequent 0x20 bytes and certain one-byte changes).
[FireFly](User:FireFly "wikilink") 17:18, 18 December 2011 (CET)



IIRC when I first xored two different 00000001.sav files, the output was
garbage therefore I assumed that meant they change the CTR for each save
write. But when I did the same for a GBA VC save recently, I got zeros
and garbage where the changed data is. So I'm not really sure what's
with the CTR. --[Yellows8](User:Yellows8 "wikilink") 18:56, 18 December
2011 (CET)


From my experience, each saving takes a 0x1000 block and saves is
somewhere else...when you xor 2 files it doesn't mean anything because
the data maybe xored with other encrypted data so no clear text. For
data to be discovered the first file needs to have an encrypted data at
some offset and 2nd file will have encrypted 0xff at the same offset.
this is rather rare for the 3ds to delete its backups...
--[Elisherer](User:Elisherer "wikilink") 07:28, 19 December 2011 (CET)