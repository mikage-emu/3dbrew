+++
title = 'External Registers'
categories = ["GPU"]
+++

This page describes the address range accessible from the ARM11, used to
configure the basic GPU functionality. For information about the
internal registers used for 3D rendering, see [GPU/Internal
Registers](GPU/Internal_Registers "wikilink").

## Map

Address mappings for the external registers. GSPGPU:WriteHWRegs takes
these addresses relative to 0x1EB00000.

| User VA                                                                                                                                                                                                                                                                                           | PA         | Length | Name                                                                              | Comments                                                                        |
|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|------------|--------|-----------------------------------------------------------------------------------|---------------------------------------------------------------------------------|
| 0x1EF00000                                                                                                                                                                                                                                                                                        | 0x10400000 | 4      | Hardware ID                                                                       | Bit2: new model                                                                 |
| 0x1EF00004                                                                                                                                                                                                                                                                                        | 0x10400004 | 4      | ?                                                                                 |                                                                                 |
| 0x1EF00010                                                                                                                                                                                                                                                                                        | 0x10400010 | 16     | [Memory Fill1](#Memory_Fill "wikilink") "PSC0"                                    | GX command 2                                                                    |
| 0x1EF00020                                                                                                                                                                                                                                                                                        | 0x10400020 | 16     | [Memory Fill2](#Memory_Fill "wikilink") "PSC1"                                    | GX command 2                                                                    |
| 0x1EF00030                                                                                                                                                                                                                                                                                        | 0x10400030 | 4      | VRAM bank control                                                                 | Bits 8-11 = bank\[i\] disabled; other bits are unused.                          |
| 0x1EF00034                                                                                                                                                                                                                                                                                        | 0x10400034 | 4      | GPU Busy                                                                          | Bit26 = PSC0, bit27 = PSC1, Bit30 = PPF, Bit31 = P3D                            |
| 0x1EF00050                                                                                                                                                                                                                                                                                        | 0x10400050 | 4      | ?                                                                                 | Writes 0x22221200 on GPU init.                                                  |
| 0x1EF00054                                                                                                                                                                                                                                                                                        | 0x10400054 | 4      | ?                                                                                 | Writes 0xFF2 on GPU init.                                                       |
| 0x1EF000C0                                                                                                                                                                                                                                                                                        | 0x104000C0 | 4      | Backlight control                                                                 | Writes 0x0 to allow backlights to turn off, 0x20000000 to force them always on. |
| 0x1EF00400                                                                                                                                                                                                                                                                                        | 0x10400400 | 0x100  | [Framebuffer Setup](#LCD_Source_Framebuffer_Setup "wikilink") "PDC0" (top screen) |                                                                                 |
| 0x1EF00500                                                                                                                                                                                                                                                                                        | 0x10400500 | 0x100  | [Framebuffer Setup](#LCD_Source_Framebuffer_Setup "wikilink") "PDC1" (bottom)     |                                                                                 |
| 0x1EF00C00                                                                                                                                                                                                                                                                                        | 0x10400C00 | ?      | [Transfer Engine](#Transfer_Engine "wikilink") "DMA"                              |                                                                                 |
| 0x1EF01000/0x10401000 - 0x1EF01C00/0x10401C00 maps to [GPU internal registers](GPU/Internal_Registers "wikilink"). These registers are usually not read/written directly here, but are written using the command list interface below (corresponding to the GPUREG_CMDBUF_\* internal registers) |            |        |                                                                                   |                                                                                 |
| 0x1EF01000                                                                                                                                                                                                                                                                                        | 0x10401000 | 0x4    | ?                                                                                 | Writes 0 on GPU init and before the Command List is used                        |
| 0x1EF01080                                                                                                                                                                                                                                                                                        | 0x10401080 | 0x4    | ?                                                                                 | Writes 0x12345678 on GPU init.                                                  |
| 0x1EF010C0                                                                                                                                                                                                                                                                                        | 0x104010C0 | 0x4    | ?                                                                                 | Writes 0xFFFFFFF0 on GPU init.                                                  |
| 0x1EF010D0                                                                                                                                                                                                                                                                                        | 0x104010D0 | 0x4    | ?                                                                                 | Writes 1 on GPU init.                                                           |
| 0x1EF014??                                                                                                                                                                                                                                                                                        | 0x104014?? | 0x14   | "PPF" ?                                                                           |                                                                                 |
| 0x1EF018E0                                                                                                                                                                                                                                                                                        | 0x104018E0 | 0x14   | [Command List](#Command_List "wikilink") "P3D"                                    |                                                                                 |

## Memory Fill

| User VA    | Description                                                                                 |
|------------|---------------------------------------------------------------------------------------------|
| 0x1EF000X0 | Buffer start physaddr \>\> 3                                                                |
| 0x1EF000X4 | Buffer end physaddr \>\> 3                                                                  |
| 0x1EF000X8 | Fill value                                                                                  |
| 0x1EF000XC | Control. bit0: start/busy, bit1: finished, bit8-9: fill-width (0=16bit, 1=3=24bit, 2=32bit) |

Memory fills are used to initialize buffers in memory with a given
value, similar to memset. A memory fill is triggered by setting bit0 in
the control register. Doing so aborts any running memory fills on that
filling unit. Upon completion, the hardware unsets bit0 and sets bit1
and fires interrupt PSC0.

These registers are used by [GX
SetMemoryFill](GSP_Shared_Memory#GX_SetMemoryFill "wikilink").

## LCD Source Framebuffer Setup

All of these registers must be accessed with 32bit operations regardless
of the registers' actual bit size.

The naming of these parameters reflects the physical characteristics of
the displays, and not the way the 3DS is normally held.

To make sense of these values, the 3DS must be held in a way, so that
the bottom screen is in the left hand, and the top screen is in the
right hand, and that way the first pixel will be in the top-left corner,
as it should be. If the 3DS is held normally, the first pixel is in the
bottom-left corner.

All pixel and scanline timing values are 12bits, unless noted. This also
applies to those fields where two u16 are combined into one register.
Each u16 field is only 12bits in size. timin

The horizontal timing parameter order is as follows (values may overflow
through HTotal register value):

`0x10 < 0x14 <= 0x60.LO <= 0x04 <= 0x60.HI <= 0x08 <= 0x0C <= 0x10`
`0x18 <= 0x60.LO`

Timing starts from HCount == 0, then each absolute value in the
beforementioned register chain triggers when HCount == register,
latching the primitive display controller into a new mode. There is an
inherent latch order, where if two simultenaous events occur, one event
wins over another.

`Known latched modes (in order):`
`- HSync (triggers a line to the LCD to move to the next line)`
`- Back porch (area between HSync and border being displayed, no pixels pushed, min 16 pixel clocks, otherwise the screen gets glitchy)`
`- Left border start (no image data is being displayed, just a configurable solid color)`
`- Image start (pixel data is being DMA'd from video memory or main RAM)`
`- Right border start/Image end (border color is being displayed after the main image)`
`- Unknown synchronization (supposed to be probably right border end, but this mode seems to be broken or not do anything)`
`- Front porch (no pixels pushed, 68 clock min, otherwise the screen doesn't sync properly, and really glitches out)`

<table>
<thead>
<tr class="header">
<th><p>Offset</p></th>
<th><p>Name</p></th>
<th><p>Comments</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>0x00</p></td>
<td><p>HTotal</p></td>
<td><p>The total width of a timing scanline. In other words, this is the
horizontal refresh clock divider value.</p>
<p>HClock = PClock / (HTotal + 1)</p></td>
</tr>
<tr class="even">
<td><p>0x04</p></td>
<td><p>HStart</p></td>
<td><p>Determines when the image is going to be displayed in the visible
region (register 0x60).</p></td>
</tr>
<tr class="odd">
<td><p>0x08</p></td>
<td><p>HBR</p></td>
<td><p>Right border start(?). Does nothing.</p>
<p>While this register seems to have no impact on the image whatsoever,
it still has to be set to a valid value.</p></td>
</tr>
<tr class="even">
<td><p>0x0C</p></td>
<td><p>HPF</p></td>
<td><p>Front porch. The image is blanked during this period, and no
pixels are pushed to the LCD.</p>
<p>Unknown why, but a single dot of red is displayed before entering
this mode.</p></td>
</tr>
<tr class="odd">
<td><p>0x10</p></td>
<td><p>HSync</p></td>
<td><p>Triggers a HSync pulse.</p>
<p>Based on behavior, this needs to last at least a pixel clock for the
LCD to register the sync.</p></td>
</tr>
<tr class="even">
<td><p>0x14</p></td>
<td><p>HPB</p></td>
<td><p>Back porch? Has to be at least one bigger than HSync, otherwise
HSync never triggers.</p>
<p>The display is blank, and the LCD displays nothing in this period
(doesn't push pixels).</p></td>
</tr>
<tr class="odd">
<td><p>0x18</p></td>
<td><p>HBL</p></td>
<td><p>Left border trigger treshold. Enables pushing pixels to the
display.</p>
<p>If this value is smaller than the back porch, then the back porch
period will be zero, and the border will be immediately displayed upon
entering the back porch period.</p>
<p>Can be lower than HSync, as the back porch is what takes the
controller out of HSync.</p>
<p>Must be &lt;= HDisp start (reg 0x60 low u16), otherwise no pixels
will be pushed due to a glitched state.</p></td>
</tr>
<tr class="even">
<td><p>0x1C</p></td>
<td><p>H Interrupt timing</p></td>
<td><p>Made up from two u16 values, PDC interrupt line is asserted when
HCount == low u16, and most likely deasserted when HCount == high
u16.</p>
<p>There seems to be some limitations though:</p>
<ul>
<li>low u16 must be smaller than high u16</li>
<li>if low u16 is less than HTotal then high u16 must also be smaller
than HTotal</li>
<li>setting low u16 to &gt;= HTotal disables the interrupt ever
firing</li>
</ul>
<p>This is configured by gsp in a way so that low u16 equals to HTotal,
meaning the HSync interrupt will never fire.</p></td>
</tr>
<tr class="odd">
<td><p>0x20</p></td>
<td><p>low u16: ??? high u16: ???</p></td>
<td><p>???</p></td>
</tr>
<tr class="even">
<td><p>0x24</p></td>
<td><p>VTotal</p></td>
<td><p>Total height of the timing window. Can be interpreted as the
vertical clock divider.</p>
<p>VClock = PClock / (HTotal + 1) / (VTotal + 1)</p>
<p>Setting this to 494 lowers framerate to about 50.040660858 Hz
((268111856 / 24) / (450 + 1) / (494 + 1)).</p></td>
</tr>
<tr class="odd">
<td><p>0x28</p></td>
<td><p>?</p></td>
<td><p>Seems to determine the vertical blanking interval.</p>
<p>Setting this to lower than <code>VTotal - VDisp</code> will cut off
the top <code>VTotal - VDisp - thisvalue</code> lines.</p>
<p>Setting this to higher than <code>VTotal - VDisp</code> will make the
image be pushed downwards with the overscan color visible.</p>
<p>Setting this to higher than <code>HTotal</code> will make the GPU
skip vertical pixel data synchronization (hence filling the screen with
the rest of the pixel data past the given screen framebuffer size). Also
will skip <code>thisvalue + somevalue - HTotal</code> lines into the
"global" pixel buffer.</p></td>
</tr>
<tr class="even">
<td><p>0x30</p></td>
<td><p>?</p></td>
<td><p>Total amount of vertical scanlines in the pixel buffer, must be
bigger than *an unknown blanking-like value*. If this value is less than
VDisp then the last two scanlines will be repeated interlaced until
VDisp is reached.</p></td>
</tr>
<tr class="odd">
<td><p>0x34</p></td>
<td><p>VDisp(?)</p></td>
<td><p>Total amonut of vertical scanlines displayed (only for top screen
it seems like). If this value is less than VTotal then the rest of the
scanlines will not be updated on the screen, so those will slowly fade
out. Must be bigger than *an unknown blanking-like value*, otherwise an
underflow will happen.</p></td>
</tr>
<tr class="even">
<td><p>0x38</p></td>
<td><p>Vertical data offset(?)</p></td>
<td><p>??? Seems to offset the screen upwards if this value is high
enough. If this value is higher or equal to *some value* (aka. if less
than one scanline is displayed on the screen) then the screen will lose
synchronization.</p></td>
</tr>
<tr class="odd">
<td><p>0x40</p></td>
<td><p>V Interrupt timing</p></td>
<td><p>Similar to H Interrupt timing (0x1C), except the comparison is
done against VCount, the limitations are emposed on VTotal, and the
interrupt that fires is VSync.</p>
<p>One important note is that it seems like the VSync interrupt always
fires at HCount == 0, and there doesn't seem to be a register to control
this behavior.</p></td>
</tr>
<tr class="even">
<td><p>0x44</p></td>
<td><p>???</p></td>
<td><p>similar functionality to 0x10</p></td>
</tr>
<tr class="odd">
<td><p>0x48</p></td>
<td><p>???</p></td>
<td><p>bit0 seems to disable HSync, bit8 seems to disable VSync, rest of
the bits aren't writable.</p></td>
</tr>
<tr class="even">
<td><p>0x4C</p></td>
<td><p>Overscan filler color</p></td>
<td><p>24bits(? top 8bits ignored)</p>
<p>When the visible region is being drawn, but the timing parameters are
set up in a way that the framebuffer is smaller than the visible region,
it will be filled by this color.</p></td>
</tr>
<tr class="odd">
<td><p>0x50</p></td>
<td><p>HCount</p></td>
<td><p>Horizontal "beam position" counter. Note that this value does not
equal to the current pixel being drawn.</p></td>
</tr>
<tr class="even">
<td><p>0x54</p></td>
<td><p>VCount</p></td>
<td><p>Vertical "beam position" counter. Note that the scanline being
drawn isn't equal to this value.</p></td>
</tr>
<tr class="odd">
<td><p>0x5C</p></td>
<td><p>???</p></td>
<td><p>low u16: Image width (including some offset?) high u16: Image
height??? (seems to be unused)</p></td>
</tr>
<tr class="even">
<td><p>0x60</p></td>
<td><p>HDisp</p></td>
<td><p>low u16: Image start (border --&gt; pixel data) high u16: Image
end (pixel data --&gt; border)</p></td>
</tr>
<tr class="odd">
<td><p>0x64</p></td>
<td><p>???</p></td>
<td><p>low u16: unknown high u16: framebuffer total height (amount of
scanlines blitted regardless of framebuffer height)</p></td>
</tr>
<tr class="even">
<td><p>0x68</p></td>
<td><p>Framebuffer A first address</p></td>
<td><p>For top screen, this is the left eye 3D framebuffer.</p></td>
</tr>
<tr class="odd">
<td><p>0x6C</p></td>
<td><p>Framebuffer A second address</p></td>
<td><p>For top screen, this is the left eye 3D framebuffer.</p></td>
</tr>
<tr class="even">
<td><p>0x70</p></td>
<td><p>Framebuffer format and other settings</p></td>
<td><p>See <a href="#Framebuffer_format" title="wikilink">framebuffer
format</a></p></td>
</tr>
<tr class="odd">
<td><p>0x74</p></td>
<td><p>PDC control</p></td>
<td><p>Bit 0: Enable display controller. Bit 8: HBlank IRQ mask (0 =
enabled). Bit 9: VBlank IRQ mask (0 = enabled). Bit 10: Error IRQ mask?
(0 = enabled). Bit 16: Output enable?</p></td>
</tr>
<tr class="even">
<td><p>0x78</p></td>
<td><p>Framebuffer select and status</p></td>
<td><p>Bit 0: Next framebuffer to display (after VBlank). Bit 4:
Currently displaying framebuffer? Bit 8: Reset FIFO? Bit 16: HBlank IRQ
status/ack. Write 1 to aknowledge. Bit 17: VBlank IRQ status/ack. Bit
18: Error IRQ status/ack?</p></td>
</tr>
<tr class="odd">
<td><p>0x80</p></td>
<td><p>Color lookup table index select</p></td>
<td><p>8bits, write-only</p></td>
</tr>
<tr class="even">
<td><p>0x84</p></td>
<td><p>Color lookup table indexed element</p></td>
<td><p>Contains the value of the color lookup table indexed by the above
register, 24bits, RGB8 (0x00BBGGRR) Accessing this register will
increase the index register by one</p></td>
</tr>
<tr class="odd">
<td><p>0x90</p></td>
<td><p>Framebuffer stride</p></td>
<td><p>32bits (bottom 3bits ignored?)</p>
<p>Distance in bytes between the start of two framebuffer rows (must be
a multiple of 8).</p>
<p>In other words, this can be interpreted as the amount to add to the
framebuffer pointer after displaying a scanline.</p>
<p>Setting this to zero will cause only the first line of the image to
be displayed repeated on the entire display. With the HSync interrupt
it's possible to "race the beam" to (ab)use this feature.</p>
<p>Because of this simplicity, writing a negative value here VFlips the
image, although that requires the framebuffer pointer register to be set
to the start of the last scanline, instead of at the start of the
framebuffer.</p></td>
</tr>
<tr class="even">
<td><p>0x94</p></td>
<td><p>Framebuffer B first address</p></td>
<td><p>For top screen, this is the right eye 3D framebuffer. Unused for
bottom screen in userland.</p></td>
</tr>
<tr class="odd">
<td><p>0x98</p></td>
<td><p>Framebuffer B second address</p></td>
<td><p>For top screen, this is the right eye 3D framebuffer. Unused for
bottom screen in userland.</p></td>
</tr>
</tbody>
</table>

### Framebuffer format

<table>
<thead>
<tr class="header">
<th><p>Bit</p></th>
<th><p>Description</p></th>
</tr>
</thead>
<tbody>
<tr class="odd">
<td><p>2-0</p></td>
<td><p><a href="#Framebuffer_color_formats" title="wikilink">Color
format</a></p></td>
</tr>
<tr class="even">
<td><p>5-4</p></td>
<td><p>Framebuffer scanline output mode (framebuffer interleave
config)</p>
<p><code>0 - A  (output image as normal)</code><br />
<code>1 - AA (output a single line twice, so framebuffer A is interleaved with itself)</code><br />
<code>2 - AB (interleave framebuffer A and framebuffer B)</code><br />
<code>3 - BA (same as above, but the line from framebuffer B is outputted first)</code></p>
<p>0 is used by bottom screen at all times. 1 is used by the top screen
in 2D mode. 2 is used by top screen in 3D mode. 3 goes unused in
userland.</p></td>
</tr>
<tr class="odd">
<td><p>6</p></td>
<td><p>Scan doubling enable?* (used by top screen)</p></td>
</tr>
<tr class="even">
<td><p>7</p></td>
<td><p>?</p></td>
</tr>
<tr class="odd">
<td><p>9-8</p></td>
<td><p>DMA size</p>
<p><code>0 -  4 words (32 bytes)</code><br />
<code>1 -  8 words (64 bytes)</code><br />
<code>2 - 16 words (128 bytes)</code><br />
<code>3 - ???</code></p>
<p>FCRAM doesn't support DMA size 3, as it can only burst up to 16 words
(128 bytes), and will show a black screen instead.</p></td>
</tr>
<tr class="even">
<td><p>31-16</p></td>
<td><p>Unknown</p></td>
</tr>
</tbody>
</table>

- The weird thing about scan doubling, is that it works different
  between the bottom and top LCD. On the bottom LCD, it doubles the
  number of outputted pixels (so the same pixel is outputted twice,
  effectively doing column doubling). However on the top screen, it does
  scanline doubling instead. Considering that the bottom screen's table
  doesn't work on the top screen, this could give a hint as to how the
  top screen receives the pixel data from the PDC.

On a 2DS, it seems to have no effect on the top part of the display, and
on the bottom screen it just shifts the framebuffer to the right two
pixels.

GSP module only allows the LCD stereoscopy to be enabled when bit5=1 and
bit6=0 here. When GSP module updates this register, GSP module will
automatically disable the stereoscopy if those bits are not set for
enabling stereoscopy.

When both interlacing and scan doubling are disabled, the full
resolution of the top screen (240x800) can be utilized if the PDC
registers are updated to accomodate this higher resolution. GSP contains
tables for this mode (gsp mode == 1). GSP automatically applies this
mode if both bit5 and bit6 are cleared. This is also the default, and
the only valid mode for the bottom screen in userland.

If only AB interlacing is enabled, gsp detects this as a request to
switch to 3D mode (gsp mode == 2), and enables the parallax barrier.
It's unknown how to control this, but some other PDC registers control
if interlacing should be done by true interleaving (both framebuffers
are treated as 240x400), or skipping lines (both framebuffers are
treated as 240x800)

If only scan doubling is enabled, gsp detects it as a request to switch
back to 2D mode for the top screen (gsp mode == 0). This is also the
default mode for the top screen.

Both interlacing and scan doubling can't be enabled in usermode, but it
works as expected in baremetal.

### Framebuffer color formats

| Value | Description    |
|-------|----------------|
| 0     | GL_RGBA8_OES   |
| 1     | GL_RGB8_OES    |
| 2     | GL_RGB565_OES  |
| 3     | GL_RGB5_A1_OES |
| 4     | GL_RGBA4_OES   |

Color components are laid out in reverse byte order, with the most
significant bits used first (i.e. non-24-bit pixels are stored as a
little-endian values). For instance, a raw data stream of two
GL_RGB565_OES pixels looks like GGGBBBBB RRRRRGGG GGGBBBBB RRRRRGGG.

Color formats 5, 6, and 7 are blocked by gsp, but they behave as
pixel-doubled RGBA8 (not line doubling, but instead the same pixel is
output twice) if used outside of userland.

## Transfer Engine

| Register address | Description                                                                       |
|------------------|-----------------------------------------------------------------------------------|
| 0x1EF00C00       | Input physical address \>\> 3                                                     |
| 0x1EF00C04       | Output physical address \>\> 3                                                    |
| 0x1EF00C08       | DisplayTransfer output width (bits 0-15) and height (bits 16-31).                 |
| 0x1EF00C0C       | DisplayTransfer input width and height.                                           |
| 0x1EF00C10       | Transfer flags. (See below)                                                       |
| 0x1EF00C14       | GSP module writes value 0 here prior to writing to 0x1EF00C18, for cmd3.          |
| 0x1EF00C18       | Setting bit0 starts the transfer. Upon completion, bit0 is unset and bit8 is set. |
| 0x1EF00C1C       | ?                                                                                 |
| 0x1EF00C20       | TextureCopy total amount of data to copy, in bytes.                               |
| 0x1EF00C24       | TextureCopy input line width (bits 0-15) and gap (bits 16-31), in 16 byte units.  |
| 0x1EF00C28       | TextureCopy output line width and gap.                                            |

These registers are used by [GX command](GSP_Shared_Memory "wikilink") 3
and 4. For cmd4, \*0x1EF00C18 \|= 1 is used instead of just writing
value 1. The DisplayTransfer registers are only used if bit 3 of the
flags is unset and ignored otherwise. The TextureCopy registers are
likewise only used if bit 3 is set, and ignored otherwise.

#### Flags Register - 0x1EF00C10

| Bit   | Description                                                                                                                                                               |
|-------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| 0     | When set, the framebuffer data is flipped vertically.                                                                                                                     |
| 1     | When set, the input framebuffer is treated as linear and converted to tiled in the output, converts tiled-\>linear when unset.                                            |
| 2     | This bit is required when the output width is less than the input width for the hardware to properly crop the lines, otherwise the output will be mis-aligned.            |
| 3     | Uses a TextureCopy mode transfer. See below for details.                                                                                                                  |
| 4     | Not writable                                                                                                                                                              |
| 5     | Don't perform tiled-linear conversion. Incompatible with bit 1, so only tiled-tiled transfers can be done, not linear-linear.                                             |
| 7-6   | Not writable                                                                                                                                                              |
| 10-8  | Input framebuffer color format, value0 and value1 are the same as the [LCD Source Framebuffer Formats](GPU_Registers#Framebuffer_color_formats "wikilink") (usually zero) |
| 11    | Not writable                                                                                                                                                              |
| 14-12 | Output framebuffer color format                                                                                                                                           |
| 15    | Not writable                                                                                                                                                              |
| 16    | Use 32x32 block tiling mode, instead of the usual 8x8 one. Output dimensions must be multiples of 32, even if cropping with bit 2 set above.                              |
| 17-23 | Not writable                                                                                                                                                              |
| 24-25 | Scale down the input image using a box filter. 0 = No downscale, 1 = 2x1 downscale. 2 = 2x2 downscale, 3 = invalid                                                        |
| 31-26 | Not writable                                                                                                                                                              |

### TextureCopy

When bit 3 of the control register is set, the hardware performs a
TextureCopy-mode transfer. In this mode, all other bits of the control
register (except for bit 2, which still needs to be set correctly) and
the regular dimension registers are ignored, and no format conversions
are done. Instead, it performs a raw data copy from the source to the
destination, but with a configurable gap between lines. The total amount
of bytes to copy is specified in the size register, and the hardware
loops reading lines from the input and writing them to the output until
this amount is copied. The "gap" specified in the input/output dimension
register is the number of chunks to skip after each "width" chunks of
the input/output, and is NOT counted towards the total size of the
transfer.

By correctly calculating the input and output gap sizes it is possible
to use this functionality to copy arbitrary sub-rectangles between
differently-sized framebuffers or textures, which is one of its main
uses over a regular no-conversion DisplayTransfer. When copying tiled
textures/framebuffers it's important to remember that the contents of a
tile are laid out sequentially in memory, and so this should be taken
into account when calculating the transfer parameters.

Specifying invalid/junk values for the TextureCopy dimensions can result
in the GPU hanging while attempting to process this TextureCopy.

## Command List

| Register address | Description                                                                                               |
|------------------|-----------------------------------------------------------------------------------------------------------|
| 0x1EF018E0       | Buffer size in bytes \>\> 3                                                                               |
| 0x1EF018E8       | Buffer physical address \>\> 3                                                                            |
| 0x1EF018F0       | Setting bit0 to 1 enables processing GPU command execution. Upon completion, bit0 seems to be reset to 0. |

These 3 registers are used by [GX
command](GSP_Shared_Memory "wikilink") 1. This is used for [GPU
commands](GPU/Internal_Registers "wikilink").

## Framebuffers

These LCD framebuffers normally contain the last rendered frames from
the GPU. The framebuffers are drawn from left-to-right, instead of
top-to-bottom.(Thus the beginning of the framebuffer is drawn starting
at the left side of the screen)

Both of the 3D screen left/right framebuffers are displayed regardless
of the 3D slider's state, however when the 3D slider is set to "off" the
3D effect is disabled. Normally when the 3D slider's state is set to
"off" the left/right framebuffer addresses are set to the same physical
address. When the 3D effect is disabled and the left/right framebuffers
are set to separate addresses, the LCD seems to alternate between
displaying the left/right framebuffer each frame.

#### Init Values from nngxInitialize for Top Screen

- 0x1EF00400 = 0x1C2
- 0x1EF00404 = 0xD1
- 0x1EF00408 = 0x1C1
- 0x1EF0040C = 0x1C1
- 0x1EF00410 = 0
- 0x1EF00414 = 0xCF
- 0x1EF00418 = 0xD1
- 0x1EF0041C = 0x1C501C1
- 0x1EF00420 = 0x10000
- 0x1EF00424 = 0x19D
- 0x1EF00428 = 2
- 0x1EF0042C = 0x1C2
- 0x1EF00430 = 0x1C2
- 0x1EF00434 = 0x1C2
- 0x1EF00438 = 1
- 0x1EF0043C = 2
- 0x1EF00440 = 0x1960192
- 0x1EF00444 = 0
- 0x1EF00448 = 0
- 0x1EF0045C = 0x19000F0
- 0x1EF00460 = 0x1c100d1
- 0x1EF00464 = 0x1920002
- 0x1EF00470 = 0x80340
- 0x1EF0049C = 0

#### More Init Values from nngxInitialize for Top Screen

- 0x1EF00468 = 0x18300000, later changed by GSP module when updating
  state, framebuffer
- 0x1EF0046C = 0x18300000, later changed by GSP module when updating
  state, framebuffer
- 0x1EF00494 = 0x18300000
- 0x1EF00498 = 0x18300000
- 0x1EF00478 = 1, doesn't stay 1, read as 0
- 0x1EF00474 = 0x10501

[Category:GPU](Category:GPU "wikilink")