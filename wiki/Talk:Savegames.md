Unknowns:

- Hashes at the end of each DIFI blob.
- How order / location of hash vs. partitioned blocks is determined.
  (since not sequentially).

I think there should be a page with infos on how to dump/restore saves.
[Matyapiro](メインページ "wikilink"):So then,I show you how to do dump
and restore saves. First,you should have either Nintendo DS/Lite or NDS
Adapter a tool to dump DS saves. It can restore saves,but Almost saves
cannot dump with NDS Adapter,but some of them can. If you have Nintendo
DS or DS Lite,you should try DSaveManager. It uses FTP to dump
saves,only dump. Last,I show you another save backup tool for DS. NDS
Backup Tool by Rudolph. Eepinator by WinterMute

Hardware:

- NDS Adapter Plus (by hkems)
- DS/DSLite & DSaveManager
- Neo SMS4 (by neoflash, untested)

But I cannot find any key word like player name,high score or play time
if I decrypt the save.

How do you think about whether any other encryption or special way to
read/write save used ?[Matyapiro](User_talk:Matyapiro31 "wikilink")

- I found those things in a SSFIV saved game...

The important offsets are usually constant, the values change, it's not
hard to look for an offset of data that's changing predictably after you
re-save.

Sometimes you have to use your imagination. To find 20,000 points in
SSFIV, you'd search for "0xC8" ( 200 in decimal == "20,000" in game )
because it stores the points in multiples of 100. It's easier to see if
you're editing saves in front of yourself and constantly making minor
changes to it - to see where those changes show up later. --jl

So we need analyze project with each
save.?[Matyapiro](User_talk:Matyapiro31 "wikilink")

- Only if you're trying to figure out where the game data is. Just
  common sense.
- You can examine each save manually after making small changes ( while
  playing with it on the 3DS ) but we still don't know what all the
  hashes are being used for.

spell error?What's this? ~Partitions are "catted" together　
[Matyapiro](User_talk:Matyapiro31 "wikilink")

- Con**cat**enated. Attached, joined, appended. One follows after the
  other. lol.

I looked into that blockmap structure thing, but I fear I didn't get it
right...

- sectors would be 4096 bytes. The Rayman 3D save is 128mb and has 31
  blockmap entries; the Ridge Racer 3D save is 1mb but only has 127
  blockmap entries (however the second half of that save is mostly a
  mirror of the first half, except for the first (special) sector).
- the dword at the beginning of the image tells the sector size
  (1\<\<val = sector size)?
- blockmap entries are phys_sec,alloc_cnt,checksum instead of
  checksum,phys_sec,alloc_cnt. There are then two spare bytes between
  the blockmap and the journal.
- bit7 of phys_sec in blockmap entries is set when the entry's checksum
  isn't zero

--[Luigi2us](User:Luigi2us "wikilink") 18:29, 4 August 2011 (CEST)

3DS Save De/Encrypter

3DS Save De/Encrypter application needs useful info on the header
Blockmap\Journal foe save modification. I'm so close i can feel it.
--[Immortal](User:Immortal "wikilink") 10:10, 18 August 2011 (GMT)

Let's look into those blockmap/journal checksums

- there's one 8bit checksum per 0x200 block
- blocks containing only 0xFF yield a checksum of 0x0F
- blocks containing only 0x00 yield a checksum of 0xB9
- checksums seem to apply to encrypted blocks. In the case of Ridge
  Racer, all-zero 0x200 blocks yield 0xE4 instead of Rayman3D's 0xB9.
  However, all-FF blocks always yield 0x0F since they aren't encrypted.

~~This is most likely a custom checksum algorithm. Standard CRC8 would
yield zero for a zero block.~~ Wrong. Checksums of zero blocks are
actually equivalent to the checksum of the game's XOR key.

--[Luigi2us](User:Luigi2us "wikilink") 19:59, 28 August 2011 (CEST)

@Luigi2us the checksum algorithm can be a crc because XorIn as well as
XorOut can be use that result in non zero results

there is a way to find out if it is a crc or something like that or
something simple

xor the message by B1 than the checkbit change by C1 xor the message
with B2 and the checkbyte change by C2 xor the message by (B1 xor B2)
and the checkbyte should change by (C1 xor C2)

example crc in this case crc-16 but also work with crc-8

06 06 01 05 crc is 1A21

06 06 01 05 xor 01 02 03 04 = 07 04 02 01 crc is 1580

06 06 01 05 xor 08 09 01 02 = 0E 0F 00 07 crc is 2973

06 06 01 05 xor 01 02 03 04 xor 08 09 01 02 = 0F 0D 03 03 crc is 26D2
(2973 xor 1580 xor 1A21)

that also work if a unknown XorIn or XorOut is used

that don't work for most hash functions

ADD:Sorry for my bad English

--[ichfly](User:ichfly "wikilink")

Sounds like a good idea. We just need to find 4 blocks A,B,C,D in one
save so that B=A^x, C=A^y and D=A^x^y.
--[Luigi2us](User:Luigi2us "wikilink") 22:54, 29 August 2011 (CEST)

