It might be a bit early, but I think we can plan the homebrew format for
the 3DS now.

Here we can discuss and plan the format (e.g:)

- file extension (.3ds?)
- structure of the format

:\*header, banner (icon, 3d model, description...)

:\*header and executable areas ...and so on.

I think we should make it similar to the CXI format, that flashcards can
run both: commercial and homebrew
files.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 16:17, 11
September 2011 (CEST)

According to the decisions here I create a tool to create homebrew
(3dstool?).--[Lazymarek9614](User:Lazymarek9614 "wikilink") 17:13, 11
September 2011 (CEST)


Do you have any experience in making such files and tool?
--[Elisherer](User:Elisherer "wikilink") 19:02, 11 September 2011 (CEST)

<!-- -->



Well, I know about the elf, afx, bmp, 3ds, obj, nds format. I also have
read the sources of tools like ndstool (used for creating nds files).

<!-- -->



Let's discuss the
format!--[Lazymarek9614](User:Lazymarek9614 "wikilink") 19:33, 11
September 2011 (CEST)


Ok, i just wanted to know if it's somebody who knows what he talks
about, You could never know... I was wondering, because I watch this
wiki a lot maybe we wanna make this discussion on another forum like
gbatemp so it won't notify us for every post. Because these wiki pages
weren't made for big discussions, just on stuff that we aren't sure
about... --[Elisherer](User:Elisherer "wikilink") 20:04, 11 September
2011 (CEST)

<!-- -->



Wouldn't we just use CXI or CCI? I don't see why we'd need to make a new
format. Any flash carts made for the 3DS would boot files in the CXI or
CCI format, since that's the format commercial ROM images use, and the
primary goal of flash carts is to boot commercial pirated content
(unfortunately). CXI is also the 3DS's native format, and has space
reserved for code, the banner, etc. Not trying to be rude, but I don't
think we need to make a new format for 3DS homebrew, or really discuss
it for that matter. And we're spamming the crap out of the changelog,
so... --[CHR15x94](User:CHR15x94 "wikilink") 21:00, 11 September 2011
(CEST)

<!-- -->



.3ds is used as 3DCG file extension.I want homebrew like linux
application. License would be GPL.we could update automatically via spot
pass! --Matyapiro31


I Agree. it's imprtant that the format would be GPL because otherwise we
will be called outlaws...the Wii's homebrew channel clearly was legal.
We need to use a wrapper structure (like the CXI) to have an icon, 3d
model (based on an existing one) & data (elf binary file). we can add
stuff like structure version for future extensions...
--[Elisherer](User:Elisherer "wikilink") 08:30, 12 September 2011 (CEST)


We can't deside that the person who make the first homebrew loader can
deside that because if you have a format that nobody can lunch nobody
will use it. I think the first will be an elf loader because you can
just copy the code for loading the elf and lunching it.
(http://en.wikipedia.org/wiki/Executable_and_Linking_Format)
--[ichfly](User:ichfly "wikilink")


"I Agree. it's imprtant that the format would be GPL because otherwise
we will be called outlaws..." What? Nintendo's .srl/.nds format is used
for DS(i) homebrew as well, and many other hb formats...
--[Yellows8](User:Yellows8 "wikilink") 19:40, 12 September 2011 (CEST)

OK, to summarize the hole thing a bit:

- we have to think about a legal file extension (not .3ds!) and its GPL
  license
- the homebrew format will have a structure similar to CXI
- elf binary file for the executable area

What about the encryptions made in the CXI file? Will our format
encrypted too and what about the model, icon and executable data, are
those only file formats like obj /3ds, bmp and elf saved in the homebrew
file?

I will start coding the "3ds homebrew tool" soon and publish it on my
dropbox folder. @[ichfly](User:ichfly "wikilink"): The first loader will
be sure an elf loader, but for the programmer made this loader it
wouldn't be much of work to launch an executble area in the homebrew
format (so far it will contain an elf).

Maybe we could use elf as-is and add the media stuff at the end. (every
thing has offset so it wont clash with other elf loaders). we can also
use the SHT_NOTE section to add the offset to the media_struct.. [Elf
Format](http://www.skyfree.org/linux/references/ELF_Format.pdf)
--[Elisherer](User:Elisherer "wikilink") 16:24, 12 September 2011 (CEST)

Don't waste your time writing a "3ds homebrew tool". Don't be concerned
about the hb format, the people who write the first hax decide that.
"What about the encryptions made in the CXI file?" CXI supports
cleartext \*FS etc, no need to encrypt those for a hb format.
--[Yellows8](User:Yellows8 "wikilink") 19:40, 12 September 2011 (CEST)


Do you think writing a hack would be more useful,
[Yellows8](User:Yellows8 "wikilink")? However, before we can run hacks
we have to find an exploit. Also writing a hack is complicated (for
example we now zero about the GPU). What is your plan?
@[Elisherer](User:Elisherer "wikilink"): the link "[Elf
Format](http://www.skyfree.org/linux/references/ELF_Format.pdf)" seems
to be dead.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 20:35, 12
September 2011 (CEST)


Sorry...fixed both links.. --[Elisherer](User:Elisherer "wikilink")
20:51, 12 September 2011 (CEST)


"Do you think writing a hack would be more useful" Sure. "for example we
now zero about the GPU" Homebrew doesn't \*have\* to use the PICA200
IMO, unless ds-mode gfx is disabled in 3ds-mode. "What is your plan?"
Well, what I'm doing ATM is working on DSi stuff while waiting for
someone to get a ramhax rig going, then RE 3DS code once that's
possible. --[Yellows8](User:Yellows8 "wikilink") 21:45, 12 September
2011 (CEST)

<!-- -->



we must use UTF-8 and universal true type font.Various language can be
expressed.

<!-- -->



x3d is not standard,I know...

3ds,stl are used almost softwares,so we can use more resources.
Matyapiro31



I think we should give the homebrew format the .n3ds extension since I
don't think it's used by any application.
--[Kiddyshaq34](User:Kiddyshaq34 "wikilink")

Elisherer,why don't you make 3DSExlorer a IDE for homebrew until 3ds is
hacked? --Matyapiro31 16:24, 26 October 2011 (CEST)


But we don't have tools to make homebrew...So what will I work with?
besides 3dsexplorer isn't a tool for that...maybe in the future we could
make an enviroment in eclipse for development of homebrew. I can assure
you that it'll be much better. --[Elisherer](User:Elisherer "wikilink")
20:10, 26 October 2011 (CEST)


What a little bit of googling can do [snipah](http://snipah.com/).
--[Elisherer](User:Elisherer "wikilink") 20:22, 26 October 2011 (CEST)


I wanted to make a 3dstool which you can use to create 3ds homebrew
files (see above). If you want to add something to my tool, please tell
me!--[Lazymarek9614](User:Lazymarek9614 "wikilink") 20:39, 26 October
2011 (CEST)