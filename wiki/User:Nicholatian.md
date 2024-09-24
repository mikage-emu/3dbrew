<table style="width:10%;">
<colgroup>
<col style="width: 10%" />
</colgroup>
<thead>
<tr class="header">
<th width="100%"><p>Alexander Nicholi</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td width="100%"><figure>
<img src="Nicholatian.png" title="Nicholatian.png" width="280" />
<figcaption>Nicholatian.png</figcaption>
</figure></td>
</tr>
<tr class="even">
<td width="33.3%"
style="text-align:right"><p><strong>Gender</strong></p></td>
</tr>
<tr class="odd">
<td width="33.3%"
style="text-align:right"><p><strong>Age</strong></p></td>
</tr>
<tr class="even">
<td width="33.3%"
style="text-align:right"><p><strong>Location</strong></p></td>
</tr>
<tr class="odd">
<td width="33.3%"
style="text-align:right"><p><strong>Title</strong></p></td>
</tr>
</tbody>
</table>

I am a software developer and homebrew enthusiast; on the wiki I usually
like to do aesthetic cleanup of articles. I am getting my first 3DS very
soon, however I have spent years learning about assembly, ROM hacking,
and homebrew dev on the *Game Boy Advance.*

## Projects

Here are some summaries of the homebrew/hacking-related projects I am
either currently working on or have worked on in the past.

### Pokémon Citrite

A ROM hack of Pokémon Emerald that I started in 2014 on the *Game Boy
Advance.* It evolved alongside my knowledge of ROM hacking and grew with
how much I learned about the GBA and Game Freak's engine. Over time I
learned many fundamental skills, including how to:

- Write ARMv4 Thumb assembly
- Reverse engineer code in IDA Pro
- Effectively manipulate the GBA's hardware
- Hack in C code into the existing Emerald binary
- Automate ROM hacking into a single "build step" using Make

Development of Pokémon Citrite gradually came to a halt however, as it
dawned on me that my game would never see popular fruition, mainly
because I was permanently banned from the PokéCommunity (a forum with
the largest Pokémon ROM hacking scene) unjustly. After departing from
the ROM hacking development scene I decided to get involved with
homebrew on the GBA, and write my own game engine for it in C++; this
allowed the essence of Citrite to live on, but without any connection to
Pokémon so I could retain copyrights (See:
[Trinity](#Trinity "wikilink")).

### Trinity

An independent continuation of [Pokémon
Citrite](#Pokémon_Citrite "wikilink") written in C++ for the GBA. Source
code will be based on the fruits of [libGBAmm](#libGBAmm "wikilink") and
[Saturn](#Saturn "wikilink") once those projects are ready for use.

### libGBAmm

An object-oriented rewrite of the libGBA provided by
<span class="plainlinks">[devkitPro](https://github.com/devkitPro/libgba)</span>,
currently <span class="plainlinks">[available on
GitHub](https://github.com/nicholatian/libgbamm)</span> as a
work-in-progress.

### Saturn

A generic framework that builds on [libGBAmm](#libGBAmm "wikilink"),
comprising a template project that can be used to jump-start other
projects on the GBA. Will be written in C++, like libGBAmm, and will
include:

- Classes and functions that make working with graphics more human
- A frame-based asynchronous task system
- A mainloop complete with a modifiable set of purposed callbacks
- A console interface that switches between input and output upon Select
- More abstractions for key input, sound, and link cable networking

### libcthulhu

No details yet, but stay tuned. `:)`