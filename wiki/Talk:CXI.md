How 3DS system judge encryption type?
--[Matyapiro](User_talk:Matyapiro "wikilink")


Sorry the question is not understood. What do you mean?
--[Neimod](User:Neimod "wikilink")

<!-- -->



I think that he means "How does the 3DS decide what encryption method
must be used" --[Quincy](User:Quincy "wikilink") 23:47, 29 May 2011
(CEST)

<!-- -->



That question does not make sense. There are no decisions. It is always
AES CTR. --[Neimod](User:Neimod "wikilink")

Sorry,how does the 3DS decide what key to use for encryption?
--[Matyapiro](User_talk:Matyapiro "wikilink")


If you figure that out, let us know, thanks.
--[Neimod](User:Neimod "wikilink") 02:45, 1 June 2011 (CEST)

There's a common key used to generate output at compile time, when the
cci/ctx files are made. Why do you say 128 bit AES CTR though?
--[Jl12](User:Jl12 "wikilink")


Because 128-bit AES CTR is used to encrypt those formats.
--[Neimod](User:Neimod "wikilink") 15:40, 18 June 2011 (CEST)

AES CTR is more difficult to attack via DPA or EM-DPA

I know \*something\* is used to encrypt but do we know it is 128 bit AES
CTR? --[Jl12](User:Jl12 "wikilink") do you know that the cipher text is
xored at the end but not the exact algo or are you sure about AES also

Frankly I don't think it was AES. I think it's using RSA for encryption.
Besides it already used it once for the 2048-bit signature as you said.
Wouldn't it make way more sense to also use it for the encryption
scheme. --[Jl12](User:Jl12 "wikilink")


Lol. --[Neimod](User:Neimod "wikilink") 16:06, 20 June 2011 (CEST)

agree the (LOL) RSA would not be of use to slow for an real time
decryption or load of a game at runtime also the block size would not
match and there would be no advantage using RSA as when console talks to
the cartridge both keys are exposed to the end user and therefore could
be potentially broken. RSA would only make sense if they can keep a
secret key at their place. which is the case for DSA to sight the
firmware for example preventing anybody to load unauthorized firmware
into the device. and nobody could fake the signature as he does not have
the private key. (fairly standard methods today for all sorts of
consumer electronics).

What's funny? So I guess it's just based purely on speculation? You
should say so. That way nobody believes something that isn't right.
--[Jl12](User:Jl12 "wikilink") 22:28, 20 June 2011 (CEST)


RSA is only used for the signature. After that a symmetric block cipher
called AES is used in CTR mode. --[Neimod](User:Neimod "wikilink")
23:32, 20 June 2011 (CEST)

i guess if Neimod has the RAM simulator he could dump the firmware if
not fire walled by a MMU. the PROC is ARM and there are nice IDA modules
for it plus the Hexrays decompiler. Don't forget the RAM is executable
and i don't think that neimod just read from it !

How did you get this data? Did you find some way to dump 3DS cartridges?
--[Popoffka](User:Popoffka "wikilink") 09:15, 1 June 2011 (CEST)


Yes, someone found a way to dump the data on 3DS cards. Unfortunately
the method cannot be disclosed, and at this point dumping is not really
useful since most of the information is encrypted.
--[Neimod](User:Neimod "wikilink") 10:03, 1 June 2011 (CEST)

Do you have any method to run a Dump? and did you find the key for the
ctrtool? --[Stevechou](User:Stevechou "wikilink")


Nope on both questions. --[Neimod](User:Neimod "wikilink") 17:33, 25
June 2011 (CEST)

There's code in ctrtool that takes the AES counter value from some
partition ID and type. I can't help but wonder, how do you know that the
counter value is generated this way? And if we know that, isn't it a
start to finding out the key? --[Luigi2us](User:Luigi2us "wikilink")
20:17, 25 June 2011 (CEST)


Sorry this information cannot be disclosed.
--[Neimod](User:Neimod "wikilink") 05:17, 27 June 2011 (CEST)

Anyway, can you read the encrypt datas?

Hi! Do we already know where the offset of the ARM11 code is? And that I
got correctly, that the hole 3DS ROM encrypted by AES?
--[Lazymarek9614](User:Lazymarek9614 "wikilink") 21:10, 1 August 2011
(CEST)


