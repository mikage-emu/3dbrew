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