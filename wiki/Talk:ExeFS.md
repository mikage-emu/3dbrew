## Code binary?

What is the format of the "Code Binary"? Surely it's not a raw stream of
ARM opcodes. There has to be data for the loader to work
with!--[Henke37](User:Henke37 "wikilink")
([talk](User_talk:Henke37 "wikilink")) 17:44, 22 July 2016 (CEST)


ExeFS:/.code *is* a raw stream of ARM opcodes, plus data/rodata
sections. The beginning of ExeFS:/.code is just plain ARM code (starting
in ARM mode), however. The location and size of the data/rodata sections
is described in the
[exheader](NCCH/Extended_Header#Code_Set_Info "wikilink"). Look up the
thing called "ctr-elf", which takes a decrypted NCCH and converts it to
an ELF file. Besides, these talk pages are kind of deserted; join the
relevant IRC channels instead. [IReir](User:IReir "wikilink")
([talk](User_talk:IReir "wikilink")) 07:17, 23 July 2016 (CEST)