+++
title = '3DS Userland Flaws'
BookToC = false
+++

This page lists vulnerabilities / exploits for 3DS applications and
applets. Exploiting these initially results in ROP, from that ROP one
can then for example try exploiting
[system](3DS_System_Flaws "wikilink") flaw(s).

# Non-system applications

<table>
<thead>
<tr class="header">
<th>Application name</th>
<th>Summary</th>
<th>Description</th>
<th>Fixed in app/system version</th>
<th>Last app/system version this flaw was checked for</th>
<th>Timeframe info related to this was added to wiki</th>
<th>Timeframe this vuln was discovered</th>
<th>Vuln discovered by</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Cubic Ninja</td>
<td>Map-data stack smash</td>
<td>See <a {{% href "../Ninjhax" %}} title="wikilink">here</a> regarding
Ninjhax.</td>
<td>None</td>
<td>App: Initial version. System: <a {{% href "../10.4.0-29" %}}
title="wikilink">10.4.0-29</a>.</td>
<td>Ninjhax release</td>
<td>July 2014</td>
<td><a {{% href "../User:smea" "broken" %}} title="wikilink">smea</a></td>
</tr>
<tr class="even">
<td>The Legend of Zelda: Ocarina of Time 3D</td>
<td>UTF-16 name string buffer overflow via unchecked u8 length
field</td>
<td>The u8 at offset 0x2C in the savefile is the character-length of
the UTF-16 string at offset 0x1C. When copying this string, it's
essentially a memory-copy with lenval*2, not a string-copy. This can be
used to trigger buffer overflows at various locations depending on the
string length.</p>
<ul>
<li>When value is &gt;=0x6E it crashes when saving the saveslot, this
causes a stack-smash however it normally crashes before it returns from
the function which had the stack-frame overwritten.</li>
<li>With value &gt;=0x9A, it crashes via stack-smash in-game once any
dialogs are opened(touching buttons on the touch-screen can trigger it
too).</li>
<li>Length value&gt;=0xCD causes a crash while loading the saveslot, via
a heap buffer overflow. This buf-overflow overwrites a heap memchunk
following the allocated buffer. When the first 16-bits overwriting that
heap memchunk is not the memchunk magic-number(0x7373), the mem-alloc
code will just return a NULL ptr which later results in a crash. When
the magic-number is valid, the mem-alloc code will continue to attempt
to parse the memchunk, which may crash depending on the data which
overwrote the memchunk. This heap code is separate from the CTRSDK heap
code. Exploiting this doesn't seem to be possible: since the heap code
actually verifies that the magic-number for the next/prev memchunk ptrs
are correct(unlike CTRSDK), it's not possible to change those ptrs to
useful arbitrary addresses outside of savedata(like with triggering a
write to a c++ object ptr which later is used with a vtable func-call,
this is what one would do with CTRSDK heap here).</li>
</ul>
<p>On March 11, 2015, an exploit using this vuln was released, that one
was intended for warez/etc. The following exploit wasn't released before
then mainly because doing so would (presumably) result in the vuln being
fixed. The following old exploit was released on March 14, 2015: <a
href="https://github.com/yellows8/oot3dhax">1</a>.</td>
<td>None</td>
<td>App: Initial version. System: <a {{% href "../10.6.0-31" %}}
title="wikilink">10.6.0-31</a>.</td>
<td>March 11, 2015</td>
<td>Around October 22, 2012</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a></td>
</tr>
<tr class="odd">
<td>Super Smash Bros 3DS</td>
<td>Buffer overflow in local-multiplayer beacon handling.</td>
<td>See <a {{% href "../Smashbroshax" %}} title="wikilink">here</a>.</td>
<td>App: v1.1.3</td>
<td>See <a {{% href "../Smashbroshax" %}} title="wikilink">here</a>. System: <a
{{% href "../10.3.0-28" %}} title="wikilink">10.3.0-28</a>.</td>
<td>Time of exploit release.</td>
<td>See <a {{% href "../Smashbroshax" %}} title="wikilink">here</a>.</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a></td>
</tr>
<tr class="even">
<td>Pokemon Super Mystery Dungeon</td>
<td>Heap overflow within linear memory via unchecked save file
length</td>
<td>Pokemon Super Mystery Dungeon uses zlib compression for most of
its save files, possibly due to the save files being larger than its
predecessor, Gates to Infinity. When a save file is being prepared to be
loaded and read from, only a 0x32000 large buffer is allocated for file
reading, and a 0x3e800-large buffer for decompression is also allocated
before the file is read. However, the game does not limit the size of
the file read to this allocation bound, allowing for the file to
overflow into the linear memory heap and into the next allocation. Since
Pokemon Super Mystery Dungeon stores allocation memchunks directly
before the allocation, overwriting the next memchunk with a corrupted
one allows for arbitrary writes of linear heap pointers when the next
buffer is allocated or arbitrary writes of any pointer within writable
memory when the corrupted buffer is freed.</td>
<td>None</td>
<td>O3DS: <a {{% href "../11.3.0-36" %}} title="wikilink">11.3.0-36</a>. N3DS:
<a {{% href "../11.4.0-37" %}} title="wikilink">11.4.0-37</a>.</td>
<td>Time of exploit release.</td>
<td>April 14, 2016</td>
<td><a {{% href "../User:Shinyquagsire23" "broken" %}} title="wikilink">Shiny
Quagsire</a></td>
</tr>
<tr class="odd">
<td>VVVVVV</td>
<td>Buffer overflow in XML save file array parsing</td>
<td>VVVVVV utilizes several XML files (renamed with a .vvv extension)
to store level save data, stats and settings. Within these XML files are
several tags containing an array of data which, when parsed, is not
properly checked to be of proper length for the tag being parsed from.
This allows for an overflow of 16-bit array values from the location
where the array is parsed. With unlock.vvv, XML data is parsed to the
stack, and with level saves the heap. This allows for the pointer where
the level save worldmap tag array should be parsed into to be
overwritten with a stack address, allowing for ROP from within the XML
array parsing function on the next level load.</td>
<td>App: v1.1</td>
<td><a {{% href "../10.7.0-32" %}} title="wikilink">10.7.0-32</a>.</td>
<td>Time of exploit release.</td>
<td>April 25, 2016</td>
<td><a {{% href "../User:Shinyquagsire23" "broken" %}} title="wikilink">Shiny
Quagsire</a></td>
</tr>
<tr class="even">
<td>Citizens of Earth</td>
<td>Save file read stack smash</td>
<td>Citizens of Earth also uses "XML" files for saves, which are
actually entirely binary data (not XML at all) with no checksums. These
files are read from the filesystem on to a fixed size stack buffer which
leads to an incredibly trivial stack smash. When using the autosave slot
for this, the save is parsed when the user selects "continue". When
using one of the dedicated save slots (1-3), the save is parsed shortly
after the company splash screens fade. Note that the save is read quite
high (descending) on the stack - when exploiting this, one would likely
need to move SP due to almost instantly overflowing the physical
stack.</td>
<td>None</td>
<td><a {{% href "../10.7.0-32" %}} title="wikilink">10.7.0-32</a>.</td>
<td>Time of exploit release.</td>
<td>May 5, 2016</td>
<td><a {{% href "../User:Dazzozo" "broken" %}} title="wikilink">Dazzozo</a></td>
</tr>
<tr class="odd">
<td>SmileBASIC 3.x</td>
<td>Poor parameter validation on "BGSCREEN" command</td>
<td>The SmileBASIC "BGSCREEN" command's second parameter is not
properly validated as being within range. As a result, one can set the
screen size to an absurdly large value. This means that the "BGGET" and
"BGPUT" commands can then be used on out-of-range values to read and
write a significant chunk of the interpreter's address space. With a
series of carefully-designed BGPUT commands, one can build a ROP chain
and cause it to be executed.</td>
<td>App: 3.3.2.</td>
<td>System: <a {{% href "../11.0.0-33" %}}
title="wikilink">11.0.0-33</a>.</td>
<td>July 20, 2016</td>
<td>Around June 26, 2016</td>
<td>slackerSnail, 12Me12, incvoid Exploited by MrNbaYoh and <a
{{% href "../User:Plutooo" "broken" %}} title="wikilink">plutoo</a>.</td>
</tr>
<tr class="even">
<td>SmileBASIC 3.x</td>
<td>Subscripted TIME$/DATE$ allow write access to DATA/BSS</td>
<td>Utf-16 characters can be assigned to subscripted TIME$/DATE$
interpreter sysvars which results in write-only access to all of DATA
and some BSS in userland. TIME$[0]/DATE$[0] actually point to somewhere
in rodata, and an overly large subscript can be used to write well past
it and into the aforementioned areas. Demo <a
href="https://github.com/zoogie/smilehax-IIe">here.</a></td>
<td>App: 3.6.2 (3.6.0 latest for US/EU, JP appvers. can be
downgraded)</td>
<td>System: <a {{% href "../11.13.0-45" %}}
title="wikilink">11.13.0-45</a>.</td>
<td>April 2020</td>
<td>February 2020</td>
<td>bug publicly documented <a
href="https://translate.google.com/translate?sl=auto&amp;tl=en&amp;u=http%3A%2F%2Fsmilebasic.com%2Fdebug%2Farchive%2F">here.</a>
Exploited by Zoogie</td>
</tr>
<tr class="odd">
<td>The Legend of Zelda: Tri Force Heroes</td>
<td><a {{% href "../3DS_System_Flaws" %}}
title="wikilink">CTRSDK</a> CTPK buffer overflow combined with game's
usage of SpotPass</td>
<td>During the very first screen displayed by the game during
boot("Loading..."), just seconds after title launch, the game loads CTPK
from the <a {{% href "../BOSS_Services" %}} title="wikilink">stored</a> SpotPass
content. Hence, this game could be exploited via the vulnerable CTRSDK
CTPK code <em>if</em> one could get custom SpotPass data into extdata
somehow(ctr-httpwn &gt;=v1.2 with bosshaxx allows this).</p>
<p>The code for this runs from a thread separate from the main-thread,
with the stack in linearmem heap. This SpotPass handling triggers before
the game ever opens the regular savedata archive. The extdata is opened
at some point before this: it opens a file for checking if it exists,
then immediately closes it.</p>
<p>The two SpotPass URLs for this have always(?) returned HTTP 404 as of
November 2016. It appears these were intended for use as textures for
additional costumes(and never got used publicly), but this wasn't
tested.</p>
<p>This is used by <a
href="https://github.com/yellows8/ctpkpwn">ctpkpwn_tfh</a>.</td>
<td>None</td>
<td>App: v2.1.0</td>
<td>November 18, 2016</td>
<td>November 14, 2016</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a></td>
</tr>
<tr class="even">
<td>Pixel Paint</td>
<td>Buffer overflow via unchecked extdata file length</td>
<td>Pixel Paint loads pictures saved by the user from extdatas. The
file is read to a fixed size buffer but the file length remains
unchecked, so with a large enough file, one can overwrite pointers in
memory and gain control of the execution flow.</td>
<td>None</td>
<td>App: Initial version. System: <a {{% href "../11.2.0-35" %}}
title="wikilink">11.2.0-35</a>.</td>
<td>December 27, 2016</td>
<td>November 5, 2016</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a></td>
</tr>
<tr class="odd">
<td>Steel Diver : Sub Wars</td>
<td>Heap overflow / arbitrary memcpy</td>
<td>Savefile datas are stored as key/value pairs, a large enough
string key makes the game overwrite a memcpy source/destination
addresses and size arguments. So one can actually memcpy a rop on the
stack and gain control of the execution flow.</td>
<td>None</td>
<td>System: <a {{% href "../11.2.0-35" %}}
title="wikilink">11.2.0-35</a>.</td>
<td>December 27, 2016</td>
<td>Around July 15, 2016</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a>,
Vegaroxas</td>
</tr>
<tr class="even">
<td>1001 Spikes</td>
<td>Buffer overflow via unchecked array-indexes in XML savefile
parsing</td>
<td>The savefiles are stored as renamed .xml files, which contain
several tags with attributes like 'array-index="array-value"', where
both of these are converted from ASCII strings to integers as
signed-int32, and the array-value given blindly written to an array
inside a structure using the (unchecked) index given. With several of
these attributes, one can overwrite the stack starting from the stored
lr of the function that does this parsing, and write a ROP chain there.
Testing used the "LevelAttempts" tag which is the last such tag parsed
in that function.</td>
<td>None</td>
<td>App: v1.2.0 (TMD v2096)</td>
<td>December 27, 2016</td>
<td>Around November 2, 2016</td>
<td><a {{% href "../User:Riley" "broken" %}} title="wikilink">Riley</a></td>
</tr>
<tr class="odd">
<td>Pokemon Omega Ruby/Alpha Sapphire</td>
<td>Secret base team name heap overflow</td>
<td>When the player wants to edit the team name, it is copied over
the heap, however its length is not verified. So with a large enough
team name one can overwrite some pointers and get two arbitrary jumps
and then get control of the execution flow.</td>
<td>None</td>
<td>App: 1.4. System: <a {{% href "../11.2.0-35" %}}
title="wikilink">11.2.0-35</a>.</td>
<td>December 30, 2016</td>
<td>June, 2016</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a></td>
</tr>
<tr class="even">
<td>Swapdoodle</td>
<td>Heap buffer overflow via unchecked size</td>
<td>The letter file format used by doodlebomb is composed of multiple
chunks. Each chunks is described in the header of the file where the
name, size and CRC of each chunk are stored. Some chunks are meant to be
headers, every header's size should be 0x80, however the length of the
STAHED1 chunk remains unchecked and the game memcpy the chunk to a 0x80
byte buffer with the length provided in the file. This way one is able
to overwrite some pointers and get control of the execution
flow.</td>
<td>App: &gt; v1.1.1</td>
<td>App: v1.1.1</td>
<td>April 24, 2017</td>
<td>February, 2017</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a></td>
</tr>
<tr class="odd">
<td>Pokemon Picross</td>
<td>Arbitrary memcpy via unchecked size</td>
<td>When reading the savefile, the game handles some lists of buffers
that are copied to memory. These buffers should always be 0x14-bytes
long but the game uses the size provided in the savefile to copy them.
These buffers are copied in some structs and thus with a big enough
length value, one can overwrite the next struct which contains a size
and a destination address for a memcpy.</td>
<td>None?</td>
<td>App: ?</td>
<td>May 29, 2017</td>
<td>June, 2016</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a></td>
</tr>
<tr class="even">
<td>RPG Maker Fes/Player</td>
<td>Buffer overflow on .bss section</td>
<td>When loading a project, the game copies multiple chunks over the
BSS section. However the number of chunks to copy is not checked, thus a
large amount of chunk result in a buffer overflow. There's multiple way
to exploit this flaw to gain an arbitrary memcpy or an arbitrary
jump.</td>
<td>None?</td>
<td>App: ?</td>
<td>August 28, 2017</td>
<td>August, 2017</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a></td>
</tr>
<tr class="odd">
<td>RPG Maker Fes/Player</td>
<td>Buffer overflow via unchecked file size</td>
<td>When loading a project, the game loads the file to a 0x200000
bytes long buffer. However the size remains unchecked, so with a big
enough file one can overflow the buffer and overwrite a thread stack and
then achieve ROP.</td>
<td>None?</td>
<td>App: ?</td>
<td>August 29, 2017</td>
<td>August, 2017</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a>, <a
{{% href "../User:_ChampionLeake" "broken" %}} title="wikilink">ChampionLeake</a></td>
</tr>
<tr class="even">
<td>Pokemon Omega Ruby/Alpha Sapphire</td>
<td>PSS data heap/stack overflow</td>
<td>When launching the game, multiple chunks from the save file are
parsed and copied to a large heap buffer. When parsing PSS data
(acquaintances, passerby) the game copies each entry to the heap buffer,
the number of entries to copy is read from the end of the multiple pss
data chunks and is not checked, leading to an overflow. The "PSS data -
friends" chunk is vulnerable too, but the overflow occurs on the stack
and unfortunately this isn't exploitable because of a 4 bytes
uncontrolled value (in each entry) that gets written on sensitive
data.</td>
<td>None</td>
<td>App: 1.4. System: <a {{% href "../11.6.0" "broken" %}}
title="wikilink">11.6.0</a>.</td>
<td>October 1, 2017</td>
<td>June, 2016</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a></td>
</tr>
<tr class="odd">
<td>RPG Maker Fes/Player</td>
<td>OOB write</td>
<td>When handling events in a map, the indices of "buttons" are not
checked. This results in an out of bound bit write, one can thus write a
rop directly on the stack (bit by bit).</td>
<td>None?</td>
<td>App: ?</td>
<td>August 5, 2018</td>
<td></td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a></td>
</tr>
<tr class="even">
<td>Unholy Heights</td>
<td>Buffer overflow via unchecked string size</td>
<td>The game stores some utf-16 messages in the savefile. Right
before the message is the length(u32) for the string, the game uses this
size to memcpy the message from the savefile to the stack without
checking the length. This allows one to overwrite some function
addresses on the stack and form a rop chain.</td>
<td>None</td>
<td>App: Initial Version</td>
<td>September 13, 2018</td>
<td>August, 2018</td>
<td>Kartik</td>
</tr>
<tr class="odd">
<td>Mononoke Forest</td>
<td>String Buffer Overflow via unchecked string length</td>
<td>The game stores plaintext profile names in the savefile. The
profile names are strcpy/memcpy to different areas of the game's
functions in the stack. Using a large extensive profile name, a user can
overwrite some stack-registers and point to stack buffer addresses to
eventually gain control of the stack to lead and form a
rop-chain.</td>
<td>None</td>
<td>App: v1.0.0</td>
<td>August 14, 2019</td>
<td>February 8, 2019</td>
<td><a {{% href "../User:_ChampionLeake" "broken" %}} title="wikilink">ChampionLeake</a>
and <a {{% href "../User:_Kartik" "broken" %}} title="wikilink">Kartik</a></td>
</tr>
<tr class="even">
<td>Picross 3D: Round 2</td>
<td>Out of bounds array access allowing to point to fabricated
objects and vtable</td>
<td>Game only checks save header. With the last interacted save slot
index at +0xb270 in the save data unchecked we can achieve a predictable
out of bounds access, as well inserting ROP data without detecting save
corruption. Game references an object from an array of 3 elements and
passes it to a function that will read object pointers and hit a vtable
call. With a copy save data left in memory and a properly calculated
index, we can point to a fake object position in the save, vtable jump
to a stack pivot and start the ROP chain.</td>
<td>None</td>
<td>App: Initial version</td>
<td>September 10, 2020</td>
<td>August 24, 2020</td>
<td><a {{% href "../User:_Luigoalma" "broken" %}} title="wikilink">Luigoalma</a> and <a
{{% href "../User:_Kartik" "broken" %}} title="wikilink">Kartik</a></td>
</tr>
<tr class="odd">
<td>Me and My Pets 3D</td>
<td>String buffer overflow</td>
<td>The game stores some strings in the savegame. Using a large
enough string, once can overwrite addresses on the stack and form a
ropchain.</td>
<td>None</td>
<td>App: Initial Version</td>
<td>June 24, 2022</td>
<td>June 12, 2022</td>
<td><a {{% href "../User:_Kartik" "broken" %}} title="wikilink">Kartik</a></td>
</tr>
<tr class="even">
<td>trl CGB emulator (GBC Virtual Console)</td>
<td>HDMA heap buffer overflow</td>
<td>trl's CGB emulation implements normal mode HDMA by a straight
memcpy, failing to correctly bounds check the provided pointers/length.
(hblank mode HDMA does perform proper bounds checks after each 0x10 byte
memcpy) In addition, each area of memory (ROM, SRAM, VRAM, WRAM, SRAM,
OAM, MMIO+HRAM) are allocated seperately, from the CTR-SDK heap.</p>
<p>Thus, doing HDMA to an area past the end of VRAM (VRAM bank 1 must be
set here) would cause heap overflow. The maximum possible memcpy here
would be 0x800 bytes to the end of VRAM less 0x10 bytes.</p>
<p>This is hard to exploit. The heap buffers get freed when choosing to
close the game from the Home Menu, with the Home Menu holding the GPU.
It may be possible to make calls to APT in ROP in this state to get Home
Menu to release the GPU.</p>
<p>To exploit this, SM83 code execution inside the emulator would need
to be obtained. This could be done by human-viable or remote (emulated
link-cable) code execution exploits (for example Pokémon Yellow
(non-JP)/Gold/Silver/Crystal); by crafting SRAM (where the game itself
has a savegame exploit); or by crafting an emulator save-state (for
games where save-states are enabled).</p>
<p>DMG (mono Game Boy) games are not exploitable; the bug is in
CGB-specific functionality which is disabled in mono Game Boy games
(determined by ROM header).</td>
<td>None</td>
<td>trl as included in Pokémon Crystal VC</td>
<td>January 2024</td>
<td>~2017</td>
<td><a {{% href "../User:Riley" "broken" %}} title="wikilink">Riley</a></td>
</tr>
</tbody>
</table>