Hi everyone... I'm adding save opening support to
[3DSExplorer](3DSExplorer "wikilink") and i'm having trouble
understanding the SAVE filesystem. btw Thanks
[CHR15x94](CHR15x94 "wikilink") for the effort but I don't want to
search the "SAVE" string. I want to find it programmaticaly. I'm using
the DIFI blob as a reference, starting from \[0x2000 + DIFI's Paritition
Hash Length\] the SAVE should be there and it is for all files at the
first partition. but the second partition I can't always find. I'm using
the 3 encrypted saves in the [Games](Games "wikilink") page.
--[Elisherer](User:Elisherer "wikilink") 08:43, 19 September 2011 (CEST)

When I search for the journal's magic (0x080d6ce0) I can't find anything
in all saves..? Is it an endian
problem?--[Lazymarek9614](User:Lazymarek9614 "wikilink") 14:29, 30
September 2011 (CEST)


After many files I looked at...There's no such thing as journal's
magic..it's just the same as the first one. and it can be sometimes
0xffffffff so i wouldn't count on it as a stop flag for reading the
journal. just use logic...you can see an example at 3dsexplorer source.
--[Elisherer](User:Elisherer "wikilink") 18:19, 30 September 2011 (CEST)

Magic isn't always 0x080D6CE0, sometimes it is 0x080D6C80 or something
in the like... Unrelatedly, I wonder what kind of data unused blocks are
mapped to (zeros or FF). Because those Rayman3D saves say that data goes
up to 0xF000 (the end of the dewearleveled image), however there are
usually no more than 4 blocks in use.
--[Luigi2us](User:Luigi2us "wikilink") 00:05, 1 February 2012 (CET)

[save file](http://dl.dropbox.com/u/37418652/3DS/MH3G.sav%7CMH3G)

I think this game is also using the new save encryption.--Matyapiro31
09:47, 19 February 2012 (CET)

## Encryption method

@Yellows8, I think the old encryption is just
[AES-ECB](http://en.wikipedia.org/wiki/Block_cipher_modes_of_operation#Electronic_codebook_.28ECB.29)
which is the same as AES-CTR whose counter isn't progressing...
--[Elisherer](User:Elisherer "wikilink") 15:07, 25 March 2012 (CEST)


It is \*not\* AES-ECB. If it were,(and Nintendo has \*never\* used
AES-ECB \*directly\*) you would see the same encrypted 16-byte block for
\*every\* all-zero 16-byte block. The CTR \*does\* increase, it just
gets reset every X bytes. An encryption method only counts as direct
AES-ECB only if the encrypted data is used as the AES input block, and
the output block is used as the strait decrypted block.
--[Yellows8](User:Yellows8 "wikilink") 18:31, 25 March 2012 (CEST)

## Hashes

@Yellows8, That's awesome! Can you explain a bit more about the buffer
padding (maybe give an example) I want to add the foundings to
3dsexplorer and complete the saving algorithm (without the MAC signing
ofcourse) --[Elisherer](User:Elisherer "wikilink") 07:12, 3 September
2012 (CEST)


Is it more clear with my last edit? The RomFS
[IVFC](https://github.com/3dshax/ctr/blob/master/ctrtool/ivfc.c) is
basically identical to savegames, except savegames have the additional
filesystem level.(Didn't realize that when I figured out the savegame
hashes though) And it's not actually possible to generate the MAC yet
with the AES engine, since the keyY for gamecard savegames is currently
unknown. --[Yellows8](User:Yellows8 "wikilink") 16:57, 3 September 2012
(CEST)


That's really interesting. I wonder what is the general idea here...Do
savegames use the romFS structure..
--[Elisherer](User:Elisherer "wikilink") 00:00, 4 September 2012 (CEST)

## Savegame keyY CardId

Are those two u32 cardIDs mentiond in keyY generation for the first
version of savegamy encryption just ROM chip type ID repeated twice,
like 45FA009045FA0090 or ROMID/EEPROMID combination? --[Duke
srg](User:Duke_srg "wikilink") 10:43, 23 February 2015 (CET)

## File system

Data of one file in SAVE partition / filestore seems sometimes
fragmented into several blocks, and BlockMap probably describes how to
link and build them. Is this already known? And I think what is stored
in BlockMap forms linked lists, and an entry is {uint32 previous_block;
uint32 next_block; }. (Note that I was looking into CECD system
savegame, which is the only savegame I looked, and which contains a
relative complicated folder structure, where files and folders can be
added and deleted frequently) --[Wwylele](User:Wwylele "wikilink")
([talk](User_talk:Wwylele "wikilink")) 15:01, 18 August 2016 (CEST)

Also the SAVE partition looks very similar to [extdata VSXE
partition](Extdata#Filesystem "wikilink"), especially the folder and
file entries. --[Wwylele](User:Wwylele "wikilink")
([talk](User_talk:Wwylele "wikilink")) 13:52, 19 August 2016 (CEST)