Yes, see ctrtool for more exact details.
--[Neimod](User:Neimod "wikilink") 17:44, 6 September 2011 (CEST)

<!-- -->



I mean the offset of the ARM11 code not the exefs. Exefs contains not
only the code, right?

Would CXI be the homebrew application file format, what do you think? If
so, then I think we can modify it a bit for homebrew,

because some parts doesn't make
sense.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 19:18, 6
September 2011 (CEST)


The ExeFS contains only the ARM11 code and the banner. To know the
offset of the ARM11 code you would need to scan the ExeFS for the file
".code".

As for the homebrew file format, I think it's a little too early for
that. Whatever happens, happens. --[Neimod](User:Neimod "wikilink")
23:12, 6 September 2011 (CEST)


Thanks, but please can you give me the parameters for your tool to
decrypt the ExeFS and save it? The usage for that is a bit
ununderstandable.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 20:01,
7 September 2011 (CEST)


One of the parameters to use this tool is the master decryption key,
which is currently not known. So at this point, nobody can use this tool
to decrypt the ExeFS. --[Neimod](User:Neimod "wikilink") 03:12, 8
September 2011 (CEST)


This master decryption key, is it used for every game? For the 3ds
homebrew format I will create a tool which includes a 3d model, an icon
and the machine code in the file. However, before we should think about
the structure for it. I know that's a bit early, but later (when we can
run homebrew) we will be glad if we have
it.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 20:14, 9 September
2011 (CEST)


We can also use the elf Format for
homebrew--[ichfly](User:ichfly "wikilink")


Yes, but it has not a
banner.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 16:54, 10
September 2011 (CEST)


Shall I create a new talk about the homebrew format? We should discuss
and plan it a bit.--[Lazymarek9614](User:Lazymarek9614 "wikilink")
11:08, 11 September 2011 (CEST)


Yes, you shall.. --[Elisherer](User:Elisherer "wikilink") 11:55, 11
September 2011 (CEST)

Hi Neimod, love your work! my question is: The extended header suppose
to start right after the NCCH header so why there is twice the space?
(extended header size is usually 1024 and plain region offset is usually
5\*512 = 2560 -\> 2048 after the end of the ncch) thanks.
--[Elisherer](User:Elisherer "wikilink") 11:46, 6 September 2011 (CEST)


I'm not sure I understand you. The extended header does come right
exactly after the NCCH header. The only place where this does not hold
is the NCCH header at offset 0x1000, but this one header should be
ignored because this space does not exist on a real card. I suspect this
is the plaintext header from command 0x82 that was injected into the ROM
in post-processing by the dumpergroup.
--[Neimod](User:Neimod "wikilink") 17:40, 6 September 2011 (CEST)


Thanks for the answer, what I meant is that there is a block (of 2048
bytes) between the ncch header and the plain region. this is where the
extended header should be, and it supposed to be 1024 bytes. So my
question was what are the extra 1024 bytes for (they are not zeros...)
--[Elisherer](User:Elisherer "wikilink") 19:07, 6 September 2011 (CEST)


Ah that, I'm not sure what that 0x400-byte region is.
--[Neimod](User:Neimod "wikilink") 23:12, 6 September 2011 (CEST)


So... how did you get that "Example dependency list from the extended
header" obviously it's encrypted...?
--[Elisherer](User:Elisherer "wikilink") 13:22, 7 September 2011 (CEST)


That was added by [Jl12](User:Jl12 "wikilink"), maybe he can answer this
for you. --[Neimod](User:Neimod "wikilink") 03:12, 8 September 2011
(CEST)

I have a simple question why Neimod are thinking the code is compressed?
I think LZSS is not good for binary images.


Because they just are. --[Neimod](User:Neimod "wikilink") 17:40, 6
September 2011 (CEST)

Game editors want to fit their game in the smallest ROM chip size
possible, to reduce manufacturing costs. Also, encrypting blocks of
zeros/FF is bad practices, compression avoids it.
--[Luigi2us](User:Luigi2us "wikilink") 18:17, 6 September 2011 (CEST)

I've found something in my Chronicles Samurai Warriors savegame:

`18 A1 72 6F 6D 3A 2F 53 00 6F 75 6E 64 2F 73 74 .¡rom:/S.ound/st`
`72 00 65 61 6D 2F 53 54 52 4D 00 5F 53 59 53 5F MES.SAGE_GOO.D.b`
`63 73 74 6D F9 D7 9A 2F 95 90 8D 0A 93 00 03 B0 cstmù×š/•...“..°`