## Flipnote Studio 3D

| Summary                    | Description                                                                                                                                                                                                                                                                                                                                                                                                                                           | Fixed in app/system version | Timeframe info related to this was added to wiki | Flaw discovered by                  |
|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------|--------------------------------------------------|-------------------------------------|
| KFH frame count overflow   | The KFH frame count field should not be \>= 0x3E8, but it wasn't checked and so uncontrolled data were written over pointers, causing an unexploitable crash.                                                                                                                                                                                                                                                                                         | System: 11.6                | September 20, 2017                               | [MrNbaYoh](User:Nba_Yoh "wikilink") |
| KMI paper color overflow   | Paper color field (and similar color fields) in KMI chunks was not checked, a too high value caused a jump to an uncontrolled location.                                                                                                                                                                                                                                                                                                               | System: 11.6                | September 20, 2017                               | [MrNbaYoh](User:Nba_Yoh "wikilink") |
| KSN BGM data size overflow | The size of the BGM data in the KSN chunk was not checked, it was used in a memcpy so with a big enough size one could overwrite a thread stack on linear mem and achieve ROP (notehax v1).                                                                                                                                                                                                                                                           | System: 11.6                | September 20, 2017                               | [MrNbaYoh](User:Nba_Yoh "wikilink") |
| KMC chunk unchecked        | The KMC chunk was not verified at all, the CRC32 and the size were not checked. A big enough size caused an integer overflow and made the game read the file backward.                                                                                                                                                                                                                                                                                | System: 11.6                | September 20, 2017                               | [MrNbaYoh](User:Nba_Yoh "wikilink") |
| KMI layer size unchecked   | The 3 layer size fields in KMI chunks were not checked, leading to some crashes in the editor.                                                                                                                                                                                                                                                                                                                                                        | System: 11.6                | September 20, 2017                               | [MrNbaYoh](User:Nba_Yoh "wikilink") |
| Bad "queue" implementation | When a KWZ was parsed, frames were copied in a kind of queue, bounds were not checked obviously, so with the KMI layer size flaw one was able to fill completely the queue, then write past the buffer and overwrite a heap chunk header (notehax v2). This is not possible anymore, the queue cannot be filled because layer sizes are checked. Moreover each time an element is removed from the queue, the whole content is memmoved \*facepalm\*. | System: 11.6                | September 20, 2017                               | [MrNbaYoh](User:Nba_Yoh "wikilink") |

