This could be confused for the augmented reality cards. I think they are
called cartridges.--[T3a](User:T3a "wikilink") 18:08, 8 April 2011
(CEST)

^ should at least be a redirect ( "Game Cartridges, Game Cart Hardware,
Game Carts" )

- 90 00 00 00 00 00 00 00 ... =\> 45F80090 for SSFIV, C2FF0090 on
  Rayman3d.
- Is it just me or do these byte orders keep changing. 9000000000000000
  corresponds with "C2FE0090" not "9000FEC2".
- *"header command has some initial dummy bytes, and eventually responds
  with a 0x200 byte header."*. Dummy bytes, Where? The redundant A500
  cmds? --[Jl12](User:Jl12 "wikilink")


You need to endian swap the data. 9000xxxx is the correct form. The
upper bits specify information about the intended platform for the
gamecard, and the lower bits specify the media size of the card.

There are dummy bytes in the response for each 16-byte command. In the
wiki these dummy bytes have already been stripped.
--[Neimod](User:Neimod "wikilink") 17:41, 3 June 2011 (CEST)

Could you post the size of the original header reply with the dummy
bytes. I'm trying to inject logic ( send raw commands ) with a 3DS card.
It works well up to the 3E 00 00 00 00 00 00 00 command, I get 'data'
returned from the header packet as well but only 00 bytes.
--[Jl12](User:Jl12 "wikilink")


The size depends on what speed you are clocking out. Just keep reading
until you get something that is non-zero. Also, what device are you
using for reading out the data? --[Neimod](User:Neimod "wikilink")
09:09, 4 June 2011 (CEST)

<http://pastebin.com/y22zZcZN> - That's for 'Street Fighter IV 3D'.
There's an NCCH header and cartridge ID. The same method returned x00
00... with a different cart, though. Not sure why there's a difference.
I actually have it hooked up to a laptop, where a device over USB reads
the pins and the 3DS cart is connected to it there. ( ie. the laptop
acts as the 3DS. )

<http://pastebin.com/38QxNGqn> - That's the cart that was returning an
empty header. ( "rayman 3D" ). Seems to work, now.

How did you actually decrypt the encrypted commands,
Neimod?--[Lazymarek9614](User:Lazymarek9614 "wikilink") 21:06, 1
November 2011 (CET)


Sorry, it is a little too soon to reveal that.
--[Neimod](User:Neimod "wikilink") 02:00, 2 November 2011 (CET)


I think the 3dbrew members are one team, why do you want to hide
it?--[Lazymarek9614](User:Lazymarek9614 "wikilink") 21:23, 2 November
2011 (CET)

<!-- -->



I see the two sides of the problem here Neimod and Lazymarek9614. This
forum like many public homebrew forum,s are there to try to find a way
to load Homebrew. Letting everyone know your progress on what you are
doing lets people understand how the scene is performing and people who
have the knowhow can possibly help. But the downside to this is if
Nintendo gets the drift on what you trying to do, they have the
advantage, they know how the 3DS better than anyone, so releasing data
on some exploits and WIP could lead to Nintendo patching it before it is
finalised. Thats the decision the homebrew devs have to make.

It would cause more harm than good at this point. Showing that progress
is being made keeps the community active, but public understanding of
the encryption of the gamecard protocol is not vital for the pursuit of
homebrew. It would only advance the pursuit of piracy.
--[Neimod](User:Neimod "wikilink") 02:47, 3 November 2011 (CET)

- Responsible disclosure. Try not to devalue the 3DS. Nintendo
  succeeding is also in our best interest, longevity/software wise.
- Don't bolt doors shut before you open them for yourselves. Remember N
  can patch or change or obfuscate anything posted here.

<!-- -->

- Despite what I said. lol. If you can disclose the method without any
  specific technical information that would be nice. Privately if
  necessary.

<!-- -->

- About the discussion further up on this page, I was able to inject
  logic. With a laptop and hcs microcontroller. ( microcontroller -\>
  usb -\> CTR cartridge ). I can obviously only get as far as what I can
  do without encryption, as I don't know how to encrypt or decrypt for
  now. [Jl12](User:Jl12 "wikilink")

## Protocol encryption

The protocol encryption is RC4 seeded by SNOW 2.0, not AES CTR. The main
page is uneditable due to it thinking there is emails in the page.
[Turdsucker](User:Turdsucker "wikilink")
([talk](User_talk:Turdsucker "wikilink")) 01:45, 12 January 2021 (CET)

<https://i.imgur.com/1tYQgdK.png>
[Turdsucker](User:Turdsucker "wikilink")
([talk](User_talk:Turdsucker "wikilink")) 08:14, 6 March 2021 (CET)