Looks like a path in the ROM filesystem in a LZ77 compression. Maybe it
can help to find the master decryption key (if we would have a dumped
Samurai Warriors).--[Lazymarek9614](User:Lazymarek9614 "wikilink")
21:12, 16 September 2011 (CEST)


I'm by no means an expert on de/encryption, signing code and what not,
but the master decryption key is probably stored in internal RAM/ROM (in
other words, inside the CPU die), that way it can't be sniffed or easily
obtained. I doubt Nintendo would store a key as important as that in
external RAM/ROM/SRAM, or in a some form of a filesystem. If they did,
their programmers are dumber than Sony's. But again, system security is
not the sort of thing I am good at, so take this with a grain of salt.
--[CHR15x94](User:CHR15x94 "wikilink") 21:35, 16 September 2011 (CEST)

The key is stored in every 3DS and it's always the same key...! I wonder
that no one sniffed the 3DS' RAM yet. This should be done now! Has
anyone experience in RAM
sniffing?--[Lazymarek9614](User:Lazymarek9614 "wikilink") 22:01, 16
September 2011 (CEST)


Someone will eventually. It's not an easy thing to do, and FPGAs (the
device you'd use to access RAM) are quite expensive (\$500 - \$700+USD
for a decent one). People did it with the DSi, I'm sure it won't be
_too_ long for the 3DS. Might find
[this](http://hackmii.com/2009/09/dsi-ram-hax/) interesting as well.
--[CHR15x94](User:CHR15x94 "wikilink") 22:55, 16 September 2011 (CEST)

FPGAs are very expensive, that is true. The cheapest one I've ever seen
was about \$199 (it's the Development board which was used to dump ROMs
by Legacy). I know about the DSi RAM haxx, but I don't have an FPGA. If
I had one, I would try
it.--[Lazymarek9614](User:Lazymarek9614 "wikilink") 10:17, 17 September
2011 (CEST)


The cheapes I saw was 52 \$ but if you realy buy one get the one for 69
\$ (becaus I think it is much better)
<http://www.altera.com/products/devkits/max-index.jsp> or one with a
cyclon. I recommend boards with an Embedded
USB-Blaster.--[ichfly](User:ichfly "wikilink")

That, and the pinout of the 3DS RAM chip is completely unknown.
--[Luigi2us](User:Luigi2us "wikilink") 17:52, 17 September 2011 (CEST)

"Non-Executable CXI file examples(Includes Decrypted RomFS): DLPChild"
Why are you calling dlpchild non-exec NCCH when that would have an ExeFS
like any other "normal" CXI?(AFAIK dlpchild is exactly the same as other
exec CXIs besides being temporarily installed to NAND from wlan for
running) --[Yellows8](User:Yellows8 "wikilink") 16:44, 23 June 2012
(CEST)


Bad wording, I mean DLPChild Container NCCH, the same DLPChild
containers used in CCIs and installed titles, to hold the DLPChild CIA
files--[3dsguy](User:3dsguy "wikilink") 00:36, 24 June 2012 (CEST)

I've been thinking, you know how we have executable specialisations of
NCCH, which are officially called .CXI (CTR Executable Image). And we
also have non-executable specialisations of NCCH, which I've assumed
uses the extention .CXI. But perhaps officially, non-executable
specialisations of NCCH have a different file extention all together,
like the case CCI and CSU (both NCSD
format).--[3dsguy](User:3dsguy "wikilink") 18:09, 7 July 2012 (CEST)


actually after looking more closely at the scarse details on the CFA
(CTR File Archive), the details closely follow the non-executable
specialisation of NCCH which is the dlpChild container. So are the
non-executable NCCH called CFA files?--[3dsguy](User:3dsguy "wikilink")
18:20, 7 July 2012 (CEST)

Question: from what you know today (i assume you have at lead partially
disassembly) what of the mechanism is HW implemented ? and what software
? the random seeding function for example ? could you force the seeding
to be constant or better at your choice ? i think if you can influence
the seed and if the use AES CRT plus the cipher text cleartext info as
you must have as it corresponds RAM / ROM extern intern it should be
possible to launch a DPA attack on it and get the key. assuming that
there are not some hidden custom functions in it.