## Useless crashes / applications which were fuzzed

- Pushmo (3DSWare), QR codes: level name is properly limited to 16
  characters, game doesn't crash with a longer name. The only possible
  crashes are triggered by out-of-bounds array index values, these
  crashes are not exploitable due to the index value being 8bit.

<!-- -->

- [Pyramids (3DSWare)](Pyramids_(3DSWare) "wikilink"), QR codes: no
  strings. Only crashes are from out-of-bounds values (like background
  ID) and are not exploitable.

<!-- -->

- [Pyramids 2 (3DSWare)](Pyramids_2_(3DSWare) "wikilink"), QR codes: no
  strings. Only crashes are from out-of-bounds values (like background
  ID) and are not exploitable.

<!-- -->

- [The Legend of Zelda: Majora's Mask
  3D](https://github.com/yellows8/mm3d_re)

<!-- -->

- "The Legend of Zelda: A Link Between Worlds" and "The Legend of Zelda:
  Tri Force Heroes": these games don't crash at all when the entire
  save-file(minus constant header data) is overwritten with /dev/random
  output / 0xFF-bytes. All of the CRC32s were updated for this of
  course. Note that this refers to the regular save file: Tri Force
  Heroes can be exploited via BOSS extdata - see above.

<!-- -->

- Pokemon Mystery Dungeon: Gates to Infinity has the same unchecked file
  bounds as Pokemon Super Mystery Dungeon, however since save
  compression was introduced in Pokemon Super Mystery Dungeon, it only
  allocates one buffer within the application heap instead of several
  within the linear heap, resulting in nothing to corrupt or overwrite
  even if the file's length is extended past its allocation.

<!-- -->

- "Kid Icarus: Uprising": Overwriting the entire savedata results in
  various crashes, nothing useful.

<!-- -->

- Savedata/extdata for "Super Smash Bros 3DS": Overwriting the various
  files stored under savedata/extdata results in useless crashes.

<!-- -->

- "StarFox 64 3D": Doesn't crash at all with the entire savedata
  overwritten.

<!-- -->

- "Frogger 3D": Overwriting a savefile with random-data results in
  \*nothing\* crashing.

<!-- -->

- "Mutant Mudds": Overwriting the savefile with random data results in a
  crash

<!-- -->

- "Worcle Worlds": Overwriting the savefile with 0xFF results in a crash
  due to an out of bound read

<!-- -->

- "Animal Crossing: New Leaf": Creating a QR code from random data
  results in a valid QR code and a random design. In some very rare
  cases(which aren't always reproducible?) a crash/etc may occur, but
  this isn't known to be useful.

<!-- -->

- "Angry Birds Star Wars": Strings in the savefile are preceded by their
  lengths. These strings are never stored on the stack and are memcpy'd
  into heap memory. If the size is invalid the alloc will fail and thus
  the memcpy will operate on a nullptr resulting in a useless data
  abort.

<!-- -->

- "Gem Smashers": Overwriting the savefile with random bytes results in
  useless crashes.

<!-- -->

- "Luxor:" Strings/plaintext in the savefile are present and these's no
  checks. Overwriting the whole save (excluding the header), with
  /dev/random cause a useless crash.

<!-- -->

- "Luv Me Buddies Wonderland:" Doesn't crash at all with the entire
  savedata overwritten. Overwriting some areas, points to useless nulls

## Crashes needing investigation

- Disney Infinity crashes when all savedata overwritten with
  /dev/urandom. No checksums. 0xFF bytes don't cause a crash.

<!-- -->

- Football Up Online / Soccer Up Online and Football Up 3D / Soccer Up
  3D crash when teamname(UTF-16) length = 0x48 AND 0x20 null bytes are
  removed after just the name or if teamname length is way longer than
  0x48.

# System applications

<table>
<thead>
<tr class="header">
<th>Summary</th>
<th>Description</th>
<th>Fixed in version</th>
<th>Last version this flaw was checked for</th>
<th>Timeframe this was discovered</th>
<th>Discovered by</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>3DS <a {{% href "../System_Settings" %}} title="wikilink">System
Settings</a> DS profile string stack-smash</td>
<td>Too long or corrupted strings (01Ah 2 Nickname length in
characters 050h 2 Message length in characters) in the NVRAM DS user
settings (System Settings-&gt;Other Settings-&gt;Profile-&gt;Nintendo DS
Profile) cause it to crash in 3DS-mode due to a stack-smash. The DSi is
not vulnerable to this, DSi launcher(menu) and DSi System Settings will
reset the NVRAM user-settings if the length field values are too
long(same result as when the CRCs are invalid). TWL_FIRM also resets the
NVRAM user-settings when the string-length(s) are too long.</td>
<td><a {{% href "../7.0.0-13" %}} title="wikilink">7.0.0-13</a></td>
<td><a {{% href "../7.0.0-13" %}} title="wikilink">7.0.0-13</a></td>
<td>2012</td>
<td><a {{% href "../User:Ichfly" "broken" %}} title="wikilink">Ichfly</a></td>
</tr>
<tr class="even">
<td>3DS <a {{% href "../System_Settings" %}} title="wikilink">System
Settings</a> stack smash via title strings in <a {{% href "../DSiWare_Exports" %}}
title="wikilink">DSiWare_Exports</a></td>
<td>DSiWare export banners contain 16 consecutive 0x100 byte, utf-16
game title strings for different languages. Nintendo correctly limits
the string's max length by placing a NULL at str[127] before it's copied
to the stack. However, they didn't allocate enough space for all 128
wchars (char/wchar type confusion?), so an attacker can craft a valid
full-length string that will crash the stack at about str+0xEC. ROP
execution can then be obtained from this crash in DSiWare Data
Management as demonstrated <a
href="https://github.com/zoogie/Bannerbomb3">here</a>.</p>
<p>Interesting note: A line feed wchar (00 0A) at any point in the
string before the crash offset will prevent the crash from
occurring.</td>
<td><a {{% href "../11.17.0-50" %}} title="wikilink">11.17.0-50</a></td>
<td><a {{% href "../11.13.0-45" %}} title="wikilink">11.13.0-45</a></td>
<td>Dec. 2018</td>
<td>Zoogie</td>
</tr>
<tr class="odd">
<td>3DS SAFE_MODE <a
{{% href "../System_Settings" %}}>System
Updater</a> stack smash from proxy-url string</td>
<td>During <a {{% href "../Recovery_Mode" %}} title="wikilink">Recovery Mode</a>
and after all 3 wifi slots fail to find an access point for sysupdate, a
user is permitted to access the wifi settings mode to make changes.
Here, if the proxy-url field string's NULL terminator had been altered
beforehand, a stack smash can occur when the user selects Proxy Settings
-&gt; Detailed Setup and the corrupted url string is displayed.</p>
<p>This is a difficult crash to control because the url string is
converted from ascii to utf-16 between the slot and stack, effectively
reducing the available gadgets to 0.4% of the normal amount. It's
possible to improvise an "escape" using an eoreq pc w/shift gadget to
combine registers and form a jump that can access 1/2 of all available
gadgets.</p>
<p>Because this exploit runs *under* SAFE_MODE, it's possible to run
safehax with one's choice of k11 and arm9 hax. Prerequisite: a userland
exploit with cfg:s/i access to modify the wifi slot. A demonstration can
be viewed <a
href="https://github.com/zoogie/unSAFE_MODE">here</a>.</td>
<td>None</td>
<td><a {{% href "../11.13.0-45" %}} title="wikilink">11.13.0-45</a></td>
<td>Jan. 2020</td>
<td>Zoogie</td>
</tr>
<tr class="even">
<td><a {{% href "../Nintendo_3DS_Sound" %}} title="wikilink">Nintendo 3DS
Sound</a></td>
<td>When a .m4a is loaded, the song name is copied to a 256 byte
buffer. When the song name begins with a Unicode BOM marker, it memcpy's
the tag using the user-provided length. This gives an arbitrary write
which can be used to achieve ROP.</td>
<td><a {{% href "../11.4.0-37" %}} title="wikilink">11.4.0-37</a></td>
<td><a {{% href "../11.4.0-37" %}} title="wikilink">11.4.0-37</a></td>
<td>June/July 2016</td>
<td><a {{% href "../User:nedwill" "broken" %}} title="wikilink">nedwill</a></td>
</tr>
<tr class="odd">
<td><a {{% href "../EShop" %}} title="wikilink">EShop</a></td>
<td>When creating an audio decoder object for the moflex movie
player, if the audio codec is PCM16, the application uses an
uninitialized value as a pointer. One can spray the heap to get control
of that pointer and achieve ROP.</td>
<td>None</td>
<td><a {{% href "../11.14.0-46" %}} title="wikilink">11.14.0-46</a></td>
<td>2020</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a></td>
</tr>
</tbody>
</table>

# System applets

<table>
<thead>
<tr class="header">
<th>Summary</th>
<th>Description</th>
<th>Fixed in version</th>
<th>Last version this flaw was checked for</th>
<th>Introduced with version</th>
<th>Timeframe info related to this was added to wiki</th>
<th>Timeframe this was discovered</th>
<th>Discovered by</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>Webkit/web-browser bugs</td>
<td>spider has had at least three different code-execution exploits.
Majority of them are use-after-free issues. See also <a
{{% href "../Browserhax" %}} title="wikilink">here</a>.</td>
<td></td>
<td></td>
<td></td>
<td>2013?</td>
<td></td>
<td>A lot of people.</td>
</tr>
<tr class="even">
<td>Old3DS/New3DS <a {{% href "../Internet_Browser" %}}
title="wikilink">Browser-version-check</a> bypass</td>
<td>When the browser-version-check code runs where the savedata for
it was never initialized(such as when the user used the "Initialize
savedata" option), it will use base_timestamp=0 instead of the timestamp
loaded from savedata. This is then used with "if(cur_timestamp -
base_timestamp &gt;= &lt;24h timestamp&gt;){Run browser-version-check
HTTPS request code}". Hence, if the savedata was just initialized, and
if the system datetime is set to before January 2, 2000, the
browser-version-check will be skipped. This includes January 1, 2000,
00:00, because that's the epoch(timestamp value 0x0) used with this
timestamp.</p>
<p>See <a href="http://yls8.mtheall.com/3dsbrowserhax.php">here</a> for
bypass usage instructions.</p>
<p>This was fixed with <a {{% href "../10.7.0-32" %}}
title="wikilink">10.7.0-32</a>, see <a {{% href "../Internet_Browser" %}}
title="wikilink">here</a> for details.</td>
<td><a {{% href "../10.7.0-32" %}} title="wikilink">10.7.0-32</a></td>
<td></td>
<td><a {{% href "../9.9.0-26" %}} title="wikilink">9.9.0-26</a></td>
<td>February 25, 2016</td>
<td>November 2, 2015 (Exactly one week after the browser version
pages were initially updated server-side)</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a></td>
</tr>
<tr class="odd">
<td>Skater - Bookmark OOB write</td>
<td>Each bookmark has an id that should not exceed 0x63 (99), however
ids are not checked, this results in an OOB write on the stack, but only
the value 0x01 can be written.</td>
<td></td>
<td><a {{% href "../11.6.0-39" %}} title="wikilink">11.6.0-39</a></td>
<td></td>
<td>May 21, 2018</td>
<td>May 20, 2018</td>
<td><a {{% href "../User:Nba_Yoh" "broken" %}} title="wikilink">MrNbaYoh</a></td>
</tr>
<tr class="even">
<td>MicroSD Management - malformed security blob causes stack buffer
overflow (mhax)</td>
<td>The MicroSD Management application's parsing of Windows NTLM
security blobs in the SMB/CIFS protocol doesn't verify that the client's
specified NT domain name is less than 32 UTF-16 characters. When it's
longer, a stack buffer overrun occurs, leading to a ROP chain and
complete control of the mcopy application.</p>
<p>The malformed security blob can be sent by an attacker within the
SMB_COM_SESSION_SETUP_ANDX (0x73) packet.</td>
<td><a {{% href "../11.8.0-41" %}} title="wikilink">11.8.0-41</a></td>
<td><a {{% href "../11.8.0-41" %}} title="wikilink">11.8.0-41</a></td>
<td><a {{% href "../9.0.0-20" %}} title="wikilink">9.0.0-20</a></td>
<td>August 12, 2018</td>
<td>2018</td>
<td>smea</td>
</tr>
</tbody>
</table>

## Home Menu

<table>
<thead>
<tr class="header">
<th>Summary</th>
<th>Description</th>
<th>Fixed in version</th>
<th>Last version this flaw was checked for</th>
<th>Introduced with version</th>
<th>Timeframe info related to this was added to wiki</th>
<th>Timeframe this was discovered</th>
<th>Discovered by</th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td>u8 brightness setting OOB index (menuhax67)</td>
<td>Config block 0x50001, which contains a u8 brightness setting that
indexes a table of u32 addresses, can be set to an out-of-bounds index
(it's normally 1-5). Located within cfg block 0x50009, there exists a
single controllable u32 that's located within the u8's range. With these
set properly, one can eventually redirect a function pointer to an
address of their choice. This is triggered after the Home Menu quick
launch tab is activated. POC <a
href="https://github.com/zoogie/menuhax67">here</a>.</td>
<td>None</td>
<td><a {{% href "../11.13.0-45" %}} title="wikilink">11.13.0-45</a></td>
<td></td>
<td>October 4, 2020</td>
<td>September, 2020</td>
<td>Zoogie</td>
</tr>
<tr class="even">
<td>bossbannerhax</td>
<td>After successfully loading <a {{% href "../Extended_Banner" %}}
title="wikilink">extended-banner</a> data(done when selecting an icon),
Home Menu attempts to load "<a {{% href "../CBMD" %}} title="wikilink">CBMD</a>"
data into a 0x100000-byte heap buffer from the <a {{% href "../BOSS_Services" %}}
title="wikilink">stored</a> SpotPass content. When successful and the
magic-number is CBMD, Home Menu then decompresses the exbanner sections
into another fixed-size heap buffer, without checking the outsize at
all. The main CBMD CGFX code with ExeFS checks the size, but this code
doesn't(however this is exbanner "CBMD", not a "normal" CBMD).</p>
<p>Used with menuhax as of v3.2.</td>
<td><a {{% href "../11.3.0-36" %}} title="wikilink">11.3.0-X</a></td>
<td></td>
<td><a {{% href "../1.0.0-0" %}} title="wikilink">1.0.0-0</a></td>
<td>November 18, 2016</td>
<td>December 23, 2014</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a></td>
</tr>
<tr class="odd">
<td>sdiconhax</td>
<td>This is basically the same as nandiconhax, the vulnerable SD/NAND
functions are <em>identical</em> minus the file-buffer offsets.
Exploitation is different due to different heap-buffer location though.
Unlike nandiconhax, the icon buffer for SD is located in linearmem(with
recent Home Menu versions at least). This is used by <a {{% href "../Menuhax" %}}
title="wikilink">menuhax</a>.</td>
<td><a {{% href "../11.1.0-34" %}} title="wikilink">11.1.0-X</a></td>
<td></td>
<td><a {{% href "../4.0.0-7" %}} title="wikilink">4.0.0-X</a></td>
<td>July 27, 2016</td>
<td>October 23, 2015</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a></td>
</tr>
<tr class="even">
<td><a {{% href "../System_SaveData" %}} title="wikilink">NAND-savedata</a>
Launcher.dat icons (nandiconhax)</td>
<td>The homemenu code processing the titleid list @ launcherdat+8
copies those titleIDs to another buffer, where the offset relative to
that buffer is calculated using the corresponding s8/s16 entries. Those
two values are not range checked at all. Hence, one can use this to
write u64(s) with arbitrary values to before/after this allocated output
buffer. See <a {{% href "../Home_Menu" %}} title="wikilink">here</a> regarding
Launcher.dat structure.</p>
<p>This can be exploited(with Launcher.dat loading at startup at least)
by using a s16 for the icon entry with value 0xFFEC(-20)(and perhaps
more icons with similar s16 values to write multiple u64s). The result
is that the u64 value is written to outbuf-0xA0, which overwrites
object+0(vtable) and object+4(doesn't matter here) for an object that
gets used a bit after the vulnerable function triggers. The low 32bits
of the u64 can then be set to the address of controlled memory(either
outbuf in regular heap or the entire launcherdat buffer in linearmem),
for use as a fake vtable in order to get control of PC. From there one
can begin ROP via vtable funcptrs to do a stack-pivot(r4=objectaddr at
the time the above object gets used).</p>
<p>Originally this vuln could only be triggered via Launcher.dat at Home
Menu startup, right after Launcher.dat gets loaded + memory gets
allocated, once the file-format version code is finished running.
Starting with v9.6 this can be triggered when loading layouts from SD
extdata as well. The vuln itself triggers before the layout data is
written to Launcher.dat, but it doesn't seem to be possible to overwrite
anything which actually gets used before the function which writes
Launcher.dat into the layout gets called.</p>
<p>Home Menu has some sort of fail-safe system(or at least on v9.7) when
Home Menu crashes due to Launcher.dat(this also applies for other things
with Home Menu): after crashing once, Home Menu resets Launcher.dat to a
state where it no longer crashes anymore. However, note that any
exploits using this which hang/etc without crashing will still brick the
system. <strong>Hence, attempting anything with this on physnand without
hw-nand-access isn't really recommended.</strong></td>
<td><a {{% href "../11.1.0-34" %}} title="wikilink">11.1.0-X</a></td>
<td></td>
<td><a {{% href "../4.0.0-7" %}} title="wikilink">4.0.0-X</a></td>
<td></td>
<td>May 14, 2015</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a></td>
</tr>
<tr class="odd">
<td>Theme-data decompression buffer overflow (<a {{% href "../Menuhax" %}}
title="wikilink">themehax</a>)</td>
<td>The only func-call size parameter used by the theme decompression
function is one for the compressed size, none for the decompressed size.
The decompressed-size value from the LZ header is used by this function
to check when to stop decompressing, but this function itself has
nothing to verify the decompressed_size with. The code calling this
function does not check or even use the decompressed size from the
header either.</p>
<p>This function is separate from the rest of the Home Menu code: the
function used for decompressing themes is *only* used for decompressing
themes, nothing else. There's a separate decompression function in Home
Menu used for decompressing everything else.</p>
<p>That other decompression function in Home Menu handles decompression
size properly(decompressed size check for max buffer size is done by
code calling the other function, not in the function itself). Unlike the
other function, the theme function supports multiple LZ algorithms, but
the one which actually gets used in official themes is the same one
supported by the other function anyway.</p>
<p>See also <a {{% href "../Menuhax" %}} title="wikilink">here</a>.</p>
<p>With <a {{% href "../10.2.0-28" %}} title="wikilink">10.2.0-X</a> Home Menu, the
only code change was that the following was added right after theme-load
and before actual decompression:
"if(<get_lzheader_decompressed_size>(compressed_buf) &gt;
0x150000)<exit>;". This fixed the vuln.</td>
<td><a {{% href "../10.2.0-28" %}} title="wikilink">10.2.0-X</a></td>
<td><a {{% href "../10.2.0-28" %}} title="wikilink">10.2.0-X</a></td>
<td><Old3DS/New3DS version which added initial theme support></td>
<td></td>
<td>December 22, 2014</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a>, <a
{{% href "../User:Myria" "broken" %}} title="wikilink">Myria</a> independently (~spring
2015)</td>
</tr>
<tr class="even">
<td>Shuffle body-data buffer overflow (<a {{% href "../Menuhax" %}}
title="wikilink">shufflehax</a>)</td>
<td>See <a {{% href "../Menuhax" %}} title="wikilink">here</a>.</td>
<td><a {{% href "../10.6.0-31" %}} title="wikilink">10.6.0-X</a></td>
<td><a {{% href "../10.6.0-31" %}} title="wikilink">10.6.0-X</a></td>
<td><a {{% href "../9.3.0-21" %}} title="wikilink">9.3.0-X</a></td>
<td></td>
<td>January 3, 2015</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a></td>
</tr>
<tr class="odd">
<td>Extdata file-data loading buffer overflow</td>
<td>The extdata file-reading code allocates a fixed-size heap buffer
for the expected filesize, then reads the filedata into this buffer
using the actual FS filesize. Before v5.0 the filesize used here wasn't
validated, hence if the filesize is larger than alloc_size a buffer
overflow would occur. <em>After</em> doing the file-read it does
validate that the actual_readsize matches the alloc_size, but at this
point the buffer overflow has already occurred.</p>
<p>This affected at least the following: SaveData.dat and Cache.dat.</p>
<p>This can be triggered with SaveData.dat by installing a &lt;v4.0 Home
Menu version, with Home Menu extdata from &gt;=v4.0 still on SD. When
this is done with v2.0 Home Menu, a kernelpanic occurs when processing
an AM command(it appears a buffer ptr which is then passed to a command
was overwritten with 0x0 - of course other SaveData.dat filesizes may
result in different behaviour).</td>
<td><a {{% href "../5.0.0-11" %}} title="wikilink">5.0.0-X</a></td>
<td></td>
<td><a {{% href "../2.0.0-2" "broken" %}} title="wikilink">2.0.0-X</a></td>
<td>June 9, 2016</td>
<td>June 9, 2016</td>
<td><a {{% href "../User:Yellows8" "broken" %}} title="wikilink">Yellows8</a></td>
</tr>
</tbody>
</table>

The icon data arrays used with {sd/nand}iconhax were added to
SaveData.dat/Launcher.dat with [4.0.0-X](4.0.0-7 "wikilink"), hence the
vulnerable functions were added with that same version.

With \<=v4.0 the SaveData.dat buffer is located in the regular heap.
It's unknown when exactly it was moved to linearmem, which is where it's
located with recent versions. It's located in linearmem for KOR \>=v9.6
for example.

The SaveData.dat/Launcher.dat icon vulns were fixed by doing various
unsigned \>=60/\>=360 checks on the loaded values. When these checks
fail, it just skips over handling this icon entry. Hence, the original
value can't be negative / out-of-bounds any more.

## Useless crashes

Old3DS system web-browser:

- 2^32 characters long string(*finally* fixed with v10.6): this is
  similar to the vulnerability fixed
  [here](http://git.chromium.org/gitweb/?p=external/Webkit.git;a=commitdiff;h=ec471f16fbd1f879cb631f9b022fd16acd75f4d4),
  concat-large-strings-crash2.html triggers a crash which is about the
  same as the one triggered by a 2^32 string. Most of the time this
  vulnerability will cause a memory page permissions fault, since the
  WebKit code attempts to copy the string text data to the output buffer
  located in read-only [CRO](CRO0 "wikilink") heap memory. The only
  difference between a crash triggered by a 2^32 string and the
  concat-large-strings-crash2.html crash is at the former copies the
  string data using the original string length(like 1 text character for
  "x", 4 for "xxxx") while the latter attempts to copy \>12MB. In some
  *very* rare cases a thread separate from the string data-copy thread
  will crash, this might be exploitable. However, this is mostly useless
  since it rarely crashes this way.

<!-- -->

- Trying to directly load a page via the browser "URL" option with
  [webkitdebug](https://github.com/yellows8/3ds_browserhax_common)
  setup, causes a crash to trigger in oss.cro due to an use-after-free
  being caught with webkitdebug. This is presumably some sort of
  realloc() issue in the libcurl version used by the \<={v10.2-v10.3}
  browser. This happens with \*every\* \*single\* \*page\* one tries to
  load via the "URL" option, but not when loading links on the current
  page, hence this is probably useless. A different use-after-free with
  realloc triggers with loading any page at all regardless of method
  too(libcurl probably).

<!-- -->

- This WebKit build has *a lot* of crash-trigger bugs that only happen
  with [webkitdebug](https://github.com/yellows8/3ds_browserhax_common)
  completely setup(addr accesses near 0x0), with *just* trying to load
  any page at all.
